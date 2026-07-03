// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProductDto _$ProductDtoFromJson(Map<String, dynamic> json) => _ProductDto(
  id: json['id'] as String,
  recipeId: json['recipeId'] as String,
  name: json['name'] as String,
  brand: json['brand'] as String?,
  amount: json['amount'] as String?,
  isRecommended: json['isRecommended'] as bool,
);

Map<String, dynamic> _$ProductDtoToJson(_ProductDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'recipeId': instance.recipeId,
      'name': instance.name,
      'brand': instance.brand,
      'amount': instance.amount,
      'isRecommended': instance.isRecommended,
    };
