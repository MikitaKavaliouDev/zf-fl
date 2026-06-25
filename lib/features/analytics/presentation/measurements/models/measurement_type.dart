import 'package:flutter/material.dart';

class MeasurementType {
  final String id;
  final String name;
  final String category; // 'core' or 'bodyPart'
  final IconData? icon;
  final String unit;

  const MeasurementType({
    required this.id,
    required this.name,
    required this.category,
    this.icon,
    required this.unit,
  });
}
