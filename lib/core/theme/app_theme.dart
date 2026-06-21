import 'package:flutter/material.dart';

/// ZIRO.FIT design tokens.
///
/// Source: docs/implementation.md §2.1
/// Forced light mode only — no dark theme support.
class AppColors {
  AppColors._();

  static const Color primary = Color(0xFF007AFF);
  static const Color background = Color(0xFFFFFFFF);
  static const Color card = Color(0xFFFFFFFF);
  static const Color mutedSurface = Color(0xFFFAFAFA);
  static const Color borderMuted = Color(0xFFF4F4F5);
  static const Color borderActive = Color(0xFFE5E7EB);
  static const Color foreground = Color(0xFF18181B);
  static const Color mutedText = Color(0xFF71717A);
}

class AppTheme {
  AppTheme._();

  static ThemeData get lightTheme => ThemeData(
        brightness: Brightness.light,
        useMaterial3: true,
        colorSchemeSeed: AppColors.primary,
        scaffoldBackgroundColor: AppColors.background,

        // --- AppBar ---
        appBarTheme: const AppBarTheme(
          elevation: 0,
          centerTitle: true,
          backgroundColor: AppColors.background,
          foregroundColor: AppColors.foreground,
          surfaceTintColor: Colors.transparent,
        ),

        // --- Card ---
        cardTheme: CardThemeData(
          elevation: 0,
          color: AppColors.card,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
            side: const BorderSide(color: AppColors.borderMuted),
          ),
        ),

        // --- Input ---
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: AppColors.mutedSurface,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(99),
            borderSide: const BorderSide(color: AppColors.borderMuted),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(99),
            borderSide: const BorderSide(color: AppColors.borderMuted),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(99),
            borderSide: const BorderSide(color: AppColors.borderActive, width: 2),
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          labelStyle: const TextStyle(fontSize: 14.0, color: AppColors.mutedText),
        ),

        // --- Elevated Button ---
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary,
            foregroundColor: Colors.white,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(99),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            textStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0),
          ),
        ),

        // --- Text ---
        textTheme: const TextTheme(
          headlineMedium: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold, color: AppColors.foreground),
          bodyLarge: TextStyle(fontSize: 14.0, color: AppColors.foreground),
          bodyMedium: TextStyle(fontSize: 14.0, color: AppColors.foreground),
          labelLarge: TextStyle(fontSize: 14.0, color: AppColors.mutedText),
          labelSmall: TextStyle(fontSize: 12.0, color: AppColors.mutedText),
        ),

        // --- Divider ---
        dividerTheme: const DividerThemeData(
          color: AppColors.borderMuted,
          thickness: 1,
          space: 1,
        ),
      );
}
