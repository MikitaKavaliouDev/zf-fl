import 'package:flutter/material.dart';

import '../../../../core/di/injection.dart';
import '../../../../core/theme/app_theme.dart';
import '../../data/models/resource_vault_item_dto.dart';
import '../../data/trainer_resources_api_service.dart';

/// Trainer resource vault — manage shared documents and files.
class TrainerResourceVaultScreen extends StatefulWidget {
  const TrainerResourceVaultScreen({super.key});

  @override
  State<TrainerResourceVaultScreen> createState() =>
      _TrainerResourceVaultScreenState();
}

class _TrainerResourceVaultScreenState
    extends State<TrainerResourceVaultScreen> {
  List<ResourceVaultItemDto>? _resources;
  bool _loading = true;
  String? _error;
  late final TrainerResourcesApiService _apiService;

  @override
  void initState() {
    super.initState();
    _apiService = getIt<TrainerResourcesApiService>();
    _load();
  }

  Future<void> _load() async {
    setState(() => _loading = true);
    try {
      final items = await _apiService.getResources();
      if (mounted) {
        setState(() {
          _resources = items;
          _loading = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _error = e.toString();
          _loading = false;
        });
      }
    }
  }

  Future<void> _deleteResource(String id) async {
    try {
      await _apiService.deleteResource(id);
      _load();
    } catch (_) {}
  }

  void _confirmDelete(String id, String title) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: AppColors.card,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20)),
        title: const Text('Delete Resource?',
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600)),
        content: Text('Remove "$title"?',
            style:
                const TextStyle(fontSize: 14, color: AppColors.mutedText)),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: const Text('Cancel'),
          ),
          FilledButton(
            style: FilledButton.styleFrom(backgroundColor: Colors.redAccent),
            onPressed: () {
              _deleteResource(id);
              Navigator.of(ctx).pop();
            },
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }

  void _showAddDialog() {
    final titleCtrl = TextEditingController();
    final descCtrl = TextEditingController();
    final urlCtrl = TextEditingController();

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: AppColors.card,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20)),
        title: const Text('Add Resource',
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: titleCtrl,
              decoration: InputDecoration(
                labelText: 'Title *',
                filled: true,
                fillColor: AppColors.mutedSurface,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide:
                      const BorderSide(color: AppColors.borderMuted),
                ),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: descCtrl,
              maxLines: 2,
              decoration: InputDecoration(
                labelText: 'Description',
                filled: true,
                fillColor: AppColors.mutedSurface,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide:
                      const BorderSide(color: AppColors.borderMuted),
                ),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: urlCtrl,
              decoration: InputDecoration(
                labelText: 'File URL *',
                hintText: 'https://...',
                filled: true,
                fillColor: AppColors.mutedSurface,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide:
                      const BorderSide(color: AppColors.borderMuted),
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
            onPressed: titleCtrl.text.trim().isEmpty ||
                    urlCtrl.text.trim().isEmpty
                ? null
                : () async {
                    await _apiService.createResource({
                        'title': titleCtrl.text.trim(),
                        'description': descCtrl.text.trim().isNotEmpty
                            ? descCtrl.text.trim()
                            : null,
                        'fileUrl': urlCtrl.text.trim(),
                      });
                    if (ctx.mounted) Navigator.of(ctx).pop();
                    _load();
                  },
            child: const Text('Add'),
          ),
        ],
      ),
    );
  }

  IconData _fileIcon(String fileType) {
    switch (fileType) {
      case 'pdf':
        return Icons.picture_as_pdf_rounded;
      case 'image':
      case 'png':
      case 'jpg':
        return Icons.image_rounded;
      case 'video':
        return Icons.video_file_rounded;
      case 'doc':
        return Icons.description_rounded;
      default:
        return Icons.insert_drive_file_rounded;
    }
  }

  Color _fileColor(String fileType) {
    switch (fileType) {
      case 'pdf':
        return Colors.redAccent;
      case 'image':
        return const Color(0xFF34C759);
      case 'video':
        return const Color(0xFFAF52DE);
      case 'doc':
        return const Color(0xFF007AFF);
      default:
        return AppColors.mutedText;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Resource Vault'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add_rounded),
            onPressed: _showAddDialog,
          ),
        ],
      ),
      body: _loading
          ? const Center(
              child: CircularProgressIndicator(color: AppColors.primary))
          : _error != null
              ? Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(_error!,
                          style:
                              const TextStyle(color: AppColors.mutedText)),
                      const SizedBox(height: 12),
                      FilledButton.icon(
                        onPressed: _load,
                        icon: const Icon(Icons.refresh_rounded),
                        label: const Text('Retry'),
                      ),
                    ],
                  ),
                )
              : _resources == null || _resources!.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.folder_open_rounded,
                              size: 48, color: AppColors.mutedText.withValues(alpha: 0.4)),
                          const SizedBox(height: 12),
                          const Text('No resources yet.',
                              style:
                                  TextStyle(color: AppColors.mutedText)),
                        ],
                      ),
                    )
                  : RefreshIndicator(
                      onRefresh: _load,
                      child: ListView.builder(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        itemCount: _resources!.length,
                        itemBuilder: (context, index) {
                          final r = _resources![index];
                          return Card(
                            margin: const EdgeInsets.only(bottom: 8),
                            child: ListTile(
                              leading: CircleAvatar(
                                backgroundColor:
                                    _fileColor(r.fileType).withValues(alpha: 0.15),
                                child: Icon(
                                  _fileIcon(r.fileType),
                                  color: _fileColor(r.fileType),
                                  size: 20,
                                ),
                              ),
                              title: Text(r.title,
                                  style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600)),
                              subtitle: r.description != null &&
                                      r.description!.isNotEmpty
                                  ? Text(r.description!,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                          fontSize: 12,
                                          color: AppColors.mutedText))
                                  : Text(r.fileType.toUpperCase(),
                                      style: const TextStyle(
                                          fontSize: 11,
                                          color:
                                              AppColors.mutedText)),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    icon: const Icon(
                                        Icons.open_in_new_rounded,
                                        size: 18),
                                    onPressed: () {},
                                  ),
                                  IconButton(
                                    icon: const Icon(
                                        Icons.delete_outline_rounded,
                                        size: 18,
                                        color: Colors.redAccent),
                                    onPressed: () => _confirmDelete(
                                        r.id, r.title),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
    );
  }
}
