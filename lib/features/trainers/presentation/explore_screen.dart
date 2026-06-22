import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/theme/app_theme.dart';
import '../cubit/trainer_list_cubit.dart';
import '../cubit/trainer_list_state.dart';
import '../data/models/trainer_list_item_dto.dart';
import 'trainer_map_screen.dart';
import 'widgets/search_bar.dart';
import 'widgets/trainer_card.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  final _searchController = TextEditingController();
  bool _showMap = false;
  String _selectedFilter = 'All';

  static const _categories = [
    'All',
    'Strength',
    'Yoga',
    'Cardio',
    'HIIT',
    'Pilates',
  ];

  @override
  void initState() {
    super.initState();
    context.read<TrainerListCubit>().load();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Explore Trainers'),
        actions: [
          IconButton(
            icon: Icon(_showMap ? Icons.list_rounded : Icons.map_rounded),
            onPressed: () => setState(() => _showMap = !_showMap),
            tooltip: _showMap ? 'List view' : 'Map view',
          ),
        ],
      ),
      body: Column(
        children: [
          TrainerSearchBar(
            controller: _searchController,
            onChanged: (value) {
              context.read<TrainerListCubit>().search(value);
            },
            onClear: () {
              _searchController.clear();
              context.read<TrainerListCubit>().load();
            },
          ),
          _buildCategoryFilters(),
          Expanded(
            child: _showMap
                ? const TrainerMapScreen()
                : _buildTrainerList(),
          ),
        ],
      ),
    );
  }

  Widget _buildLoadedList({
    required List<TrainerListItemDto> trainers,
    required bool hasMore,
    bool isLoadingMore = false,
  }) {
    if (trainers.isEmpty && !isLoadingMore) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.search_rounded,
              size: 64,
              color: AppColors.mutedText,
            ),
            SizedBox(height: 16),
            Text(
              'No trainers found',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppColors.foreground,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Try adjusting your search or filters',
              style: TextStyle(
                fontSize: 14,
                color: AppColors.mutedText,
              ),
            ),
          ],
        ),
      );
    }
    return NotificationListener<ScrollNotification>(
      onNotification: (notification) {
        if (!isLoadingMore &&
            notification is ScrollEndNotification &&
            notification.metrics.pixels >=
                notification.metrics.maxScrollExtent - 200 &&
            hasMore) {
          context.read<TrainerListCubit>().loadMore();
        }
        return false;
      },
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: trainers.length + (hasMore ? 1 : 0),
        itemBuilder: (context, index) {
          if (index >= trainers.length) {
            return const Padding(
              padding: EdgeInsets.all(16),
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
          return TrainerCard(trainer: trainers[index]);
        },
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
          final isSelected = category == _selectedFilter;
          return GestureDetector(
            onTap: () => setState(() => _selectedFilter = category),
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

  Widget _buildTrainerList() {
    return BlocBuilder<TrainerListCubit, TrainerListState>(
      builder: (context, state) {
        return switch (state) {
          TrainerListInitial() || TrainerListLoading() => const Center(
              child: CircularProgressIndicator(color: AppColors.primary),
            ),
          TrainerListLoaded(:final trainers, :final hasMore) =>
            _buildLoadedList(trainers: trainers, hasMore: hasMore),
          TrainerListLoadingMore(:final previous) => _buildLoadedList(
              trainers: previous.trainers,
              hasMore: previous.hasMore,
              isLoadingMore: true,
            ),
          TrainerListError(:final message) => Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.error_outline_rounded,
                      size: 48,
                      color: AppColors.mutedText,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      message,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 14,
                        color: AppColors.mutedText,
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () =>
                          context.read<TrainerListCubit>().load(),
                      child: const Text('Retry'),
                    ),
                  ],
                ),
              ),
            ),
        };
      },
    );
  }
}
