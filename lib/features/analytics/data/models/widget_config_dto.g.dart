// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'widget_config_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WidgetConfigDto _$WidgetConfigDtoFromJson(Map<String, dynamic> json) =>
    _WidgetConfigDto(
      widgets:
          (json['widgets'] as List<dynamic>?)
              ?.map((e) => WidgetConfigItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <WidgetConfigItem>[],
    );

Map<String, dynamic> _$WidgetConfigDtoToJson(_WidgetConfigDto instance) =>
    <String, dynamic>{'widgets': instance.widgets};

_WidgetConfigItem _$WidgetConfigItemFromJson(Map<String, dynamic> json) =>
    _WidgetConfigItem(
      id: json['id'] as String,
      type: json['type'] as String,
      isVisible: json['isVisible'] as bool? ?? true,
      order: (json['order'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$WidgetConfigItemToJson(_WidgetConfigItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'isVisible': instance.isVisible,
      'order': instance.order,
    };
