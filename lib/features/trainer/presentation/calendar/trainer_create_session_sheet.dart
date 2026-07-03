import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theme/app_theme.dart';
import '../../cubit/trainer_calendar_cubit.dart';
import '../../data/models/create_session_request_dto.dart';
import '../../data/models/session_creation_client_dto.dart';
import '../../data/models/session_creation_data_dto.dart';
import '../../data/models/session_creation_template_dto.dart';

/// Modal bottom sheet for creating a new calendar session.
class TrainerCreateSessionSheet extends StatefulWidget {
  final SessionCreationDataDto creationData;

  const TrainerCreateSessionSheet({
    super.key,
    required this.creationData,
  });

  @override
  State<TrainerCreateSessionSheet> createState() =>
      _TrainerCreateSessionSheetState();
}

class _TrainerCreateSessionSheetState
    extends State<TrainerCreateSessionSheet> {
  SessionCreationClientDto? _selectedClient;
  SessionCreationTemplateDto? _selectedTemplate;
  DateTime _selectedDate = DateTime.now();
  TimeOfDay _startTime = TimeOfDay.now();
  TimeOfDay _endTime = TimeOfDay(
    hour: TimeOfDay.now().hour + 1,
    minute: TimeOfDay.now().minute,
  );
  final _notesController = TextEditingController();
  bool _repeats = false;
  int _repeatWeeks = 4;
  bool _isCreating = false;

  bool get _isValid =>
      _selectedClient != null;

  @override
  void dispose() {
    _notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;
    return Padding(
      padding: EdgeInsets.only(bottom: bottomInset),
      child: DraggableScrollableSheet(
        initialChildSize: 0.85,
        minChildSize: 0.5,
        maxChildSize: 0.95,
        expand: false,
        builder: (context, scrollController) {
          return Column(
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
              // Header
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
                    const Text(
                      'New Session',
                      style: TextStyle(
                          fontSize: 17, fontWeight: FontWeight.w600),
                    ),
                    const Spacer(),
                    TextButton(
                      onPressed: _isValid && !_isCreating ? _createSession : null,
                      child: const Text('Done'),
                    ),
                  ],
                ),
              ),
              const Divider(height: 1, color: AppColors.borderMuted),
              // Form
              Expanded(
                child: ListView(
                  controller: scrollController,
                  padding: const EdgeInsets.all(16),
                  children: [
                    // Client Picker
                    _sectionHeader('Client'),
                    const SizedBox(height: 8),
                    ...widget.creationData.clients.map(
                      (c) => _ClientTile(
                        client: c,
                        isSelected: _selectedClient?.id == c.id,
                        onTap: () =>
                            setState(() => _selectedClient = c),
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Date
                    _sectionHeader('Date'),
                    const SizedBox(height: 8),
                    _DatePickerTile(
                      date: _selectedDate,
                      onChanged: (d) => setState(() => _selectedDate = d),
                    ),
                    const SizedBox(height: 20),
                    // Time
                    _sectionHeader('Time'),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Expanded(
                          child: _TimePickerTile(
                            label: 'Start',
                            time: _startTime,
                            onChanged: (t) =>
                                setState(() => _startTime = t),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: _TimePickerTile(
                            label: 'End',
                            time: _endTime,
                            onChanged: (t) =>
                                setState(() => _endTime = t),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    // Template Picker
                    _sectionHeader('Template (optional)'),
                    const SizedBox(height: 8),
                    ...widget.creationData.templates.map(
                      (t) => _TemplateTile(
                        template: t,
                        isSelected: _selectedTemplate?.id == t.id,
                        onTap: () => setState(() =>
                            _selectedTemplate =
                                _selectedTemplate?.id == t.id ? null : t),
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Notes
                    _sectionHeader('Notes'),
                    const SizedBox(height: 8),
                    TextField(
                      controller: _notesController,
                      maxLines: 3,
                      decoration: InputDecoration(
                        hintText: 'Add notes...',
                        filled: true,
                        fillColor: AppColors.mutedSurface,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide:
                              const BorderSide(color: AppColors.borderMuted),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Repeat toggle
                    SwitchListTile(
                      title: const Text('Repeat weekly'),
                      value: _repeats,
                      onChanged: (v) =>
                          setState(() => _repeats = v),
                      activeTrackColor: AppColors.primary,
                      contentPadding: EdgeInsets.zero,
                    ),
                    if (_repeats) ...[
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          const Text('Repeat for',
                              style: TextStyle(fontSize: 14)),
                          const SizedBox(width: 8),
                          SizedBox(
                            width: 60,
                            child: TextField(
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 8),
                              ),
                              onChanged: (v) => _repeatWeeks =
                                  int.tryParse(v) ?? 4,
                              controller: TextEditingController(
                                  text: '$_repeatWeeks'),
                            ),
                          ),
                          const SizedBox(width: 8),
                          const Text('weeks',
                              style: TextStyle(fontSize: 14)),
                        ],
                      ),
                    ],
                    const SizedBox(height: 32),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  void _createSession() {
    final startDt = DateTime(
      _selectedDate.year,
      _selectedDate.month,
      _selectedDate.day,
      _startTime.hour,
      _startTime.minute,
    );
    final endDt = DateTime(
      _selectedDate.year,
      _selectedDate.month,
      _selectedDate.day,
      _endTime.hour,
      _endTime.minute,
    );

    final request = CreateSessionRequestDto(
      clientId: _selectedClient!.id,
      startTime: startDt.toIso8601String(),
      endTime: endDt.toIso8601String(),
      notes: _notesController.text.isNotEmpty
          ? _notesController.text
          : null,
      templateId: _selectedTemplate?.id,
      repeats: _repeats,
      repeatWeeks: _repeats ? _repeatWeeks : null,
    );

    setState(() => _isCreating = true);
    context
        .read<TrainerCalendarCubit>()
        .createSession(request)
        .then((_) {
          if (mounted) Navigator.of(context).pop();
        });
  }

  Widget _sectionHeader(String title) {
    return Text(
      title,
      style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: AppColors.foreground),
    );
  }
}

class _ClientTile extends StatelessWidget {
  final SessionCreationClientDto client;
  final bool isSelected;
  final VoidCallback onTap;

  const _ClientTile({
    required this.client,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: CircleAvatar(
        backgroundColor: isSelected
            ? AppColors.primary
            : AppColors.mutedSurface,
        child: isSelected
            ? const Icon(Icons.check, color: Colors.white, size: 18)
            : Text(client.name[0].toUpperCase(),
                style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    color: AppColors.mutedText)),
      ),
      title: Text(client.name,
          style: const TextStyle(
              fontSize: 14, fontWeight: FontWeight.w500)),
      subtitle: Text('${client.availableCredits} credits',
          style: const TextStyle(
              fontSize: 12, color: AppColors.mutedText)),
      selected: isSelected,
      contentPadding: EdgeInsets.zero,
      dense: true,
    );
  }
}

class _TemplateTile extends StatelessWidget {
  final SessionCreationTemplateDto template;
  final bool isSelected;
  final VoidCallback onTap;

  const _TemplateTile({
    required this.template,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Icon(
        isSelected
            ? Icons.check_circle_rounded
            : Icons.circle_outlined,
        color: isSelected ? AppColors.primary : AppColors.mutedText,
        size: 22,
      ),
      title: Text(template.name,
          style: const TextStyle(
              fontSize: 14, fontWeight: FontWeight.w500)),
      contentPadding: EdgeInsets.zero,
      dense: true,
    );
  }
}

class _DatePickerTile extends StatelessWidget {
  final DateTime date;
  final ValueChanged<DateTime> onChanged;

  const _DatePickerTile({
    required this.date,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () async {
        final picked = await showDatePicker(
          context: context,
          initialDate: date,
          firstDate: DateTime.now().subtract(const Duration(days: 30)),
          lastDate: DateTime.now().add(const Duration(days: 365)),
        );
        if (picked != null) onChanged(picked);
      },
      leading: const Icon(Icons.calendar_today_rounded,
          color: AppColors.primary, size: 20),
      title: Text(
        '${date.day}/${date.month}/${date.year}',
        style: const TextStyle(fontSize: 14),
      ),
      contentPadding: EdgeInsets.zero,
      dense: true,
    );
  }
}

class _TimePickerTile extends StatelessWidget {
  final String label;
  final TimeOfDay time;
  final ValueChanged<TimeOfDay> onChanged;

  const _TimePickerTile({
    required this.label,
    required this.time,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        final picked = await showTimePicker(
          context: context,
          initialTime: time,
        );
        if (picked != null) onChanged(picked);
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppColors.mutedSurface,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label,
                style: const TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                    color: AppColors.mutedText)),
            const SizedBox(height: 4),
            Text(
              time.format(context),
              style: const TextStyle(
                  fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}
