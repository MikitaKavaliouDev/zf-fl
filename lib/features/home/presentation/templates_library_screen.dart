import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/widgets/error_widget.dart';
import '../../../core/theme/app_theme.dart';
import '../../notifications/presentation/widgets/ziro_sheet_header.dart';
import '../../trainers/data/models/template_dto.dart';
import '../cubit/program_cubit.dart';
import '../cubit/program_state.dart';
import 'create_template_screen.dart';

Color _getCategoryColor(String category) {
  switch (category) {
    case 'Trainer Assigned':
      return Colors.blue;
    case 'System':
      return Colors.purple;
    case 'Personal':
      return Colors.green;
    default:
      return AppColors.primary;
  }
}

/// Templates Library screen — searchable list of all templates.
///
/// Matches iOS `WorkoutTemplatesView` — WorkoutTemplatesView.swift lines 1-264.
class TemplatesLibraryScreen extends StatefulWidget {
  const TemplatesLibraryScreen({super.key});

  @override
  State<TemplatesLibraryScreen> createState() => _TemplatesLibraryScreenState();
}

class _TemplatesLibraryScreenState extends State<TemplatesLibraryScreen> {
  final _searchController = TextEditingController();
  String _searchText = '';
  String _selectedCategory = 'All';

  static const _categories = [
    'All',
    'Trainer Assigned',
    'System',
    'Personal',
  ];

  @override
  void initState() {
    super.initState();
    context.read<ProgramCubit>().loadTemplates();
  }

  Future<void> _showCreateTemplate() async {
    final result = await Navigator.of(context).push<TemplateDto>(
      MaterialPageRoute(
        fullscreenDialog: true,
        builder: (_) => const CreateTemplateView(),
      ),
    );
    if (result != null && mounted) {
      // Persist the newly created local template before refreshing the list.
      context.read<ProgramCubit>().saveLocalTemplate(result);
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final topPadding = MediaQuery.of(context).padding.top;
    return Scaffold(
      key: const ValueKey('templatesLibraryScreen'),
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          Column(
            children: [
              SizedBox(height: topPadding + 80),
              // Category filter bar
              _buildCategoryFilters(),
              const SizedBox(height: 12),
              // Search bar
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.mutedSurface.withValues(alpha: 0.5),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: TextField(
                    controller: _searchController,
                    onChanged: (v) => setState(() => _searchText = v),
                    decoration: const InputDecoration(
                      hintText: 'Search templates...',
                      prefixIcon: Icon(Icons.search_rounded,
                          size: 20, color: AppColors.mutedText),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(vertical: 12),
                    ),
                    style: const TextStyle(
                      fontSize: 14,
                      color: AppColors.foreground,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              // Content
              Expanded(
                child: BlocBuilder<ProgramCubit, ProgramState>(
                  builder: (context, state) {
                    return switch (state) {
                      ProgramInitial() || ProgramLoading() => const Center(
                        child: CircularProgressIndicator(
                          strokeWidth: 3,
                          color: AppColors.primary,
                        ),
                      ),
                      ProgramError(:final message) => _buildError(message),
                      ProgramLoaded(:final templates) =>
                        _buildTemplateList(templates),
                    };
                  },
                ),
              ),
            ],
          ),

          // Header overlay
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: ZiroSheetHeader(
              title: 'Templates Library',
              showCancel: true,
              onCancel: () {
                final router = GoRouter.of(context);
                if (router.canPop()) {
                  router.pop();
                } else {
                  context.go('/');
                }
              },
              leadingText: 'Back',
              showDone: true,
              onDone: () {
                final router = GoRouter.of(context);
                if (router.canPop()) {
                  router.pop();
                } else {
                  context.go('/');
                }
              },
              trailingText: 'Done',
              onTrailingIconTap: _showCreateTemplate,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryFilters() {
    return SizedBox(
      height: 40,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: _categories.length,
        separatorBuilder: (_, _) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          final category = _categories[index];
          final isSelected = category == _selectedCategory;
          return GestureDetector(
            onTap: () => setState(() => _selectedCategory = category),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: isSelected
                    ? AppColors.primary
                    : AppColors.mutedSurface,
                borderRadius: BorderRadius.circular(99),
              ),
              child: Text(
                category,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight:
                      isSelected ? FontWeight.w600 : FontWeight.normal,
                  color: isSelected
                      ? Colors.white
                      : AppColors.foreground,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildError(String message) {
    return ZiroErrorWidget(
      message: message,
      icon: Icons.cloud_off_rounded,
      padding: const EdgeInsets.all(32),
      onRetry: () => context.read<ProgramCubit>().loadTemplates(),
    );
  }

  Widget _buildTemplateList(List<TemplateDto> templates) {
    var filtered = templates;
    if (_selectedCategory != 'All') {
      filtered = templates.where((t) => t.category == _selectedCategory).toList();
    }

    if (_searchText.isNotEmpty) {
      final q = _searchText.toLowerCase();
      filtered = filtered.where((t) {
        return t.name.toLowerCase().contains(q) ||
            (t.description?.toLowerCase().contains(q) ?? false);
      }).toList();
    }

    if (filtered.isEmpty) {
      return _buildEmptyState(templates.isEmpty);
    }

    return RefreshIndicator(
      onRefresh: () => context.read<ProgramCubit>().loadTemplates(),
      color: AppColors.primary,
      child: ListView.builder(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 100),
        itemCount: filtered.length,
        itemBuilder: (context, index) {
          final template = filtered[index];
          return _TemplateLibraryRow(
            template: template,
            onPlay: () {
              // Start a workout session with this template
              context.go('/workout');
            },
            onTap: () {
              // Navigate to template detail (matches iOS tap → TemplateDetailView)
              context.push('/home/template-detail', extra: template);
            },
          );
        },
      ),
    );
  }

  Widget _buildEmptyState(bool noTemplatesAtAll) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.grid_view_rounded,
              size: 60,
              color: AppColors.mutedText.withValues(alpha: 0.3),
            ),
            const SizedBox(height: 20),
            const Text(
              'No Templates Yet',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: AppColors.foreground,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Create a routine to get started.',
              style: TextStyle(
                fontSize: 14,
                color: AppColors.mutedText,
              ),
            ),
            if (noTemplatesAtAll) ...[
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () => context.go('/home/routine-builder'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 12,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text('Create New Routine'),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

/// A single row in the templates library list.
class _TemplateLibraryRow extends StatelessWidget {
  final TemplateDto template;
  final VoidCallback onPlay;
  final VoidCallback? onTap;

  const _TemplateLibraryRow({
    required this.template,
    required this.onPlay,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final exerciseCount = template.exercises.isNotEmpty
        ? template.exercises.length
        : template.exerciseCount;

    return GestureDetector(
      onTap: onTap,
      child: Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.mutedSurface.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  template.name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.foreground,
                  ),
                ),
                if (template.description != null &&
                    template.description!.isNotEmpty) ...[
                  const SizedBox(height: 4),
                  Text(
                    template.description!,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 12,
                      color: AppColors.mutedText,
                    ),
                  ),
                ],
                const SizedBox(height: 8),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.primary.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        '$exerciseCount Exercises',
                        style: const TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                    if (template.category != null) ...[
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: _getCategoryColor(template.category!).withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          template.category!,
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                            color: _getCategoryColor(template.category!),
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          // Play button
          GestureDetector(
            onTap: onPlay,
            child: Container(
              width: 44,
              height: 44,
              decoration: const BoxDecoration(
                color: AppColors.primary,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.play_arrow_rounded,
                size: 22,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      ),
    );
  }
}
      