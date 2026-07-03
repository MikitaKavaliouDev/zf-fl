import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../../../core/di/injection.dart';
import '../../../../core/theme/app_theme.dart';
import '../../data/models/trainer_recipe_dto.dart';

/// Trainer recipes management — create, edit, and delete nutrition recipes.
class TrainerRecipesScreen extends StatefulWidget {
  const TrainerRecipesScreen({super.key});

  @override
  State<TrainerRecipesScreen> createState() => _TrainerRecipesScreenState();
}

class _TrainerRecipesScreenState extends State<TrainerRecipesScreen> {
  List<TrainerRecipeDto>? _recipes;
  bool _loading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    setState(() => _loading = true);
    try {
      final dio = getIt<Dio>();
      final response = await dio.get('/api/trainer/recipes');
      final data = response.data['data'] as Map<String, dynamic>;
      final items = data['recipes'] as List<dynamic>;
      if (mounted) {
        setState(() {
          _recipes = items
              .map((e) =>
                  TrainerRecipeDto.fromJson(e as Map<String, dynamic>))
              .toList();
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

  Future<void> _deleteRecipe(String id) async {
    try {
      final dio = getIt<Dio>();
      await dio.delete('/api/trainer/recipes/$id');
      _load();
    } catch (_) {}
  }

  void _confirmDelete(String id, String name) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: AppColors.card,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20)),
        title: const Text('Delete Recipe?',
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600)),
        content: Text('Remove "$name"?',
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
              _deleteRecipe(id);
              Navigator.of(ctx).pop();
            },
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }

  void _showCreateDialog() {
    final nameCtrl = TextEditingController();
    final descCtrl = TextEditingController();
    final calCtrl = TextEditingController();
    final proteinCtrl = TextEditingController();
    final carbsCtrl = TextEditingController();
    final fatCtrl = TextEditingController();

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: AppColors.card,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20)),
        title: const Text('Create Recipe',
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600)),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameCtrl,
                decoration: InputDecoration(
                  labelText: 'Recipe name *',
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
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: calCtrl,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Calories',
                        filled: true,
                        fillColor: AppColors.mutedSurface,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                              color: AppColors.borderMuted),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: TextField(
                      controller: proteinCtrl,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Protein (g)',
                        filled: true,
                        fillColor: AppColors.mutedSurface,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                              color: AppColors.borderMuted),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: carbsCtrl,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Carbs (g)',
                        filled: true,
                        fillColor: AppColors.mutedSurface,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                              color: AppColors.borderMuted),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: TextField(
                      controller: fatCtrl,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Fat (g)',
                        filled: true,
                        fillColor: AppColors.mutedSurface,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                              color: AppColors.borderMuted),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: nameCtrl.text.trim().isEmpty
                ? null
                : () async {
                    final dio = getIt<Dio>();
                    await dio.post('/api/trainer/recipes', data: {
                      'name': nameCtrl.text.trim(),
                      'description': descCtrl.text.trim().isNotEmpty
                          ? descCtrl.text.trim()
                          : null,
                      'calories': calCtrl.text.trim().isNotEmpty
                          ? int.tryParse(calCtrl.text.trim())
                          : null,
                      'proteinG': proteinCtrl.text.trim().isNotEmpty
                          ? double.tryParse(proteinCtrl.text.trim())
                          : null,
                      'carbsG': carbsCtrl.text.trim().isNotEmpty
                          ? double.tryParse(carbsCtrl.text.trim())
                          : null,
                      'fatG': fatCtrl.text.trim().isNotEmpty
                          ? double.tryParse(fatCtrl.text.trim())
                          : null,
                    });
                    if (ctx.mounted) Navigator.of(ctx).pop();
                    _load();
                  },
            child: const Text('Create'),
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
        title: const Text('Recipes'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add_rounded),
            onPressed: _showCreateDialog,
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
              : _recipes == null || _recipes!.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.restaurant_menu_rounded,
                              size: 48,
                              color: AppColors.mutedText.withValues(alpha: 0.4)),
                          const SizedBox(height: 12),
                          const Text('No recipes yet.',
                              style: TextStyle(
                                  color: AppColors.mutedText)),
                        ],
                      ),
                    )
                  : RefreshIndicator(
                      onRefresh: _load,
                      child: ListView.builder(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        itemCount: _recipes!.length,
                        itemBuilder: (context, index) {
                          final r = _recipes![index];
                          return Card(
                            margin: const EdgeInsets.only(bottom: 8),
                            child: Padding(
                              padding: const EdgeInsets.all(12),
                              child: Column(
                                crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Text(r.name,
                                            style: const TextStyle(
                                                fontSize: 14,
                                                fontWeight:
                                                    FontWeight.w600)),
                                      ),
                                      if (!r.isPublished)
                                        Container(
                                          padding: const EdgeInsets
                                              .symmetric(
                                              horizontal: 6,
                                              vertical: 2),
                                          decoration: BoxDecoration(
                                            color: AppColors.mutedSurface,
                                            borderRadius:
                                                BorderRadius.circular(4),
                                          ),
                                          child: const Text('Draft',
                                              style: TextStyle(
                                                  fontSize: 10,
                                                  color: AppColors
                                                      .mutedText)),
                                        ),
                                      IconButton(
                                        icon: const Icon(
                                            Icons.delete_outline_rounded,
                                            size: 18,
                                            color: Colors.redAccent),
                                        onPressed: () =>
                                            _confirmDelete(
                                                r.id, r.name),
                                      ),
                                    ],
                                  ),
                                  if (r.description != null &&
                                      r.description!.isNotEmpty)
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(top: 4),
                                      child: Text(r.description!,
                                          maxLines: 2,
                                          overflow:
                                              TextOverflow.ellipsis,
                                          style: const TextStyle(
                                              fontSize: 12,
                                              color:
                                                  AppColors.mutedText)),
                                    ),
                                  const SizedBox(height: 8),
                                  Row(
                                    children: [
                                      if (r.calories != null) ...[
                                        _MacroChip(
                                            label: '${r.calories}',
                                            unit: 'kcal'),
                                        const SizedBox(width: 6),
                                      ],
                                      if (r.proteinG != null) ...[
                                        _MacroChip(
                                            label: '${r.proteinG!.toInt()}',
                                            unit: 'g P'),
                                        const SizedBox(width: 6),
                                      ],
                                      if (r.carbsG != null) ...[
                                        _MacroChip(
                                            label: '${r.carbsG!.toInt()}',
                                            unit: 'g C'),
                                        const SizedBox(width: 6),
                                      ],
                                      if (r.fatG != null) ...[
                                        _MacroChip(
                                            label: '${r.fatG!.toInt()}',
                                            unit: 'g F'),
                                      ],
                                      if (r.difficulty != null) ...[
                                        const Spacer(),
                                        const Icon(Icons.speed_rounded,
                                            size: 14,
                                            color: AppColors.mutedText),
                                        const SizedBox(width: 4),
                                        Text(r.difficulty!,
                                            style: const TextStyle(
                                                fontSize: 11,
                                                color:
                                                    AppColors.mutedText)),
                                      ],
                                    ],
                                  ),
                                  if (r.tags.isNotEmpty) ...[
                                    const SizedBox(height: 6),
                                    Wrap(
                                      spacing: 4,
                                      children: r.tags
                                          .map((t) => Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 6,
                                                        vertical: 2),
                                                decoration: BoxDecoration(
                                                  color: AppColors.primary
                                                      .withValues(alpha: 0.1),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          4),
                                                ),
                                                child: Text(t.name,
                                                    style: const TextStyle(
                                                        fontSize: 10,
                                                        color: AppColors
                                                            .primary)),
                                              ))
                                          .toList(),
                                    ),
                                  ],
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

class _MacroChip extends StatelessWidget {
  final String label;
  final String unit;

  const _MacroChip({required this.label, required this.unit});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.mutedSurface,
        borderRadius: BorderRadius.circular(99),
      ),
      child: Text('$label $unit',
          style: const TextStyle(
              fontSize: 11,
              color: AppColors.mutedText,
              fontWeight: FontWeight.w500)),
    );
  }
}
