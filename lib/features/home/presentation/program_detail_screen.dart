import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../core/theme/app_theme.dart';
import '../../trainers/data/models/template_dto.dart';
import '../cubit/program_cubit.dart';
import '../cubit/program_state.dart';
import '../data/models/program_detail_response.dart';
import '../data/models/program_dto.dart';

/// Full-screen program detail view matching web PageClient.tsx behavior.
///
/// Supports three modes:
/// 1. [programDetail] — loads detail from GET /api/client/programs/[id]
/// 2. [programDto] — uses a local ProgramDto (from programs list)
/// 3. [activeProgram] — uses ActiveProgramResponse (from dashboard)
///
/// Shows program info, expandable template list with exercises,
/// and "Set as Active" / "Active Program" badge.
class ProgramDetailScreen extends StatefulWidget {
  final ProgramDetailResponse? programDetail;
  final ProgramDto? programDto;

  const ProgramDetailScreen({
    super.key,
    this.programDetail,
    this.programDto,
  }) : assert(
          programDetail != null || programDto != null,
          'Either programDetail or programDto must be provided',
        );

  @override
  State<ProgramDetailScreen> createState() => _ProgramDetailScreenState();
}

class _ProgramDetailScreenState extends State<ProgramDetailScreen> {
  String? _expandedTemplateId;
  ProgramDetailResponse? _detail;

  @override
  void initState() {
    super.initState();
    if (widget.programDetail != null) {
      _detail = widget.programDetail;
    } else if (widget.programDto != null) {
      _fetchDetail();
    }
  }

  Future<void> _fetchDetail() async {
    final id = widget.programDto!.id;
    final cubit = context.read<ProgramCubit>();
    final detail = await cubit.getProgramDetail(id);
    if (mounted && detail != null) {
      setState(() => _detail = detail);
    }
  }

  ProgramDto get _program {
    if (_detail != null) return _detail!.program;
    return widget.programDto!;
  }

  bool get _isActive {
    if (_detail != null) return _detail!.isActive;
    // Check from cubit state
    final state = context.read<ProgramCubit>().state;
    if (state is ProgramLoaded) {
      return state.activeProgramId == _program.id;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: const ValueKey('programDetailScreen'),
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded,
              color: AppColors.foreground),
          onPressed: () => context.pop(),
        ),
        title: const Text(
          'Program Details',
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w600,
            color: AppColors.foreground,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: _isActive
                ? _ActiveBadge()
                : _SetActiveButton(programId: _program.id),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Program info card
            _ProgramInfoCard(
              name: _program.name,
              description: _program.description,
              category: _program.category,
            ),
            const SizedBox(height: 24),

            // Workout Routines header
            Row(
              children: [
                const Icon(Icons.calendar_month_rounded,
                    size: 20, color: AppColors.primary),
                const SizedBox(width: 8),
                Text(
                  'Workout Routines (${_program.templates.length})',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.foreground,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),

            // Template cards with expandable exercises
            ..._program.templates.map((template) {
              return _TemplateCard(
                template: template,
                isExpanded: _expandedTemplateId == template.id,
                onTap: () {
                  setState(() {
                    _expandedTemplateId =
                        _expandedTemplateId == template.id ? null : template.id;
                  });
                },
                onStart: _isActive
                    ? () {
                        // Navigate to workout with this template
                        context.go('/workout');
                      }
                    : null,
              );
            }),

            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}

/// Program info card: name, category badge, description.
class _ProgramInfoCard extends StatelessWidget {
  final String name;
  final String? description;
  final String? category;

  const _ProgramInfoCard({
    required this.name,
    this.description,
    this.category,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.mutedSurface,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (category != null) ...[
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: AppColors.primary.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                category!.toUpperCase(),
                style: const TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                  letterSpacing: 1,
                ),
              ),
            ),
            const SizedBox(height: 12),
          ],
          Text(
            name,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: AppColors.foreground,
            ),
          ),
          if (description != null && description!.isNotEmpty) ...[
            const SizedBox(height: 8),
            Text(
              description!,
              style: const TextStyle(
                fontSize: 14,
                color: AppColors.mutedText,
              ),
            ),
          ],
        ],
      ),
    );
  }
}

/// A single template card with expandable exercise list.
class _TemplateCard extends StatefulWidget {
  final TemplateDto template;
  final bool isExpanded;
  final VoidCallback onTap;
  final VoidCallback? onStart;

  const _TemplateCard({
    required this.template,
    required this.isExpanded,
    required this.onTap,
    this.onStart,
  });

  @override
  State<_TemplateCard> createState() => _TemplateCardState();
}

class _TemplateCardState extends State<_TemplateCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _animController;
  late Animation<double> _chevronRotation;

  @override
  void initState() {
    super.initState();
    _animController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _chevronRotation = Tween<double>(begin: 0.0, end: 0.5).animate(
      CurvedAnimation(parent: _animController, curve: Curves.easeInOut),
    );
    if (widget.isExpanded) {
      _animController.value = 1.0;
    }
  }

  @override
  void didUpdateWidget(_TemplateCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isExpanded != oldWidget.isExpanded) {
      if (widget.isExpanded) {
        _animController.forward();
      } else {
        _animController.reverse();
      }
    }
  }

  @override
  void dispose() {
    _animController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final exerciseCount = widget.template.exercises.isNotEmpty
        ? widget.template.exercises.length
        : widget.template.exerciseCount;

    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: AppColors.mutedSurface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.borderMuted),
      ),
      child: Column(
        children: [
          // Header — tap to expand
          InkWell(
            onTap: widget.onTap,
            borderRadius: BorderRadius.circular(16),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.template.name,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: AppColors.foreground,
                          ),
                        ),
                        if (widget.template.description != null &&
                            widget.template.description!.isNotEmpty) ...[
                          const SizedBox(height: 4),
                          Text(
                            widget.template.description!,
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
                  const SizedBox(width: 12),
                  // Exercise count badge
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: AppColors.primary.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      '$exerciseCount steps',
                      style: const TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  // Start button (only if onStart is set)
                  if (widget.onStart != null) ...[
                    GestureDetector(
                      onTap: widget.onStart,
                      child: Container(
                        width: 36,
                        height: 36,
                        decoration: const BoxDecoration(
                          color: AppColors.primary,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.play_arrow_rounded,
                          size: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                  ],
                  // Animated chevron
                  AnimatedBuilder(
                    animation: _chevronRotation,
                    builder: (context, child) {
                      return Transform.rotate(
                        angle: _chevronRotation.value * 3.14159,
                        child: child,
                      );
                    },
                    child: const Icon(
                      Icons.chevron_left_rounded,
                      size: 22,
                      color: AppColors.mutedText,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Expanded exercise list
          AnimatedCrossFade(
            firstChild: const SizedBox.shrink(),
            secondChild: _buildExerciseList(),
            crossFadeState: widget.isExpanded
                ? CrossFadeState.showSecond
                : CrossFadeState.showFirst,
            duration: const Duration(milliseconds: 300),
          ),
        ],
      ),
    );
  }

  Widget _buildExerciseList() {
    final exercises = widget.template.exercises;
    if (exercises.isEmpty) {
      return const Padding(
        padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
        child: Text(
          'No exercises in this template.',
          style: TextStyle(fontSize: 13, color: AppColors.mutedText),
        ),
      );
    }

    return Container(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      child: Column(
        children: [
          const Divider(height: 1, color: AppColors.borderMuted),
          const SizedBox(height: 12),
          ...exercises.map((exercise) => _buildExerciseRow(exercise)),
        ],
      ),
    );
  }

  Widget _buildExerciseRow(TemplateExerciseDto exercise) {
    final isRest = exercise.type == 'REST';
    return Container(
      margin: const EdgeInsets.only(bottom: 6),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.borderMuted),
      ),
      child: Row(
        children: [
          Icon(
            isRest ? Icons.timer_outlined : Icons.fitness_center_rounded,
            size: 18,
            color: isRest ? AppColors.primary : AppColors.foreground,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  exercise.exercise?.name ?? 'Rest Period',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: AppColors.foreground,
                  ),
                ),
                if (exercise.exercise?.muscleGroup != null)
                  Text(
                    exercise.exercise!.muscleGroup!,
                    style: const TextStyle(
                      fontSize: 11,
                      color: AppColors.mutedText,
                    ),
                  ),
              ],
            ),
          ),
          Text(
            isRest
                ? '${exercise.durationSeconds ?? 60}s'
                : '${exercise.targetSets ?? 3} × ${exercise.targetReps ?? '8-12'}',
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
              fontFamily: 'monospace',
            ),
          ),
        ],
      ),
    );
  }
}

/// Green "Active Program" badge for the app bar.
class _ActiveBadge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: const Color(0xFF22C55E).withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(99),
        border: Border.all(
          color: const Color(0xFF22C55E).withValues(alpha: 0.3),
        ),
      ),
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.check_circle_rounded,
              size: 14, color: Color(0xFF22C55E)),
          SizedBox(width: 4),
          Text(
            'Active',
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.bold,
              color: Color(0xFF22C55E),
            ),
          ),
        ],
      ),
    );
  }
}

/// "Set as Active Program" button for the app bar.
class _SetActiveButton extends StatefulWidget {
  final String programId;

  const _SetActiveButton({required this.programId});

  @override
  State<_SetActiveButton> createState() => _SetActiveButtonState();
}

class _SetActiveButtonState extends State<_SetActiveButton> {
  bool _loading = false;

  Future<void> _setActive() async {
    setState(() => _loading = true);
    final cubit = context.read<ProgramCubit>();
    final success = await cubit.setActiveProgram(widget.programId);
    if (mounted) {
      setState(() => _loading = false);
      if (success) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Program set as active!'),
            behavior: SnackBarBehavior.floating,
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Failed to set as active.'),
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return _loading
        ? const SizedBox(
            width: 18,
            height: 18,
            child: CircularProgressIndicator(strokeWidth: 2),
          )
        : GestureDetector(
            onTap: _setActive,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: AppColors.primary.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(99),
              ),
              child: const Text(
                'Set as Active',
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                ),
              ),
            ),
          );
  }
}
