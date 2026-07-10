import 'package:flutter/material.dart';

import '../../../../core/di/injection.dart';
import '../../../../core/theme/app_theme.dart';
import '../../data/models/assign_program_request_dto.dart';
import '../../data/models/trainer_program_brief_dto.dart';
import '../../data/trainer_clients_api_service.dart';
import '../../data/trainer_programs_api_service.dart';

/// Modal bottom sheet to assign a program to a client.
///
/// Two-step flow:
/// 1. Pick a program from the trainer's library.
/// 2. Set schedule (start date + frequency) and confirm.
class TrainerAssignProgramSheet extends StatefulWidget {
  final String clientId;

  const TrainerAssignProgramSheet({super.key, required this.clientId});

  @override
  State<TrainerAssignProgramSheet> createState() =>
      _TrainerAssignProgramSheetState();
}

class _TrainerAssignProgramSheetState
    extends State<TrainerAssignProgramSheet> {
  final TrainerProgramsApiService _programsApi =
      getIt<TrainerProgramsApiService>();

  // ── Step 1: Program Selection ──
  List<TrainerProgramBriefDto> _programs = [];
  bool _isLoadingPrograms = true;
  String? _selectedProgramId;

  // ── Step 2: Schedule ──
  int _currentStep = 0;
  late DateTime _startDate;
  String _frequency = 'Sequential';

  // ── Assignment state ──
  bool _isAssigning = false;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _startDate = DateTime.now();
    _loadPrograms();
  }

  Future<void> _loadPrograms() async {
    setState(() => _isLoadingPrograms = true);
    try {
      final library = await _programsApi.getPrograms();
      if (!mounted) return;
      setState(() {
        _programs = library.userPrograms;
        _isLoadingPrograms = false;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _isLoadingPrograms = false;
        _errorMessage = 'Could not load programs: $e';
      });
    }
  }

  Future<void> _assignProgram() async {
    if (_selectedProgramId == null) return;
    setState(() => _isAssigning = true);

    try {
      final request = AssignProgramRequestDto(
        programId: _selectedProgramId!,
        startDate: '${_startDate.year.toString().padLeft(4, '0')}-${_startDate.month.toString().padLeft(2, '0')}-${_startDate.day.toString().padLeft(2, '0')}',
        frequency: _frequency,
      );
      final api = getIt<TrainerClientsApiService>();
      await api.assignProgram(widget.clientId, request);
      if (mounted) Navigator.of(context).pop(true);
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _isAssigning = false;
        _errorMessage = e.toString();
      });
      _showErrorDialog();
    }
  }

  void _showErrorDialog() {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Assignment Failed'),
        content: Text(_errorMessage ?? 'An unknown error occurred.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  // ── Toolbar ──

  Widget _buildToolbar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Row(
        children: [
          TextButton(
            onPressed: _currentStep == 0
                ? () => Navigator.of(context).pop()
                : () => setState(() => _currentStep = 0),
            child: Text(_currentStep == 0 ? 'Cancel' : 'Back'),
          ),
          const Spacer(),
          Text(
            _currentStep == 0 ? 'Assign Program' : 'Schedule Program',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: AppColors.foreground,
            ),
          ),
          const Spacer(),
          TextButton(
            onPressed: _currentStep == 0
                ? (_selectedProgramId != null
                    ? () => setState(() => _currentStep = 1)
                    : null)
                : (_isAssigning ? null : _assignProgram),
            child: _currentStep == 0
                ? const Text('Next')
                : _isAssigning
                    ? const SizedBox(
                        width: 18,
                        height: 18,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Text('Confirm & Assign'),
          ),
        ],
      ),
    );
  }

  // ── Step 1: Program Selection ──

  Widget _buildProgramList() {
    if (_isLoadingPrograms) {
      return const Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 12),
            Text(
              'Loading programs...',
              style: TextStyle(
                fontSize: 14,
                color: AppColors.mutedText,
              ),
            ),
          ],
        ),
      );
    }

    if (_programs.isEmpty) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.description_outlined,
              size: 48,
              color: AppColors.mutedText.withValues(alpha: 0.5),
            ),
            const SizedBox(height: 12),
            const Text(
              'No programs available',
              style: TextStyle(
                fontSize: 14,
                color: AppColors.mutedText,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'Create a program first, then assign it to clients.',
              style: TextStyle(
                fontSize: 12,
                color: AppColors.mutedText.withValues(alpha: 0.7),
              ),
            ),
          ],
        ),
      );
    }

    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemCount: _programs.length,
      separatorBuilder: (_, _) => const SizedBox(height: 4),
      itemBuilder: (context, index) {
        final program = _programs[index];
        final isSelected = _selectedProgramId == program.id;
        final sessionCount = program.templates.length;

        return Material(
          color: isSelected
              ? AppColors.primary.withValues(alpha: 0.08)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
          child: InkWell(
            borderRadius: BorderRadius.circular(12),
            onTap: () {
              setState(() {
                _selectedProgramId = program.id;
              });
              // Auto-advance to step 2 after brief delay for visual feedback
              Future.delayed(const Duration(milliseconds: 200), () {
                if (mounted) setState(() => _currentStep = 1);
              });
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 14,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          program.name,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: AppColors.foreground,
                          ),
                        ),
                        if (program.description != null &&
                            program.description!.isNotEmpty) ...[
                          const SizedBox(height: 2),
                          Text(
                            program.description!,
                            style: const TextStyle(
                              fontSize: 12,
                              color: AppColors.mutedText,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                        const SizedBox(height: 2),
                        Text(
                          '$sessionCount ${sessionCount == 1 ? 'session' : 'sessions'}',
                          style: TextStyle(
                            fontSize: 12,
              color: AppColors.mutedText.withValues(alpha: 0.7),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 12),
                  if (isSelected)
                    const Icon(
                      Icons.check_circle_rounded,
                      color: AppColors.primary,
                      size: 22,
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  // ── Step 2: Schedule ──

  Widget _buildScheduleView() {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      children: [
        // ── Start Date ──
        const Padding(
          padding: EdgeInsets.only(top: 16, bottom: 8),
          child: Text(
            'Set Schedule',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: AppColors.mutedText,
            ),
          ),
        ),
        const SizedBox(height: 4),
        Container(
          decoration: BoxDecoration(
            color: AppColors.mutedSurface,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.borderMuted),
          ),
          clipBehavior: Clip.antiAlias,
          child: Material(
            type: MaterialType.transparency,
            child: ListTile(
            onTap: _pickDate,
            leading: const Icon(
              Icons.calendar_today_rounded,
              color: AppColors.primary,
              size: 20,
            ),
            title: const Text(
              'Start Date',
              style: TextStyle(fontSize: 14, color: AppColors.foreground),
            ),
            trailing: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: AppColors.card,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: AppColors.borderActive),
              ),
              child: Text(
                '${_startDate.day.toString().padLeft(2, '0')}/${_startDate.month.toString().padLeft(2, '0')}/${_startDate.year}',
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: AppColors.foreground,
                ),
              ),
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 16),
          ),
          ),
        ),

        const SizedBox(height: 20),

        // ── Frequency ──
        const Text(
          'Frequency',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: AppColors.foreground,
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          width: double.infinity,
          child: SegmentedButton<String>(
            segments: const [
              ButtonSegment(
                value: 'Sequential',
                label: Text('Sequential', style: TextStyle(fontSize: 12)),
              ),
              ButtonSegment(
                value: 'Daily',
                label: Text('Daily', style: TextStyle(fontSize: 12)),
              ),
              ButtonSegment(
                value: '3x_Weekly',
                label: Text('3x Weekly', style: TextStyle(fontSize: 12)),
              ),
            ],
            selected: {_frequency},
            onSelectionChanged: (selected) {
              setState(() => _frequency = selected.first);
            },
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.resolveWith((states) {
                if (states.contains(WidgetState.selected)) {
                  return AppColors.primary;
                }
                return AppColors.mutedSurface;
              }),
              foregroundColor: WidgetStateProperty.resolveWith((states) {
                if (states.contains(WidgetState.selected)) {
                  return Colors.white;
                }
                return AppColors.foreground;
              }),
              shape: WidgetStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: const BorderSide(color: AppColors.borderActive),
                ),
              ),
            ),
          ),
        ),

        const SizedBox(height: 24),

        // ── Change Program button ──
        Center(
          child: TextButton.icon(
            onPressed: () => setState(() => _currentStep = 0),
            icon: const Icon(Icons.arrow_back_rounded, size: 16),
            label: const Text(
              'Change Program',
              style: TextStyle(fontSize: 12),
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _pickDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _startDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (picked != null) {
      setState(() => _startDate = picked);
    }
  }

  // ── Build ──

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Drag handle
          Container(
            margin: const EdgeInsets.symmetric(vertical: 8),
            width: 36,
            height: 4,
            decoration: BoxDecoration(
              color: AppColors.borderActive,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          // Toolbar
          _buildToolbar(),
          const Divider(height: 1, color: AppColors.borderMuted),
          // Content
          Expanded(
            child: _currentStep == 0 ? _buildProgramList() : _buildScheduleView(),
          ),
        ],
      ),
    );
  }
}
