import 'package:flutter/material.dart';

import '../../data/models/template_dto.dart';

/// Dialog that shows a list of templates and returns the selected one.
class TemplatePickerDialog extends StatefulWidget {
  final List<TemplateDto> templates;
  const TemplatePickerDialog({super.key, required this.templates});

  @override
  State<TemplatePickerDialog> createState() => _TemplatePickerDialogState();
}

class _TemplatePickerDialogState extends State<TemplatePickerDialog> {
  final _searchController = TextEditingController();
  late List<TemplateDto> _filtered;

  @override
  void initState() {
    super.initState();
    _filtered = widget.templates;
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _filter(String query) {
    setState(() {
      if (query.isEmpty) {
        _filtered = widget.templates;
      } else {
        final lower = query.toLowerCase();
        _filtered = widget.templates.where((t) {
          return t.name.toLowerCase().contains(lower) ||
              (t.description?.toLowerCase().contains(lower) ?? false);
        }).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Select Template'),
      content: SizedBox(
        width: double.maxFinite,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _searchController,
              autofocus: true,
              decoration: const InputDecoration(
                hintText: 'Search templates...',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search_rounded),
                isDense: true,
              ),
              onChanged: _filter,
            ),
            const SizedBox(height: 12),
            Flexible(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: _filtered.length,
                itemBuilder: (context, index) {
                  final template = _filtered[index];
                  final exerciseCount = template.exercises.isNotEmpty
                      ? template.exercises.length
                      : template.exerciseCount;

                  return ListTile(
                    dense: true,
                    title: Text(template.name),
                    subtitle: template.description != null
                        ? Text(template.description!,
                            style: const TextStyle(fontSize: 12))
                        : Text('$exerciseCount exercises',
                            style: const TextStyle(fontSize: 12)),
                    trailing: const Icon(Icons.chevron_right_rounded, size: 18),
                    onTap: () => Navigator.of(context).pop(template),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        ),
      ],
    );
  }
}
      