import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_theme.dart';
import '../../cubit/trainer_programs_cubit.dart';
import '../../cubit/trainer_programs_state.dart';
import '../../data/models/active_program_item_dto.dart';
import '../../data/models/create_program_request_dto.dart';
import '../../data/models/trainer_program_brief_dto.dart';

/// Trainer programs library — lists all programs and active assignments.
class TrainerProgramsScreen extends StatefulWidget {
  const TrainerProgramsScreen({super.key});

  @override
  State<TrainerProgramsScreen> createState() => _TrainerProgramsScreenState();
}

class _TrainerProgramsScreenState extends State<TrainerProgramsScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<TrainerProgramsCubit>().loadPrograms();
    });
  }

  void _showCreateDialog() {
    final nameCtrl = TextEditingController();
    final descCtrl = TextEditingController();

    final cubit = context.read<TrainerProgramsCubit>();

    showDialog(
      context: context,
      builder: (ctx) => StatefulBuilder(
        builder: (ctx, setDialogState) => AlertDialog(
          backgroundColor: AppColors.card,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          title: const Text('Create Program',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600)),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameCtrl,
                decoration: InputDecoration(
                  labelText: 'Program name *',
                  filled: true,
                  fillColor: AppColors.mutedSurface,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: AppColors.borderMuted),
                  ),
                ),
                onChanged: (_) => setDialogState(() {}),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: descCtrl,
                maxLines: 3,
                decoration: InputDecoration(
                  labelText: 'Description (optional)',
                  filled: true,
                  fillColor: AppColors.mutedSurface,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: AppColors.borderMuted),
                  ),
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(ctx).pop(),
              child: const Text('Cancel'),
            ),
            FilledButton(
              onPressed: nameCtrl.text.trim().isEmpty
                  ? null
                  : () {
                      cubit.createProgram(
                        CreateProgramRequestDto(
                          name: nameCtrl.text.trim(),
                          description: descCtrl.text.trim().isNotEmpty
                              ? descCtrl.text.trim()
                              : null,
                        ),
                      );
                      Navigator.of(ctx).pop();
                    },
              child: const Text('Create'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: const ValueKey('trainerProgramsScreen'),
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Programs'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add_rounded),
            onPressed: _showCreateDialog,
          ),
        ],
      ),
      body: BlocBuilder<TrainerProgramsCubit, TrainerProgramsState>(
        builder: (context, state) {
          return switch (state) {
            TrainerProgramsInitial() || TrainerProgramsLoading() =>
              const Center(
                  child: CircularProgressIndicator(color: AppColors.primary)),
            TrainerProgramsError(:final message) => Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(message,
                        style:
                            const TextStyle(color: AppColors.mutedText)),
                    const SizedBox(height: 12),
                    FilledButton.icon(
                      onPressed: () => context
                          .read<TrainerProgramsCubit>()
                          .loadPrograms(),
                      icon: const Icon(Icons.refresh_rounded),
                      label: const Text('Retry'),
                    ),
                  ],
                ),
              ),
            TrainerProgramsLoaded(
              :final programs,
              :final activePrograms,
            ) => RefreshIndicator(
                onRefresh: () =>
                    context.read<TrainerProgramsCubit>().loadPrograms(),
                child: ListView(
                  padding: const EdgeInsets.only(bottom: 32),
                  children: [
                    // Active programs section
                    if (activePrograms.isNotEmpty) ...[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                        child: Text('Active Programs',
                            style: const TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                color: AppColors.mutedText)),
                      ),
                      ...activePrograms.map(
                        (ap) => _ActiveProgramCard(program: ap),
                      ),
                    ],
                    // My programs section
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                      child: Text('My Programs',
                          style: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: AppColors.mutedText)),
                    ),
                    if (programs.isEmpty)
                      Padding(
                        padding: const EdgeInsets.all(32),
                        child: Center(
                          child: Text('No programs yet.',
                              style: const TextStyle(
                                  fontSize: 14,
                                  color: AppColors.mutedText)),
                        ),
                      )
                    else
                      ...programs.map(
                        (p) => _ProgramCard(program: p),
                      ),
                  ],
                ),
              ),
          };
        },
      ),
    );
  }
}

// ── Cards ──

class _ActiveProgramCard extends StatelessWidget {
  final ActiveProgramItemDto program;

  const _ActiveProgramCard({required this.program});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.card,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.borderMuted),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 18,
                  backgroundColor: AppColors.primary.withValues(alpha: 0.15),
                  child: Text(
                    program.clientName.isNotEmpty
                        ? program.clientName[0].toUpperCase()
                        : '?',
                    style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: AppColors.primary),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(program.programName,
                          style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600)),
                      Text(program.clientName,
                          style: const TextStyle(
                              fontSize: 12,
                              color: AppColors.mutedText)),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: LinearProgressIndicator(
                value: program.completionRate,
                minHeight: 6,
                backgroundColor: AppColors.mutedSurface,
                valueColor: const AlwaysStoppedAnimation(AppColors.primary),
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Text(
                  'Week ${program.currentWeek}/${program.totalWeeks}',
                  style: const TextStyle(
                      fontSize: 12, color: AppColors.mutedText),
                ),
                const SizedBox(width: 12),
                Text(
                  '${program.sessionsCompleted}/${program.totalSessions} sessions',
                  style: const TextStyle(
                      fontSize: 12, color: AppColors.mutedText),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _ProgramCard extends StatelessWidget {
  final TrainerProgramBriefDto program;

  const _ProgramCard({required this.program});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () => context.push(
          '/trainer/programs/${program.id}',
          extra: program,
        ),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.card,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppColors.borderMuted),
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(program.name,
                        style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600)),
                    if (program.description != null &&
                        program.description!.isNotEmpty) ...[
                      const SizedBox(height: 4),
                      Text(program.description!,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              fontSize: 12,
                              color: AppColors.mutedText)),
                    ],
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(99),
                ),
                child: Text(
                  '${program.templates.length} templates',
                  style: const TextStyle(
                      fontSize: 11,
                      color: AppColors.primary,
                      fontWeight: FontWeight.w500),
                ),
              ),
              const SizedBox(width: 4),
              const Icon(Icons.chevron_right_rounded,
                  size: 18, color: AppColors.mutedText),
            ],
          ),
        ),
      ),
    );
  }
}
