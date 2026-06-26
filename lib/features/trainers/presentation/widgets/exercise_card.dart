import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_theme.dart';
import '../../cubit/workout_session_cubit.dart';
import '../../data/models/exercise_log_dto.dart';
import 'coach_note_card.dart';
import 'rpe_picker.dart';
import 'set_row.dart';
import 'youtube_player_widget.dart';

/// An exercise card within the active workout session.
///
/// Shows the exercise name, muscle group badge, superset badge,
/// a table of set rows (weight/reps/RPE/completion), coach notes/video,
/// and add/remove actions.
class ExerciseCard extends StatelessWidget {
  const ExerciseCard({
    super.key,
    required this.exerciseName,
    this.muscleGroup,
    required this.exerciseId,
    required this.logs,
    this.supersetKey,
    this.coachNotes,
    this.coachVideoUrl,
    this.focusTarget,
    required this.activeInputText,
    required this.onTapWeight,
    required this.onTapReps,
    required this.onComplete,
    required this.onAddSet,
    required this.onRemove,
  });

  final String exerciseName;
  final String? muscleGroup;
  final String exerciseId;
  final List<ExerciseLogDto> logs;
  final String? supersetKey;
  final String? coachNotes;
  final String? coachVideoUrl;
  final FocusTarget? focusTarget;
  final String activeInputText;
  final void Function(int logIndex) onTapWeight;
  final void Function(int logIndex) onTapReps;
  final void Function(int logIndex) onComplete;
  final VoidCallback onAddSet;
  final VoidCallback onRemove;

  bool get _hasTempoData => logs.any((l) => l.tempo != null);
  bool get _hasCoachContent => coachNotes != null || coachVideoUrl != null;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: supersetKey != null
              ? Colors.blue.withValues(alpha: 0.4)
              : AppColors.borderMuted,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (supersetKey != null) _buildSupersetBadge(),
          _buildHeader(context),
          _buildTableHeader(_hasTempoData),
          ...logs.asMap().entries.map((entry) {
            final i = entry.key;
            final log = entry.value;
            final isWeightFocused = focusTarget?.exerciseId == exerciseId &&
                focusTarget?.setIndex == i &&
                focusTarget?.isWeight == true;
            final isRepsFocused = focusTarget?.exerciseId == exerciseId &&
                focusTarget?.setIndex == i &&
                focusTarget?.isReps == true;

            return SetRow(
              key: ValueKey(log.id),
              setNumber: i + 1,
              weight: log.weight,
              reps: log.reps,
              rpe: log.rpe,
              tempo: log.tempo,
              isCompleted: log.isCompleted,
              isWeightFocused: isWeightFocused,
              isRepsFocused: isRepsFocused,
              activeInputText: activeInputText,
              onTapWeight: () => onTapWeight(i),
              onTapReps: () => onTapReps(i),
              onComplete: () => onComplete(i),
              onTapRpe: () => _onTapRpe(context, exerciseId, log),
              onTapTempo: _hasTempoData
                  ? () => _onTapTempo(context, exerciseId, log)
                  : null,
            );
          }),
          const Divider(height: 1, indent: 16, endIndent: 16),
          InkWell(
            onTap: onAddSet,
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                children: [
                  Icon(Icons.add_rounded, size: 16, color: AppColors.primary),
                  SizedBox(width: 8),
                  Text(
                    'Add Set',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: AppColors.primary,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSupersetBadge() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      color: Colors.blue.withValues(alpha: 0.06),
      child: const Row(
        children: [
          Icon(Icons.link_rounded, size: 14, color: Colors.blue),
          SizedBox(width: 6),
          Text(
            'SUPERSET',
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16, supersetKey != null ? 8 : 16, 16, 8),
      child: Row(
        children: [
          Expanded(
            child: _hasCoachContent
                ? GestureDetector(
                    onTap: () => _showCoachNotes(context),
                    child: Row(
                      children: [
                        Flexible(
                          child: Text(
                            exerciseName,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: AppColors.foreground,
                            ),
                          ),
                        ),
                        const SizedBox(width: 6),
                        const Icon(Icons.info_outline,
                            size: 16, color: AppColors.primary),
                      ],
                    ),
                  )
                : Text(
                    exerciseName,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColors.foreground,
                    ),
                  ),
          ),
          if (muscleGroup != null)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: AppColors.primary.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(99),
              ),
              child: Text(
                muscleGroup!,
                style: const TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                  color: AppColors.primary,
                ),
              ),
            ),
          const SizedBox(width: 4),
          PopupMenuButton<String>(
            onSelected: (value) {
              if (value == 'remove') {
                onRemove();
              } else if (value == 'details') {
                context.push('/workout/exercise/$exerciseId',
                    extra: exerciseName);
              }
            },
            itemBuilder: (_) => [
              const PopupMenuItem(
                value: 'details',
                child: Row(
                  children: [
                    Icon(Icons.info_outline,
                        size: 18, color: AppColors.primary),
                    SizedBox(width: 8),
                    Text('Details'),
                  ],
                ),
              ),
              const PopupMenuItem(
                value: 'remove',
                child: Row(
                  children: [
                    Icon(Icons.remove_circle_outline,
                        size: 18, color: Colors.red),
                    SizedBox(width: 8),
                    Text('Remove', style: TextStyle(color: Colors.red)),
                  ],
                ),
              ),
            ],
            icon: const Icon(Icons.more_vert_rounded,
                size: 18, color: AppColors.mutedText),
          ),
        ],
      ),
    );
  }

  Widget _buildTableHeader(bool hasTempoData) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: Row(
        children: [
          const SizedBox(width: 28),
          const SizedBox(width: 12),
          const Expanded(
            child: Text(
              'WEIGHT',
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
                color: AppColors.mutedText,
              ),
            ),
          ),
          const SizedBox(width: 4),
          const Expanded(
            child: Text(
              'REPS',
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
                color: AppColors.mutedText,
              ),
            ),
          ),
          if (hasTempoData) ...[
            const SizedBox(width: 4),
            const Expanded(
              child: Text(
                'TEMPO',
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  color: AppColors.mutedText,
                ),
              ),
            ),
            const SizedBox(width: 4),
          ],
          const SizedBox(width: 36),
        ],
      ),
    );
  }

  void _onTapTempo(
      BuildContext context, String exerciseId, ExerciseLogDto log) {
    final controller = TextEditingController(text: log.tempo ?? '');
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Tempo'),
        content: TextField(
          controller: controller,
          decoration: const InputDecoration(
            hintText: 'e.g. 3-0-1-0',
            labelText: 'Tempo',
          ),
          autofocus: true,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              final tempo = controller.text.trim();
              if (context.mounted) {
                final cubit = context.read<WorkoutSessionCubit>();
                cubit.logSet(
                  logId: log.id,
                  exerciseId: exerciseId,
                  reps: log.reps ?? 0,
                  weight: log.weight,
                  isCompleted: log.isCompleted,
                  rpe: log.rpe,
                  tempo: tempo.isEmpty ? null : tempo,
                );
              }
              Navigator.of(context).pop();
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
    controller.dispose();
  }

  void _showCoachNotes(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => Padding(
        padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom),
        child: CoachNoteCard(
          trainerName: 'Coach',
          notes: coachNotes ?? 'Watch the video for form guidance.',
          videoUrl: coachVideoUrl,
          onPlayVideo: coachVideoUrl != null
              ? () => showYouTubeVideo(context, coachVideoUrl!)
              : null,
        ),
      ),
    );
  }

  void _onTapRpe(
      BuildContext context, String exerciseId, ExerciseLogDto log) {
    showDialog(
      context: context,
      builder: (dialogContext) => RpePicker(
        currentRpe: log.rpe,
        onSelected: (rpe) {
          if (context.mounted) {
            final cubit = context.read<WorkoutSessionCubit>();
            cubit.logSet(
              logId: log.id,
              exerciseId: exerciseId,
              reps: log.reps ?? 0,
              weight: log.weight,
              isCompleted: log.isCompleted,
              rpe: rpe,
            );
          }
          Navigator.of(dialogContext).pop();
        },
      ),
    );
  }
}

/// Focus target for the custom input system.
///
/// Tracks which field (weight/reps) of which set of which exercise
/// is currently active for the numeric keyboard overlay.
class FocusTarget {
  final String exerciseId;
  final int setIndex;
  final FieldType fieldType;

  const FocusTarget({
    required this.exerciseId,
    required this.setIndex,
    required this.fieldType,
  });

  bool get isWeight => fieldType == FieldType.weight;
  bool get isReps => fieldType == FieldType.reps;
}

/// Type of field in a set row.
enum FieldType { weight, reps }
      