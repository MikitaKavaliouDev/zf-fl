import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theme/app_theme.dart';
import '../../data/models/assign_program_request_dto.dart';
import '../../cubit/trainer_clients_cubit.dart';

/// Modal bottom sheet to assign a program to a client.
class TrainerAssignProgramSheet extends StatefulWidget {
  final String clientId;

  const TrainerAssignProgramSheet({super.key, required this.clientId});

  @override
  State<TrainerAssignProgramSheet> createState() =>
      _TrainerAssignProgramSheetState();
}

class _TrainerAssignProgramSheetState
    extends State<TrainerAssignProgramSheet> {
  final _programIdController = TextEditingController();
  final _frequencyController =
      TextEditingController(text: '3 sessions / week');
  DateTime _startDate = DateTime.now();

  @override
  void dispose() {
    _programIdController.dispose();
    _frequencyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: DraggableScrollableSheet(
        initialChildSize: 0.5,
        minChildSize: 0.3,
        maxChildSize: 0.7,
        expand: false,
        builder: (context, scrollController) {
          return Column(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                width: 36,
                height: 4,
                decoration: BoxDecoration(
                  color: AppColors.borderActive,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Row(
                  children: [
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text('Cancel'),
                    ),
                    const Spacer(),
                    const Text('Assign Program',
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w600)),
                    const Spacer(),
                    TextButton(
                      onPressed: _programIdController.text.isNotEmpty
                          ? _assign
                          : null,
                      child: const Text('Assign'),
                    ),
                  ],
                ),
              ),
              const Divider(height: 1, color: AppColors.borderMuted),
              Expanded(
                child: ListView(
                  controller: scrollController,
                  padding: const EdgeInsets.all(16),
                  children: [
                    const Text('Program ID',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600)),
                    const SizedBox(height: 8),
                    TextField(
                      controller: _programIdController,
                      decoration: InputDecoration(
                        hintText: 'Enter program ID',
                        filled: true,
                        fillColor: AppColors.mutedSurface,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: const BorderSide(
                              color: AppColors.borderMuted),
                        ),
                      ),
                      onChanged: (_) => setState(() {}),
                    ),
                    const SizedBox(height: 20),
                    const Text('Start Date',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600)),
                    const SizedBox(height: 8),
                    ListTile(
                      onTap: () async {
                        final picked = await showDatePicker(
                          context: context,
                          initialDate: _startDate,
                          firstDate: DateTime.now(),
                          lastDate: DateTime.now()
                              .add(const Duration(days: 365)),
                        );
                        if (picked != null) {
                          setState(() => _startDate = picked);
                        }
                      },
                      leading: const Icon(Icons.calendar_today_rounded,
                          color: AppColors.primary),
                      title: Text(
                        '${_startDate.day}/${_startDate.month}/${_startDate.year}',
                        style: const TextStyle(fontSize: 14),
                      ),
                      contentPadding: EdgeInsets.zero,
                    ),
                    const SizedBox(height: 20),
                    const Text('Frequency',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600)),
                    const SizedBox(height: 8),
                    TextField(
                      controller: _frequencyController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: AppColors.mutedSurface,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: const BorderSide(
                              color: AppColors.borderMuted),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  void _assign() {
    final request = AssignProgramRequestDto(
      programId: _programIdController.text,
      startDate: _startDate.toIso8601String(),
      frequency: _frequencyController.text,
    );
    context
        .read<TrainerClientsCubit>()
        .assignProgram(widget.clientId, request)
        .then((_) {
      if (mounted) Navigator.of(context).pop();
    });
  }
}
