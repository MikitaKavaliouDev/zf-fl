import 'dart:developer' as developer;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/di/injection.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../analytics/data/models/analytics_response_dto.dart';
import '../../../analytics/presentation/widgets/volume_line_chart_widget.dart';
import '../../cubit/trainer_client_analytics_cubit.dart';
import '../../cubit/trainer_client_analytics_state.dart';
import '../../cubit/trainer_client_detail_cubit.dart';
import '../../cubit/trainer_client_detail_state.dart';
import '../../cubit/trainer_client_habits_cubit.dart';
import '../../cubit/trainer_client_habits_state.dart';
import '../../cubit/trainer_client_nutrition_cubit.dart';
import '../../cubit/trainer_client_nutrition_state.dart';
import '../../data/models/client_analytics_dto.dart';
import '../../data/models/create_habit_request_dto.dart';
import '../../data/models/log_habit_request_dto.dart';
import '../../data/models/request_check_in_dto.dart';
import '../../data/models/trainer_client_active_program_dto.dart';
import '../../data/models/trainer_client_detail_dto.dart';
import '../../data/models/trainer_client_package_dto.dart';
import '../../data/models/trainer_client_session_dto.dart';
import '../../data/models/update_habit_request_dto.dart';
import '../../data/trainer_clients_api_service.dart';
import 'trainer_assign_program_sheet.dart';
import 'trainer_nutrition_plan_editor_sheet.dart';

/// Full client detail — single scroll view matching iOS ClientDetailView.
///
/// Layout (from iOS ClientDetailView.swift):
///   1. Profile header (avatar, name, email, status, info rows)
///   2. Active Program Card (progress bar + cancel)
///   3. Nutrition Plan Card (inline macro pills + "View Details")
///   4. Active Package Card (green + sessions remaining)
///   5. Start Workout Session Button (blue gradient)
///   6. Management Actions (Request Check-in + Assign Program)
///   7. Recent Activity (last 5 sessions + "View Full History")
class TrainerClientDetailScreen extends StatefulWidget {
  final String clientId;

  const TrainerClientDetailScreen({super.key, required this.clientId});

  @override
  State<TrainerClientDetailScreen> createState() =>
      _TrainerClientDetailScreenState();
}

class _TrainerClientDetailScreenState
    extends State<TrainerClientDetailScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<TrainerClientDetailCubit>().loadClient(widget.clientId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: const ValueKey('trainerClientDetailScreen'),
      backgroundColor: AppColors.background,
      appBar: AppBar(title: const Text('Client')),
      body: BlocBuilder<TrainerClientDetailCubit, TrainerClientDetailState>(
        builder: (context, state) {
          return switch (state) {
            TrainerClientDetailInitial() || TrainerClientDetailLoading() =>
              const Center(
                  child: CircularProgressIndicator(color: AppColors.primary)),
            TrainerClientDetailError(:final message) => Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(message,
                        style:
                            const TextStyle(color: AppColors.mutedText)),
                    const SizedBox(height: 12),
                    FilledButton.icon(
                      onPressed: () => context
                          .read<TrainerClientDetailCubit>()
                          .loadClient(widget.clientId),
                      icon: const Icon(Icons.refresh_rounded),
                      label: const Text('Retry'),
                    ),
                  ],
                ),
              ),
            TrainerClientDetailLoaded(:final client) =>
              _ClientDetailBody(clientId: client.id, clientName: client.name, client: client),
          };
        },
      ),
    );
  }
}

/// The full scrollable body — mirrors iOS ClientDetailView sections.
class _ClientDetailBody extends StatelessWidget {
  final String clientId;
  final String clientName;
  final TrainerClientDetailDto client;

  const _ClientDetailBody({
    required this.clientId,
    required this.clientName,
    required this.client,
  });

  @override
  Widget build(BuildContext context) {
    return _OverviewSection(clientId: clientId, clientName: clientName, client: client);
  }
}

// ── Overview Section (matches iOS ClientDetailView inline cards) ──

class _OverviewSection extends StatefulWidget {
  final String clientId;
  final String clientName;
  final TrainerClientDetailDto? client;

  const _OverviewSection({
    required this.clientId,
    required this.clientName,
    this.client,
  });

  @override
  State<_OverviewSection> createState() => _OverviewSectionState();
}

class _OverviewSectionState extends State<_OverviewSection> {
  final _api = getIt<TrainerClientsApiService>();

  TrainerClientActiveProgramDto? _activeProgram;
  List<TrainerClientPackageDto> _packages = [];
  List<TrainerClientSessionDto> _recentSessions = [];
  bool _isLoadingProgram = true;
  bool _isLoadingPackages = true;
  bool _isLoadingSessions = true;
  bool _isCancellingProgram = false;

  @override
  void initState() {
    super.initState();
    _loadAll();
  }

  Future<void> _loadAll() async {
    await Future.wait([
      _loadActiveProgram(),
      _loadPackages(),
      _loadRecentSessions(),
    ]);
  }

  Future<void> _loadActiveProgram() async {
    try {
      final program = await _api.getClientActiveProgram(widget.clientId);
      if (mounted) setState(() { _activeProgram = program; _isLoadingProgram = false; });
    } catch (_) {
      if (mounted) setState(() => _isLoadingProgram = false);
    }
  }

  Future<void> _loadPackages() async {
    try {
      final packages = await _api.getClientPackages(widget.clientId);
      if (mounted) setState(() { _packages = packages; _isLoadingPackages = false; });
    } catch (_) {
      if (mounted) setState(() => _isLoadingPackages = false);
    }
  }

  Future<void> _loadRecentSessions() async {
    try {
      final sessions = await _api.getClientSessions(widget.clientId, limit: 5);
      if (mounted) setState(() { _recentSessions = sessions; _isLoadingSessions = false; });
    } catch (_) {
      if (mounted) setState(() => _isLoadingSessions = false);
    }
  }

  Future<void> _cancelProgram() async {
    if (_activeProgram == null) return;
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Cancel Program'),
        content: Text('Are you sure you want to cancel "${_activeProgram!.program.name}" for ${widget.clientName}? This will remove all scheduled sessions.'),
        actions: [
          TextButton(onPressed: () => Navigator.of(ctx).pop(false), child: const Text('Keep Program')),
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(true),
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: const Text('Cancel Program'),
          ),
        ],
      ),
    );
    if (confirmed == true) {
      setState(() => _isCancellingProgram = true);
      try {
        await _api.cancelProgramAssignment(widget.clientId, _activeProgram!.program.id);
        if (mounted) setState(() { _activeProgram = null; _isCancellingProgram = false; });
      } catch (e) {
        if (mounted) setState(() => _isCancellingProgram = false);
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Failed to cancel: $e')),
          );
        }
      }
    }
  }

  Future<void> _requestCheckIn() async {
    try {
      await _api.requestCheckIn(RequestCheckInDto(
        clientId: widget.clientId,
        checkInType: 'WEEKLY',
        dueDate: DateTime.now().add(const Duration(days: 7)).toIso8601String(),
      ));
      if (mounted) {
        showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: const Text('Check-in Requested'),
            content: Text('A notification has been sent to ${widget.clientName} requesting their weekly progress check-in.'),
            actions: [TextButton(onPressed: () => Navigator.of(ctx).pop(), child: const Text('OK'))],
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to request check-in: $e')),
        );
      }
    }
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 110,
            child: Text(label,
                style: const TextStyle(
                    fontSize: 12, fontWeight: FontWeight.w500, color: AppColors.mutedText)),
          ),
          Expanded(
            child: Text(value,
                style: const TextStyle(fontSize: 13, color: AppColors.foreground)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final activePackage = _packages.cast<TrainerClientPackageDto?>().firstWhere(
      (p) => p != null && p.sessionsRemaining > 0,
      orElse: () => null,
    );

    return RefreshIndicator(
      onRefresh: _loadAll,
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // ── Profile Header ──
          if (widget.client != null) ...[
            Row(
              children: [
                CircleAvatar(
                  radius: 32,
                  backgroundColor: AppColors.primary.withValues(alpha: 0.15),
                  child: Text(
                    widget.client!.name.isNotEmpty
                        ? widget.client!.name[0].toUpperCase()
                        : '?',
                    style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: AppColors.primary),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.client!.name,
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w700)),
                      if (widget.client!.email != null)
                        Text(widget.client!.email!,
                            style: const TextStyle(
                                fontSize: 13, color: AppColors.mutedText)),
                      const SizedBox(height: 4),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 3),
                        decoration: BoxDecoration(
                          color: widget.client!.status == 'active'
                              ? const Color(0xFF34C759).withValues(alpha: 0.15)
                              : AppColors.mutedText.withValues(alpha: 0.15),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          widget.client!.status[0].toUpperCase() +
                              widget.client!.status.substring(1),
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                            color: widget.client!.status == 'active'
                                ? const Color(0xFF34C759)
                                : AppColors.mutedText,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            // Profile info rows
            if (widget.client!.goals != null ||
                widget.client!.healthNotes != null ||
                widget.client!.emergencyContactName != null) ...[
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppColors.card,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColors.borderMuted),
                ),
                child: Column(
                  children: [
                    if (widget.client!.goals != null)
                      _buildInfoRow('Goals', widget.client!.goals!),
                    if (widget.client!.healthNotes != null) ...[
                      const Divider(height: 12),
                      _buildInfoRow('Health Notes', widget.client!.healthNotes!),
                    ],
                    if (widget.client!.emergencyContactName != null) ...[
                      const Divider(height: 12),
                      _buildInfoRow('Emergency Contact', widget.client!.emergencyContactName!),
                    ],
                  ],
                ),
              ),
            ],
            const SizedBox(height: 24),
          ],

          // Active Program Card
          if (_isLoadingProgram)
            const _SkeletonCard()
          else if (_activeProgram != null) ...[
            const Text('Active Program',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.foreground)),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.card,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColors.borderMuted),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(_activeProgram!.program.name,
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.foreground)),
                  const SizedBox(height: 8),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: LinearProgressIndicator(
                      value: _activeProgram!.progress.progressPercentage / 100,
                      backgroundColor: AppColors.mutedSurface,
                      valueColor: const AlwaysStoppedAnimation<Color>(AppColors.primary),
                      minHeight: 6,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text('${_activeProgram!.progress.completedCount}/${_activeProgram!.progress.totalCount} sessions',
                      style: const TextStyle(fontSize: 12, color: AppColors.mutedText)),
                  const SizedBox(height: 8),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton.icon(
                      onPressed: _isCancellingProgram ? null : _cancelProgram,
                      icon: const Icon(Icons.cancel_outlined, size: 16),
                      label: Text(_isCancellingProgram ? 'Cancelling...' : 'Cancel Program'),
                      style: OutlinedButton.styleFrom(foregroundColor: Colors.red),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
          ],

          // ── Nutrition Card (inline, tappable → full detail screen) ──
          const Text('Nutrition',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.foreground)),
          const SizedBox(height: 8),
          InkWell(
            onTap: () => context.push('/trainer/clients/${widget.clientId}/nutrition'),
            borderRadius: BorderRadius.circular(16),
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.card,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColors.borderMuted),
              ),
              child: Row(
                children: [
                  const Icon(Icons.restaurant, size: 20, color: Color(0xFF34C759)),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('View Nutrition Plan',
                            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: AppColors.foreground)),
                        const Text('Macro targets & habits',
                            style: TextStyle(fontSize: 12, color: AppColors.mutedText)),
                      ],
                    ),
                  ),
                  const Icon(Icons.chevron_right, size: 16, color: AppColors.mutedText),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),

          // Active Package Card
          if (!_isLoadingPackages && activePackage != null) ...[
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF34C759),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(activePackage.package.name,
                            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
                        Text('${activePackage.sessionsRemaining} sessions remaining',
                            style: const TextStyle(fontSize: 12, color: Colors.white70)),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Text('Start Session',
                        style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Colors.white)),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
          ],

          // Start Workout Session Button
          SizedBox(
            width: double.infinity,
            child: FilledButton.icon(
              onPressed: () {
                developer.log('Start session for client: ${widget.clientId}', name: 'trainer');
              },
              icon: const Icon(Icons.play_arrow_rounded),
              label: const Text('Start Workout Session'),
              style: FilledButton.styleFrom(
                backgroundColor: AppColors.primary,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              ),
            ),
          ),
          const SizedBox(height: 16),

          // Management Actions
          Row(
            children: [
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: _requestCheckIn,
                  icon: const Icon(Icons.calendar_month_outlined, size: 18),
                  label: const Text('Request Check-in', style: TextStyle(fontSize: 13)),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: const Color(0xFFFF9500),
                    side: BorderSide(color: const Color(0xFFFF9500).withValues(alpha: 0.3)),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                      ),
                      builder: (_) => TrainerAssignProgramSheet(clientId: widget.clientId),
                    );
                  },
                  icon: const Icon(Icons.assignment_outlined, size: 18),
                  label: const Text('Assign Program', style: TextStyle(fontSize: 13)),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: AppColors.primary,
                    side: BorderSide(color: AppColors.primary.withValues(alpha: 0.3)),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Recent Activity
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Recent Activity',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.foreground)),
              if (!_isLoadingSessions)
                TextButton(
                  onPressed: () => context.push('/trainer/clients/${widget.clientId}/history', extra: widget.clientName),
                  child: const Text('View Full History', style: TextStyle(fontSize: 13)),
                ),
            ],
          ),
          const SizedBox(height: 8),
          if (_isLoadingSessions)
            const _SkeletonCard()
          else if (_recentSessions.isEmpty)
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: AppColors.card,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColors.borderMuted),
              ),
              child: const Column(
                children: [
                  Icon(Icons.history, size: 32, color: AppColors.mutedText),
                  SizedBox(height: 8),
                  Text('No recent activity', style: TextStyle(fontSize: 14, color: AppColors.mutedText)),
                ],
              ),
            )
          else
            ..._recentSessions.take(5).map((s) => _buildSessionRow(s)),
        ],
      ),
    );
  }

  Widget _buildSessionRow(TrainerClientSessionDto session) {
    String label;
    try {
      final dt = DateTime.parse(session.startTime);
      const months = ['', 'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
      label = '${months[dt.month]} ${dt.day}';
    } catch (_) {
      label = session.startTime;
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.borderMuted),
      ),
      child: Row(
        children: [
          // Date box
          Container(
            width: 44,
            padding: const EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
              color: AppColors.mutedSurface,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: [
                Text(label.contains(' ') ? label.split(' ')[0] : '',
                    style: const TextStyle(fontSize: 10, color: Colors.red, fontWeight: FontWeight.w600)),
                Text(label.contains(' ') ? label.split(' ')[1] : '',
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.foreground)),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(session.name.isNotEmpty ? session.name : 'Workout Session',
                    style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                    maxLines: 1, overflow: TextOverflow.ellipsis),
                const SizedBox(height: 4),
                Row(
                  children: [
                    if (session.endTime != null) ...[
                      Icon(Icons.timer_outlined, size: 12, color: AppColors.mutedText),
                      const SizedBox(width: 4),
                      Text(_formatDuration(session.startTime, session.endTime!),
                          style: const TextStyle(fontSize: 11, color: AppColors.mutedText)),
                    ],
                    if (session.status == 'COMPLETED') ...[
                      const SizedBox(width: 12),
                      const Icon(Icons.check_circle, size: 12, color: Color(0xFF34C759)),
                      const SizedBox(width: 4),
                      const Text('Completed', style: TextStyle(fontSize: 11, color: Color(0xFF34C759))),
                    ],
                  ],
                ),
              ],
            ),
          ),
          const Icon(Icons.chevron_right, size: 16, color: AppColors.mutedText),
        ],
      ),
    );
  }

  String _formatDuration(String start, String end) {
    try {
      final diff = DateTime.parse(end).difference(DateTime.parse(start));
      return '${diff.inMinutes}m';
    } catch (_) {
      return '0m';
    }
  }
}

class _SkeletonCard extends StatelessWidget {
  const _SkeletonCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.borderMuted),
      ),
      child: const Center(child: CircularProgressIndicator(color: AppColors.primary)),
    );
  }
}

// ── Profile Header ──

class _ProfileHeader extends StatelessWidget {
  final TrainerClientDetailDto client;

  const _ProfileHeader({required this.client});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          CircleAvatar(
            radius: 32,
            backgroundColor: AppColors.primary.withValues(alpha: 0.15),
            child: Text(
              client.name.isNotEmpty ? client.name[0].toUpperCase() : '?',
              style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primary),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(client.name,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w700)),
                if (client.email != null)
                  Text(client.email!,
                      style: const TextStyle(
                          fontSize: 13, color: AppColors.mutedText)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ── Tabs ──

class _ProfileTab extends StatelessWidget {
  final TrainerClientDetailDto client;

  const _ProfileTab({required this.client});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _InfoRow(label: 'Email', value: client.email ?? '—'),
        _InfoRow(label: 'Phone', value: client.phone ?? '—'),
        _InfoRow(label: 'Status', value: client.status),
        _InfoRow(label: 'Goals', value: client.goals ?? '—'),
        _InfoRow(label: 'Health Notes', value: client.healthNotes ?? '—'),
        _InfoRow(
            label: 'Emergency Contact',
            value: client.emergencyContactName ?? '—'),
        if (client.emergencyContactPhone != null)
          _InfoRow(
              label: 'Emergency Phone',
              value: client.emergencyContactPhone!),
      ],
    );
  }
}

class _ProgramsTab extends StatelessWidget {
  final String clientId;

  const _ProgramsTab({required this.clientId});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('No program assigned.',
                style: TextStyle(color: AppColors.mutedText)),
            const SizedBox(height: 16),
            FilledButton.icon(
              onPressed: () => showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                shape: const RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(20)),
                ),
                builder: (_) =>
                    TrainerAssignProgramSheet(clientId: clientId),
              ),
              icon: const Icon(Icons.add_rounded),
              label: const Text('Assign Program'),
            ),
          ],
        ),
      ),
    );
  }
}

class _AnalyticsTab extends StatelessWidget {
  final String clientId;

  const _AnalyticsTab({required this.clientId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TrainerClientAnalyticsCubit>(
      create: (_) {
        final cubit = getIt<TrainerClientAnalyticsCubit>();
        cubit.loadAnalytics(clientId);
        return cubit;
      },
      child: BlocBuilder<TrainerClientAnalyticsCubit,
          TrainerClientAnalyticsState>(
        builder: (context, state) {
          return switch (state) {
            TrainerClientAnalyticsInitial() ||
            TrainerClientAnalyticsLoading() =>
              const Center(
                child: CircularProgressIndicator(
                  color: AppColors.primary,
                ),
              ),
            TrainerClientAnalyticsError(:final message) => Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      message,
                      style: const TextStyle(color: AppColors.mutedText),
                    ),
                    const SizedBox(height: 12),
                    FilledButton.icon(
                      onPressed: () => context
                          .read<TrainerClientAnalyticsCubit>()
                          .loadAnalytics(clientId),
                      icon: const Icon(Icons.refresh_rounded),
                      label: const Text('Retry'),
                    ),
                  ],
                ),
              ),
            TrainerClientAnalyticsLoaded(:final analytics) =>
              _AnalyticsContent(
                clientId: clientId,
                analytics: analytics,
              ),
          };
        },
      ),
    );
  }
}

/// Content body for the analytics tab with period selector and chart sections.
class _AnalyticsContent extends StatefulWidget {
  final String clientId;
  final ClientAnalyticsDto analytics;

  const _AnalyticsContent({
    required this.clientId,
    required this.analytics,
  });

  @override
  State<_AnalyticsContent> createState() => _AnalyticsContentState();
}

class _AnalyticsContentState extends State<_AnalyticsContent> {
  Set<String> _selectedPeriod = {'30'};

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        // ── a) Period selector ──
        SegmentedButton<String>(
          segments: const [
            ButtonSegment(value: '7', label: Text('7D')),
            ButtonSegment(value: '30', label: Text('30D')),
            ButtonSegment(value: '90', label: Text('90D')),
            ButtonSegment(value: '180', label: Text('180D')),
            ButtonSegment(value: '365', label: Text('1Y')),
          ],
          selected: _selectedPeriod,
          onSelectionChanged: (sel) {
            setState(() => _selectedPeriod = sel);
            developer.log(
              'Period changed to ${sel.first} days',
              name: 'trainer',
            );
            context
                .read<TrainerClientAnalyticsCubit>()
                .loadAnalytics(widget.clientId);
          },
          style: const ButtonStyle(
            visualDensity: VisualDensity.compact,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
        ),

        // ── b) Volume Progression chart ──
        const SizedBox(height: 16),
        const Text(
          'Volume Progression',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: AppColors.foreground,
          ),
        ),
        const SizedBox(height: 12),
        VolumeLineChartWidget(
          data: widget.analytics.volumeHistory
              .map((v) => VolumeDataPoint(
                    date: v.date,
                    volume: v.volume,
                  ))
              .toList(),
        ),
        const SizedBox(height: 24),

        // ── c) Summary Cards row ──
        Row(
          children: [
            Expanded(
              child: _SummaryCard(
                title: 'Volume',
                value: widget.analytics.volumeHistory.isNotEmpty
                    ? '${widget.analytics.volumeHistory.last.volume.toInt()} kg'
                    : '0 kg',
                subtitle: 'Trend',
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _SummaryCard(
                title: 'Consistency',
                value: '${(widget.analytics.consistency * 100).toInt()}%',
                subtitle: 'Rate',
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),

        // ── d) Muscle Distribution section ──
        const Text(
          'Muscle Distribution',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: AppColors.foreground,
          ),
        ),
        const SizedBox(height: 12),
        ...widget.analytics.muscleDistribution.asMap().entries.map(
          (entry) {
            final item = entry.value;
            final color = _muscleColors[entry.key % _muscleColors.length];
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Row(
                children: [
                  Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: color,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    item.muscle,
                    style: const TextStyle(fontSize: 14),
                  ),
                  const Spacer(),
                  Text(
                    item.count.toString(),
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
        const SizedBox(height: 24),

        // ── e) Personal Records section ──
        const Text(
          'Personal Records',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: AppColors.foreground,
          ),
        ),
        const SizedBox(height: 12),
        if (widget.analytics.recentPRs.isEmpty)
          const Text(
            'No personal records yet',
            style: TextStyle(fontSize: 14, color: AppColors.mutedText),
          )
        else
          ...widget.analytics.recentPRs.map(
            (pr) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Row(
                children: [
                  const Icon(
                    Icons.emoji_events,
                    size: 16,
                    color: Colors.amber,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    pr.exercise,
                    style: const TextStyle(fontSize: 14),
                  ),
                  const Spacer(),
                  Text(
                    '${pr.value} ${pr.type}',
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
            ),
          ),
        const SizedBox(height: 24),

        // ── f) Consistency Heatmap section ──
        const Text(
          'Consistency',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: AppColors.foreground,
          ),
        ),
        const SizedBox(height: 12),
        _HeatmapGrid(heatmapDates: widget.analytics.heatmapDates),
        const SizedBox(height: 8),
        const Text(
          'Last 28 days',
          style: TextStyle(fontSize: 12, color: AppColors.mutedText),
        ),
      ],
    );
  }
}

/// Cycling palette for muscle distribution dots.
const List<Color> _muscleColors = [
  Colors.blue,
  Colors.red,
  Colors.green,
  Colors.orange,
  Colors.purple,
  Colors.teal,
  Colors.pink,
  Colors.indigo,
  Colors.amber,
  Colors.cyan,
];

/// Summary metric card used in the analytics summary row.
class _SummaryCard extends StatelessWidget {
  final String title;
  final String value;
  final String subtitle;

  const _SummaryCard({
    required this.title,
    required this.value,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.borderMuted),
      ),
      child: Column(
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 12,
              color: AppColors.mutedText,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            subtitle,
            style: const TextStyle(
              fontSize: 12,
              color: AppColors.mutedText,
            ),
          ),
        ],
      ),
    );
  }
}

/// 4×7 heatmap grid showing workout consistency over the last 28 days.
class _HeatmapGrid extends StatelessWidget {
  final List<String> heatmapDates;

  const _HeatmapGrid({required this.heatmapDates});

  @override
  Widget build(BuildContext context) {
    final heatmapSet = heatmapDates.toSet();
    final now = DateTime.now();
    final days = List.generate(
      28,
      (i) => now.subtract(Duration(days: 27 - i)),
    );

    return Wrap(
      spacing: 4,
      runSpacing: 4,
      children: days.map((day) {
        final dateStr =
            '${day.year}-${day.month.toString().padLeft(2, '0')}-${day.day.toString().padLeft(2, '0')}';
        final isActive = heatmapSet.contains(dateStr);
        return Container(
          width: 16,
          height: 16,
          decoration: BoxDecoration(
            color: isActive
                ? const Color(0xFF34C759).withValues(alpha: 0.6)
                : AppColors.borderMuted.withValues(alpha: 0.3),
            borderRadius: BorderRadius.circular(4),
          ),
        );
      }).toList(),
    );
  }
}

class _HabitsTab extends StatefulWidget {
  final String clientId;

  const _HabitsTab({required this.clientId});

  @override
  State<_HabitsTab> createState() => _HabitsTabState();
}

class _HabitsTabState extends State<_HabitsTab> {
  DateTime _selectedDate = DateTime.now();

  bool get _isToday {
    final now = DateTime.now();
    return _selectedDate.year == now.year &&
        _selectedDate.month == now.month &&
        _selectedDate.day == now.day;
  }

  String get _dateString {
    return '${_selectedDate.year}-'
        '${_selectedDate.month.toString().padLeft(2, '0')}-'
        '${_selectedDate.day.toString().padLeft(2, '0')}';
  }

  void _showHabitForm(BuildContext context, {String? habitId, String? title, String? description, String? frequency}) {
    final titleCtrl = TextEditingController(text: title ?? '');
    final descCtrl = TextEditingController(text: description ?? '');
    String selectedFreq = frequency ?? 'DAILY';
    bool isSaving = false;
    bool hasError = false;
    String errorMsg = '';

    showDialog(
      context: context,
      builder: (ctx) {
        return StatefulBuilder(
          builder: (context, setDialogState) {
            return AlertDialog(
              title: Text(habitId == null ? 'Add Habit' : 'Edit Habit'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: titleCtrl,
                    decoration: const InputDecoration(
                      labelText: 'Title',
                      hintText: 'e.g. Drink water before meals',
                    ),
                  ),
                  const SizedBox(height: 12),
                  TextField(
                    controller: descCtrl,
                    decoration: const InputDecoration(
                      labelText: 'Description (optional)',
                    ),
                  ),
                  const SizedBox(height: 16),
                  SegmentedButton<String>(
                    segments: const [
                      ButtonSegment(value: 'DAILY', label: Text('Daily')),
                      ButtonSegment(value: 'WEEKLY', label: Text('Weekly')),
                    ],
                    selected: {selectedFreq},
                    onSelectionChanged: (sel) =>
                        setDialogState(() => selectedFreq = sel.first),
                  ),
                  if (hasError)
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Text(errorMsg,
                          style: const TextStyle(
                              color: Colors.red, fontSize: 12)),
                    ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(ctx).pop(),
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: isSaving
                      ? null
                      : () async {
                          if (titleCtrl.text.trim().isEmpty) {
                            setDialogState(() {
                              hasError = true;
                              errorMsg = 'Title is required';
                            });
                            return;
                          }
                          setDialogState(() => isSaving = true);
                          try {
                            final cubit = ctx
                                .read<TrainerClientHabitsCubit>();
                            if (habitId == null) {
                              await cubit.createHabit(widget.clientId,
                                  CreateHabitRequestDto(
                                title: titleCtrl.text.trim(),
                                description: descCtrl.text.trim().isEmpty
                                    ? null
                                    : descCtrl.text.trim(),
                                frequency: selectedFreq,
                              ));
                            } else {
                              await cubit.updateHabit(
                                  widget.clientId,
                                  habitId,
                                  UpdateHabitRequestDto(
                                    title: titleCtrl.text.trim(),
                                    description:
                                        descCtrl.text.trim().isEmpty
                                            ? null
                                            : descCtrl.text.trim(),
                                    frequency: selectedFreq,
                                  ));
                            }
                            if (ctx.mounted) Navigator.of(ctx).pop();
                          } catch (e) {
                            setDialogState(() {
                              isSaving = false;
                              hasError = true;
                              errorMsg = e.toString();
                            });
                          }
                        },
                  child: isSaving
                      ? const SizedBox(
                          width: 16,
                          height: 16,
                          child: CircularProgressIndicator(
                              strokeWidth: 2),
                        )
                      : Text(habitId == null ? 'Add' : 'Save'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  Future<void> _toggleHabit(BuildContext context, String clientId,
      String habitId, bool completed) async {
    try {
      final api = getIt<TrainerClientsApiService>();
      await api.logHabit(
        clientId,
        habitId,
        LogHabitRequestDto(
          date: _dateString,
          isCompleted: completed,
        ),
      );
      if (mounted) {
        context
            .read<TrainerClientHabitsCubit>()
            .loadHabits(clientId);
      }
    } catch (e) {
      developer.log('Failed to log habit: $e', name: 'trainer');
    }
  }

  Future<void> _deleteHabit(BuildContext context, String clientId,
      String habitId) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Delete Habit'),
        content:
            const Text('Are you sure you want to delete this habit?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(true),
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: const Text('Delete'),
          ),
        ],
      ),
    );
    if (confirmed == true) {
      try {
        await context
            .read<TrainerClientHabitsCubit>()
            .deleteHabit(clientId, habitId);
      } catch (e) {
        developer.log('Failed to delete habit: $e', name: 'trainer');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TrainerClientHabitsCubit>(
      create: (_) {
        final cubit = getIt<TrainerClientHabitsCubit>();
        cubit.loadHabits(widget.clientId);
        return cubit;
      },
      child: BlocBuilder<TrainerClientHabitsCubit, TrainerClientHabitsState>(
        builder: (context, state) {
          return switch (state) {
            TrainerClientHabitsInitial() || TrainerClientHabitsLoading() =>
              const Center(
                  child: CircularProgressIndicator(
                      color: AppColors.primary)),
            TrainerClientHabitsError(:final message) => Center(
                child: Text(message,
                    style: const TextStyle(color: AppColors.mutedText))),
            TrainerClientHabitsLoaded(:final habits) => ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  // Date picker + Add button row
                  Row(
                    children: [
                      if (!_isToday)
                        TextButton.icon(
                          onPressed: () {
                            setState(() => _selectedDate = DateTime.now());
                            context
                                .read<TrainerClientHabitsCubit>()
                                .loadHabits(widget.clientId);
                          },
                          icon: const Icon(Icons.today, size: 16),
                          label: const Text('Back to Today',
                              style: TextStyle(fontSize: 12)),
                        ),
                      const Spacer(),
                      InkWell(
                        onTap: () async {
                          final picked = await showDatePicker(
                            context: context,
                            initialDate: _selectedDate,
                            firstDate: DateTime.now()
                                .subtract(const Duration(days: 365)),
                            lastDate: DateTime.now(),
                          );
                          if (picked != null) {
                            setState(() => _selectedDate = picked);
                          }
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(Icons.calendar_today,
                                size: 14, color: AppColors.mutedText),
                            const SizedBox(width: 4),
                            Text(
                              '${_selectedDate.month}/${_selectedDate.day}/${_selectedDate.year}',
                              style: const TextStyle(
                                  fontSize: 12,
                                  color: AppColors.mutedText),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 12),
                      FilledButton.tonalIcon(
                        onPressed: () => _showHabitForm(context),
                        icon: const Icon(Icons.add, size: 16),
                        label: const Text('Add', style: TextStyle(fontSize: 12)),
                        style: FilledButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 6),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  // Habit list
                  if (habits.isEmpty)
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 32),
                      child: Center(
                        child: Text('No active habits assigned.',
                            style: TextStyle(color: AppColors.mutedText)),
                      ),
                    )
                  else
                    ...habits.where((h) => h.isActive).map((h) {
                      final isLoggedToday = h.logs.any(
                        (log) => log.date.startsWith(_dateString),
                      );
                      return Dismissible(
                        key: ValueKey(h.id),
                        direction: DismissDirection.endToStart,
                        background: Container(
                          alignment: Alignment.centerRight,
                          padding: const EdgeInsets.only(right: 16),
                          color: Colors.red,
                          child: const Icon(Icons.delete_outline,
                              color: Colors.white),
                        ),
                        confirmDismiss: (_) async {
                          await _deleteHabit(
                              context, widget.clientId, h.id);
                          return false;
                        },
                        child: ListTile(
                          leading: Checkbox(
                            value: isLoggedToday,
                            onChanged: (val) => _toggleHabit(
                                context,
                                widget.clientId,
                                h.id,
                                val ?? false),
                            activeColor: AppColors.primary,
                          ),
                          title: Text(h.title,
                              style: const TextStyle(fontSize: 14)),
                          subtitle: Text(h.frequency,
                              style: const TextStyle(
                                  fontSize: 12,
                                  color: AppColors.mutedText)),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: const Icon(Icons.edit_outlined,
                                    size: 18),
                                onPressed: () => _showHabitForm(
                                  context,
                                  habitId: h.id,
                                  title: h.title,
                                  description: h.description,
                                  frequency: h.frequency,
                                ),
                                color: AppColors.mutedText,
                              ),
                            ],
                          ),
                          dense: true,
                          contentPadding: EdgeInsets.zero,
                        ),
                      );
                    }),
                ],
              ),
          };
        },
      ),
    );
  }
}

class _NutritionTab extends StatelessWidget {
  final String clientId;

  const _NutritionTab({required this.clientId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TrainerClientNutritionCubit>(
      create: (_) {
        final cubit = getIt<TrainerClientNutritionCubit>();
        cubit.loadPlan(clientId);
        return cubit;
      },
      child:
          BlocBuilder<TrainerClientNutritionCubit,
              TrainerClientNutritionState>(
        builder: (context, state) {
          return switch (state) {
            TrainerClientNutritionInitial() ||
            TrainerClientNutritionLoading() =>
              const Center(
                  child: CircularProgressIndicator(
                      color: AppColors.primary)),
            TrainerClientNutritionError(:final message) => Center(
                child: Text(message,
                    style: const TextStyle(color: AppColors.mutedText))),
            TrainerClientNutritionLoaded(:final plan) =>
              plan == null
                  ? Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text('No nutrition plan.',
                              style:
                                  TextStyle(color: AppColors.mutedText)),
                          const SizedBox(height: 16),
                          FilledButton.icon(
                            onPressed: () =>
                                showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(20)),
                              ),
                              builder: (_) =>
                                  TrainerNutritionPlanEditorSheet(
                                clientId: clientId,
                              ),
                            ),
                            icon: const Icon(Icons.add_rounded),
                            label: const Text('Create Plan'),
                          ),
                        ],
                      ),
                    )
                  : ListView(
                      padding: const EdgeInsets.all(16),
                      children: [
                        _InfoRow(
                            label: 'Calories',
                            value: '${plan.calories ?? '—'}'),
                        _InfoRow(
                            label: 'Protein',
                            value: '${plan.protein ?? '—'}g'),
                        _InfoRow(
                            label: 'Carbs',
                            value: '${plan.carbs ?? '—'}g'),
                        _InfoRow(
                            label: 'Fats',
                            value: '${plan.fats ?? '—'}g'),
                        _InfoRow(
                            label: 'Meal Notes',
                            value: plan.mealNotes ?? '—'),
                        _InfoRow(
                            label: 'Foods to Eat',
                            value: plan.foodsToEat ?? '—'),
                        _InfoRow(
                            label: 'Foods to Avoid',
                            value: plan.foodsToAvoid ?? '—'),
                      ],
                    ),
          };
        },
      ),
    );
  }
}

// ── Shared Widgets ──

class _InfoRow extends StatelessWidget {
  final String label;
  final String value;

  const _InfoRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(label,
                style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: AppColors.mutedText)),
          ),
          Expanded(
            child: Text(value,
                style: const TextStyle(
                    fontSize: 14, color: AppColors.foreground)),
          ),
        ],
      ),
    );
  }
}


