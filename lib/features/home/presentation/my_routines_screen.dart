import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../core/theme/app_theme.dart';
import '../../notifications/presentation/widgets/ziro_sheet_header.dart';
import '../cubit/program_cubit.dart';
import '../cubit/program_state.dart';
import '../data/models/assigned_program_dto.dart';
import '../data/models/program_dto.dart';

/// Full-screen My Routines list matching iOS `MyRoutinesView`.
///
/// Shows all programs (assigned + personal) with edit and schedule actions.
/// Tap a routine → open RoutineBuilderScreen in edit mode.
/// Schedule button → open RoutineSchedulerScreen.
/// "Create Routine" button in empty state or header → open RoutineBuilderScreen.
class MyRoutinesScreen extends StatefulWidget {
  const MyRoutinesScreen({super.key});

  @override
  State<MyRoutinesScreen> createState() => _MyRoutinesScreenState();
}

class _MyRoutinesScreenState extends State<MyRoutinesScreen> {
  @override
  void initState() {
    super.initState();
    context.read<ProgramCubit>().loadPrograms();
  }

  @override
  Widget build(BuildContext context) {
    final topPadding = MediaQuery.of(context).padding.top;
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          // Main content
          Padding(
            padding: EdgeInsets.only(top: topPadding + 80),
            child: BlocBuilder<ProgramCubit, ProgramState>(
              builder: (context, state) {
                return switch (state) {
                  ProgramInitial() || ProgramLoading() => const Center(
                    child: CircularProgressIndicator(
                      strokeWidth: 3,
                      color: AppColors.primary,
                    ),
                  ),
                  ProgramError(:final message) => _buildError(message),
                  ProgramLoaded(:final personalPrograms, :final assignedPrograms) =>
                    _buildProgramList(assignedPrograms, personalPrograms),
                };
              },
            ),
          ),

          // Header overlay
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: ZiroSheetHeader(
              title: 'My Routines',
              showCancel: true,
              onCancel: () {
                final router = GoRouter.of(context);
                if (router.canPop()) {
                  router.pop();
                } else {
                  context.go('/');
                }
              },
              leadingText: 'Back',
              onTrailingIconTap: () => _openRoutineBuilder(null),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildError(String message) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.cloud_off_rounded,
              size: 56,
              color: AppColors.mutedText,
            ),
            const SizedBox(height: 16),
            Text(
              message,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 14,
                color: AppColors.mutedText,
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: () => context.read<ProgramCubit>().loadPrograms(),
              icon: const Icon(Icons.refresh_rounded, size: 18),
              label: const Text('Retry'),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProgramList(
    List<AssignedProgramDto> assignedPrograms,
    List<ProgramDto> personalPrograms,
  ) {
    final allPrograms = <ProgramDto>[
      ...assignedPrograms.map((a) => a.program),
      ...personalPrograms,
    ];

    if (allPrograms.isEmpty) {
      return _buildEmptyState();
    }

    return RefreshIndicator(
      onRefresh: () => context.read<ProgramCubit>().loadPrograms(),
      color: AppColors.primary,
      child: ListView.builder(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 100),
        itemCount: allPrograms.length,
        itemBuilder: (context, index) {
          final program = allPrograms[index];
          return _ProgramRow(
            program: program,
            onTap: () => _openRoutineBuilder(program),
            onSchedule: () => _openScheduler(program),
          );
        },
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.list_alt_rounded,
              size: 60,
              color: AppColors.mutedText,
            ),
            const SizedBox(height: 20),
            const Text(
              'No Routines Found',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: AppColors.foreground,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Create a routine to organize your templates into a structured plan.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: AppColors.mutedText,
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () => _openRoutineBuilder(null),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text('Create New Routine'),
            ),
          ],
        ),
      ),
    );
  }

  void _openRoutineBuilder(ProgramDto? program) {
    context.push('/home/routine-builder', extra: program);
  }

  void _openScheduler(ProgramDto program) {
    context.push('/home/routine-scheduler', extra: program);
  }
}

/// A single program row in the My Routines list.
///
/// Matches iOS `RoutineRow` — MyRoutinesView.swift lines 116-188.
class _ProgramRow extends StatelessWidget {
  final ProgramDto program;
  final VoidCallback onTap;
  final VoidCallback onSchedule;

  const _ProgramRow({
    required this.program,
    required this.onTap,
    required this.onSchedule,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.mutedSurface,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top row: name, schedule button, template count
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        program.name,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: AppColors.foreground,
                        ),
                      ),
                      if (program.description != null &&
                          program.description!.isNotEmpty) ...[
                        const SizedBox(height: 4),
                        Text(
                          program.description!,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 12,
                            color: AppColors.mutedText,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                // Schedule button — iOS green calendar icon
                GestureDetector(
                  onTap: onSchedule,
                  child: Container(
                    width: 36,
                    height: 36,
                    decoration: const BoxDecoration(
                      color: AppColors.primary,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.calendar_today_rounded,
                      size: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                // Template count badge
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: AppColors.primary.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.grid_view_rounded,
                        size: 12,
                        color: AppColors.primary,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '${program.templates.length}',
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primary,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            // Template name badges (horizontal scroll, max 3 shown)
            if (program.templates.isNotEmpty) ...[
              const SizedBox(height: 12),
              SizedBox(
                height: 26,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    ...program.templates.take(3).map((t) => Container(
                      margin: const EdgeInsets.only(right: 6),
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: AppColors.card,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        t.name,
                        style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                          color: AppColors.foreground,
                        ),
                      ),
                    )),
                    if (program.templates.length > 3)
                      Padding(
                        padding: const EdgeInsets.only(left: 4),
                        child: Center(
                          child: Text(
                            '+${program.templates.length - 3}',
                            style: const TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: AppColors.mutedText,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
