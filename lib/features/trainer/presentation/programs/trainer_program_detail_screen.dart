import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theme/app_theme.dart';
import '../../cubit/trainer_programs_cubit.dart';
import '../../cubit/trainer_programs_state.dart';
import '../../data/models/create_template_request_dto.dart';
import '../../data/models/template_exercise_dto.dart';
import '../../data/models/trainer_program_brief_dto.dart';
import '../../data/models/trainer_template_summary_dto.dart';


/// Full-screen detail view of a single trainer program with its templates.
class TrainerProgramDetailScreen extends StatefulWidget {
  final String programId;

  const TrainerProgramDetailScreen({
    super.key,
    required this.programId,
  });

  @override
  State<TrainerProgramDetailScreen> createState() =>
      _TrainerProgramDetailScreenState();
}

class _TrainerProgramDetailScreenState
    extends State<TrainerProgramDetailScreen> {
  final Set<String> _expandedTemplates = {};

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<TrainerProgramsCubit>().loadPrograms();
    });
  }

  TrainerProgramBriefDto? _findProgram(List<TrainerProgramBriefDto> programs) {
    try {
      return programs.firstWhere((p) => p.id == widget.programId);
    } catch (_) {
      return null;
    }
  }

  void _confirmDelete() {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: AppColors.card,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: const Text('Delete Program?',
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600)),
        content: const Text('Are you sure? This cannot be undone.',
            style: TextStyle(fontSize: 14, color: AppColors.mutedText)),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: const Text('Cancel'),
          ),
          FilledButton(
            style: FilledButton.styleFrom(
                backgroundColor: Colors.redAccent),
            onPressed: () {
              ctx.read<TrainerProgramsCubit>().deleteProgram(widget.programId);
              Navigator.of(ctx).pop();
              Navigator.of(context).pop();
            },
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }

  void _showAddTemplateDialog() {
    final nameCtrl = TextEditingController();
    final descCtrl = TextEditingController();

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: AppColors.card,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: const Text('Add Template',
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nameCtrl,
              decoration: InputDecoration(
                labelText: 'Template name *',
                filled: true,
                fillColor: AppColors.mutedSurface,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: AppColors.borderMuted),
                ),
              ),
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
                    ctx.read<TrainerProgramsCubit>().createTemplate(
                          CreateTemplateRequestDto(
                            programId: widget.programId,
                            name: nameCtrl.text.trim(),
                            description: descCtrl.text.trim().isNotEmpty
                                ? descCtrl.text.trim()
                                : null,
                          ),
                        );
                    Navigator.of(ctx).pop();
                  },
            child: const Text('Add'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Program'),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete_outline_rounded,
                color: Colors.redAccent),
            onPressed: _confirmDelete,
          ),
        ],
      ),
      body:
          BlocBuilder<TrainerProgramsCubit, TrainerProgramsState>(
        builder: (context, state) {
          if (state is TrainerProgramsLoading ||
              state is TrainerProgramsInitial) {
            return const Center(
                child:
                    CircularProgressIndicator(color: AppColors.primary));
          }
          if (state is TrainerProgramsError) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(state.message,
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
            );
          }

          final loaded = state as TrainerProgramsLoaded;
          final program = _findProgram(loaded.programs);

          if (program == null) {
            return const Center(
              child: Text('Program not found.',
                  style: TextStyle(color: AppColors.mutedText)),
            );
          }

          return RefreshIndicator(
            onRefresh: () =>
                context.read<TrainerProgramsCubit>().loadPrograms(),
            child: ListView(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 32),
              children: [
                // Program metadata
                Text(program.name,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w700)),
                if (program.description != null &&
                    program.description!.isNotEmpty) ...[
                  const SizedBox(height: 6),
                  Text(program.description!,
                      style: const TextStyle(
                          fontSize: 14, color: AppColors.mutedText)),
                ],
                if (program.category != null) ...[
                  const SizedBox(height: 6),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: AppColors.primary.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(99),
                    ),
                    child: Text(program.category!,
                        style: const TextStyle(
                            fontSize: 11,
                            color: AppColors.primary,
                            fontWeight: FontWeight.w500)),
                  ),
                ],
                const SizedBox(height: 24),
                // Templates header
                Row(
                  children: [
                    const Text('Templates',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600)),
                    const Spacer(),
                    TextButton.icon(
                      onPressed: _showAddTemplateDialog,
                      icon: const Icon(Icons.add_rounded, size: 18),
                      label: const Text('Add'),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                if (program.templates.isEmpty)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 32),
                    child: Center(
                      child: Text('No templates yet.',
                          style: const TextStyle(
                              fontSize: 14,
                              color: AppColors.mutedText)),
                    ),
                  )
                else
                  ...program.templates.map(
                    (t) => _TemplateCard(
                      template: t,
                      programId: widget.programId,
                      isExpanded:
                          _expandedTemplates.contains(t.id),
                      onToggle: () {
                        setState(() {
                          if (_expandedTemplates.contains(t.id)) {
                            _expandedTemplates.remove(t.id);
                          } else {
                            _expandedTemplates.add(t.id);
                          }
                        });
                      },
                      onDelete: () {
                        context
                            .read<TrainerProgramsCubit>()
                            .deleteTemplate(
                                widget.programId, t.id);
                      },
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}

// ── Template Card ──

class _TemplateCard extends StatefulWidget {
  final TrainerTemplateSummaryDto template;
  final String programId;
  final bool isExpanded;
  final VoidCallback onToggle;
  final VoidCallback onDelete;

  const _TemplateCard({
    required this.template,
    required this.programId,
    required this.isExpanded,
    required this.onToggle,
    required this.onDelete,
  });

  @override
  State<_TemplateCard> createState() => _TemplateCardState();
}

class _TemplateCardState extends State<_TemplateCard> {
  List<TemplateExerciseDto>? _exercises;
  bool _loadingExercises = false;

  @override
  void didUpdateWidget(covariant _TemplateCard old) {
    super.didUpdateWidget(old);
    if (widget.isExpanded && _exercises == null && !_loadingExercises) {
      _fetchExercises();
    }
  }

  Future<void> _fetchExercises() async {
    setState(() => _loadingExercises = true);
    try {
      final exercises =
          await _getExercises(widget.programId, widget.template.id);
      if (mounted) {
        setState(() {
          _exercises = exercises;
          _loadingExercises = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() => _loadingExercises = false);
      }
    }
  }

  Future<List<TemplateExerciseDto>> _getExercises(
      String programId, String templateId) async {
    return context
        .read<TrainerProgramsCubit>()
        .getTemplateExercises(programId, templateId);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.card,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.borderMuted),
        ),
        child: Column(
          children: [
            InkWell(
              borderRadius: BorderRadius.circular(16),
              onTap: widget.onToggle,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Container(
                      width: 28,
                      height: 28,
                      decoration: BoxDecoration(
                        color: AppColors.primary.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      alignment: Alignment.center,
                      child: Text('${widget.template.order}',
                          style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: AppColors.primary)),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(widget.template.name,
                              style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600)),
                          if (widget.template.description != null &&
                              widget.template.description!.isNotEmpty)
                            Text(widget.template.description!,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    fontSize: 12,
                                    color: AppColors.mutedText)),
                        ],
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: AppColors.mutedSurface,
                        borderRadius: BorderRadius.circular(99),
                      ),
                      child: Text(
                        '${widget.template.exerciseCount} exercises',
                        style: const TextStyle(
                            fontSize: 11,
                            color: AppColors.mutedText,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    const SizedBox(width: 4),
                    Icon(
                      widget.isExpanded
                          ? Icons.expand_less_rounded
                          : Icons.expand_more_rounded,
                      size: 20,
                      color: AppColors.mutedText,
                    ),
                  ],
                ),
              ),
            ),
            if (widget.isExpanded) ...[
              const Divider(height: 1, color: AppColors.borderMuted),
              if (_loadingExercises)
                const Padding(
                  padding: EdgeInsets.all(24),
                  child: Center(
                      child: SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                        strokeWidth: 2, color: AppColors.primary),
                  )),
                )
              else if (_exercises == null || _exercises!.isEmpty)
                const Padding(
                  padding: EdgeInsets.all(20),
                  child: Center(
                    child: Text('No exercises yet.',
                        style: TextStyle(
                            fontSize: 13, color: AppColors.mutedText)),
                  ),
                )
              else
                ..._exercises!.map((ex) => Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      child: Row(
                        children: [
                          Icon(Icons.fitness_center_outlined,
                              size: 16, color: AppColors.mutedText),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(ex.exercise?.name ?? ex.type,
                                style: const TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500)),
                          ),
                          Text(
                            '${ex.targetReps ?? ex.durationSeconds?.toString() ?? ''}',
                            style: const TextStyle(
                                fontSize: 12,
                                color: AppColors.mutedText),
                          ),
                          if (ex.durationSeconds != null) ...[
                            const SizedBox(width: 8),
                            Text(
                              '${ex.durationSeconds}s',
                              style: const TextStyle(
                                  fontSize: 11,
                                  color: AppColors.mutedText),
                            ),
                          ],
                        ],
                      ),
                    )),
              Padding(
                padding:
                    const EdgeInsets.fromLTRB(16, 0, 16, 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton.icon(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (ctx) => AlertDialog(
                            backgroundColor: AppColors.card,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(20)),
                            title: const Text('Delete Template?',
                                style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w600)),
                            content: const Text(
                                'Remove this template from the program.',
                                style: TextStyle(
                                    fontSize: 14,
                                    color: AppColors.mutedText)),
                            actions: [
                              TextButton(
                                onPressed: () =>
                                    Navigator.of(ctx).pop(),
                                child: const Text('Cancel'),
                              ),
                              FilledButton(
                                style: FilledButton.styleFrom(
                                    backgroundColor:
                                        Colors.redAccent),
                                onPressed: () {
                                  widget.onDelete();
                                  Navigator.of(ctx).pop();
                                },
                                child: const Text('Delete'),
                              ),
                            ],
                          ),
                        );
                      },
                      icon: const Icon(Icons.delete_outline_rounded,
                          size: 16, color: Colors.redAccent),
                      label: const Text('Delete',
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.redAccent)),
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
