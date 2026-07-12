import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/theme/app_theme.dart';
import '../../../cubit/storefront_cubit.dart';
import '../../../cubit/storefront_state.dart';
import '../../../data/models/storefront_profile_dto.dart';

/// Bottom sheet to create or edit a package.
///
/// Pass an existing [package] to edit, or `null` to create a new one.
class PackageFormSheet extends StatefulWidget {
  final StorefrontPackageDto? package;

  const PackageFormSheet({super.key, this.package});

  @override
  State<PackageFormSheet> createState() => _PackageFormSheetState();
}

class _PackageFormSheetState extends State<PackageFormSheet> {
  late final TextEditingController _nameController;
  late final TextEditingController _descriptionController;
  late final TextEditingController _priceController;
  late final TextEditingController _sessionsController;

  bool get _isEditing => widget.package != null;
  bool get _isValid =>
      _nameController.text.trim().isNotEmpty &&
      _priceController.text.trim().isNotEmpty &&
      _sessionsController.text.trim().isNotEmpty;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.package?.name ?? '');
    _descriptionController = TextEditingController(
      text: widget.package?.description ?? '',
    );
    _priceController = TextEditingController(
      text: widget.package != null ? widget.package!.price : '',
    );
    _sessionsController = TextEditingController(
      text: widget.package?.duration != null
          ? widget.package!.duration.toString()
          : '',
    );
    _nameController.addListener(_onFieldChanged);
    _priceController.addListener(_onFieldChanged);
    _sessionsController.addListener(_onFieldChanged);
  }

  @override
  void dispose() {
    _nameController.removeListener(_onFieldChanged);
    _priceController.removeListener(_onFieldChanged);
    _sessionsController.removeListener(_onFieldChanged);
    _nameController.dispose();
    _descriptionController.dispose();
    _priceController.dispose();
    _sessionsController.dispose();
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
                      _isEditing ? 'Edit Package' : 'New Package',
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
                    _buildField('Name *', _nameController, key: const Key('package_nameField')),
                    const SizedBox(height: 16),
                    _buildField(
                      'Description',
                      _descriptionController,
                      maxLines: 3,
                      key: const Key('package_descriptionField'),
                    ),
                    const SizedBox(height: 16),
                    _buildField(
                      'Price *',
                      _priceController,
                      keyboardType: TextInputType.number,
                      prefix: '\$',
                      key: const Key('package_priceField'),
                    ),
                    const SizedBox(height: 16),
                    _buildField(
                      'Number of Sessions *',
                      _sessionsController,
                      keyboardType: TextInputType.number,
                      key: const Key('package_sessionsField'),
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
    final price = double.tryParse(_priceController.text.trim());
    final sessions = int.tryParse(_sessionsController.text.trim());
    if (price == null || sessions == null) return;

    final cubit = context.read<StorefrontCubit>();
    if (_isEditing) {
      await cubit.updatePackage(
        id: widget.package!.id,
        name: _nameController.text.trim(),
        description: _descriptionController.text.trim().isNotEmpty
            ? _descriptionController.text.trim()
            : null,
        price: price,
        numberOfSessions: sessions,
      );
    } else {
      await cubit.createPackage(
        name: _nameController.text.trim(),
        description: _descriptionController.text.trim().isNotEmpty
            ? _descriptionController.text.trim()
            : null,
        price: price,
        numberOfSessions: sessions,
      );
    }
    if (mounted) Navigator.of(context).pop();
  }
}
