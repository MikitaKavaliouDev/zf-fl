import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/theme/app_theme.dart';
import '../../../cubit/storefront_cubit.dart';
import '../../../cubit/storefront_state.dart';
import '../../../data/models/storefront_profile_dto.dart';

/// Bottom sheet to create or edit a service.
///
/// Pass an existing [service] to edit, or `null` to create a new one.
class ServiceFormSheet extends StatefulWidget {
  final StorefrontServiceDto? service;

  const ServiceFormSheet({super.key, this.service});

  @override
  State<ServiceFormSheet> createState() => _ServiceFormSheetState();
}

class _ServiceFormSheetState extends State<ServiceFormSheet> {
  late final TextEditingController _titleController;
  late final TextEditingController _descriptionController;
  late final TextEditingController _priceController;
  late final TextEditingController _currencyController;
  late final TextEditingController _durationController;

  bool get _isEditing => widget.service != null;
  bool get _isValid => _titleController.text.trim().isNotEmpty;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(
      text: widget.service?.name ?? '',
    );
    _descriptionController = TextEditingController(
      text: widget.service?.description ?? '',
    );
    _priceController = TextEditingController(
      text: widget.service?.price ?? '',
    );
    _currencyController = TextEditingController();
    _durationController = TextEditingController();
    _titleController.addListener(_onFieldChanged);
  }

  @override
  void dispose() {
    _titleController.removeListener(_onFieldChanged);
    _titleController.dispose();
    _descriptionController.dispose();
    _priceController.dispose();
    _currencyController.dispose();
    _durationController.dispose();
    super.dispose();
  }

  void _onFieldChanged() => setState(() {});

  @override
  Widget build(BuildContext context) {
    return BlocListener<StorefrontCubit, StorefrontState>(
      listenWhen: (prev, curr) => curr is StorefrontError,
      listener: (context, state) {
        if (state is StorefrontError && mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
        }
      },
      child: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Container(
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
              // Header
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Row(
                  children: [
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text('Cancel'),
                    ),
                    const Spacer(),
                    Text(
                      _isEditing ? 'Edit Service' : 'New Service',
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Spacer(),
                    TextButton(
                      onPressed: _isValid ? _save : null,
                      child: const Text('Save'),
                    ),
                  ],
                ),
              ),
              const Divider(height: 1, color: AppColors.borderMuted),
              // Form fields
              SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildField('Title *', _titleController, key: const Key('service_titleField')),
                    const SizedBox(height: 16),
                    _buildField(
                      'Description',
                      _descriptionController,
                      maxLines: 3,
                      key: const Key('service_descriptionField'),
                    ),
                    const SizedBox(height: 16),
                    _buildField(
                      'Price',
                      _priceController,
                      keyboardType: TextInputType.number,
                      prefix: '\$',
                      key: const Key('service_priceField'),
                    ),
                    const SizedBox(height: 16),
                    _buildField(
                      'Currency',
                      _currencyController,
                      hint: 'e.g. USD, EUR',
                      key: const Key('service_currencyField'),
                    ),
                    const SizedBox(height: 16),
                    _buildField(
                      'Duration (minutes)',
                      _durationController,
                      keyboardType: TextInputType.number,
                      key: const Key('service_durationField'),
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildField(
    String label,
    TextEditingController controller, {
    Key? key,
    TextInputType? keyboardType,
    int maxLines = 1,
    String? prefix,
    String? hint,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w500,
            color: AppColors.foreground,
          ),
        ),
        const SizedBox(height: 6),
        TextField(
          key: key,
          controller: controller,
          keyboardType: keyboardType,
          maxLines: maxLines,
          decoration: InputDecoration(
            hintText: hint,
            prefixText: prefix,
            filled: true,
            fillColor: AppColors.mutedSurface,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: AppColors.borderMuted),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 10,
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _save() async {
    final priceText = _priceController.text.trim();
    final durationText = _durationController.text.trim();

    final cubit = context.read<StorefrontCubit>();
    if (_isEditing) {
      await cubit.updateService(
        id: widget.service!.id,
        title: _titleController.text.trim(),
        description: _descriptionController.text.trim().isNotEmpty
            ? _descriptionController.text.trim()
            : null,
        price: priceText.isNotEmpty ? double.tryParse(priceText) : null,
        currency: _currencyController.text.trim().isNotEmpty
            ? _currencyController.text.trim()
            : null,
        duration: durationText.isNotEmpty ? int.tryParse(durationText) : null,
      );
    } else {
      await cubit.createService(
        title: _titleController.text.trim(),
        description: _descriptionController.text.trim().isNotEmpty
            ? _descriptionController.text.trim()
            : null,
        price: priceText.isNotEmpty ? double.tryParse(priceText) : null,
        currency: _currencyController.text.trim().isNotEmpty
            ? _currencyController.text.trim()
            : null,
        duration: durationText.isNotEmpty ? int.tryParse(durationText) : null,
      );
    }
    if (mounted) Navigator.of(context).pop();
  }
}
