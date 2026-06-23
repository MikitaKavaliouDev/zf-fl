import 'package:freezed_annotation/freezed_annotation.dart';

part 'explore_category.freezed.dart';
part 'explore_category.g.dart';

/// Computed properties in iOS:
///   systemIconName — mapped to a Flutter IconData by name.
///   themeColor — mapped to a Color by name.
@freezed
abstract class ExploreCategory with _$ExploreCategory {
  const factory ExploreCategory({
    required String id,
    required String name,
    String? iconUrl,
  }) = _ExploreCategory;

  factory ExploreCategory.fromJson(Map<String, dynamic> json) =>
      _$ExploreCategoryFromJson(json);
}

/// Category icon/color mapping matching iOS ExploreComponents.swift.
class CategoryVisuals {
  const CategoryVisuals._();

  static const Map<String, String> icons = {
    'All': 'sparkles',
    'Yoga': 'figure.mind.and.body',
    'Calisthenics': 'figure.gymnastics',
    'Strength': 'dumbbell.fill',
    'Cardio': 'figure.run',
    'HIIT': 'figure.run',
    'Pilates': 'figure.stretch',
    'CrossFit': 'flame.fill',
    'Wellness': 'heart.fill',
    'Boxing': 'figure.boxing',
    'Mobility': 'figure.flexibility',
  };

  static const Map<String, int> colorValues = {
    'All': 0xFF8B5CF6, // Purple
    'Yoga': 0xFF14B8A6, // Teal
    'Calisthenics': 0xFF06B6D4, // Cyan
    'Strength': 0xFFEF4444, // Red
    'Cardio': 0xFFF97316, // Orange
    'HIIT': 0xFFF97316, // Orange
    'Pilates': 0xFFEC4899, // Pink
    'CrossFit': 0xFFF97316, // Orange
    'Wellness': 0xFF22C55E, // Green
    'Boxing': 0xFFEF4444, // Red
    'Mobility': 0xFF06B6D4, // Cyan
  };

  static String iconFor(String categoryName) =>
      icons[categoryName] ?? 'sparkles';

  static int colorFor(String categoryName) =>
      colorValues[categoryName] ?? 0xFF8B5CF6;
}
