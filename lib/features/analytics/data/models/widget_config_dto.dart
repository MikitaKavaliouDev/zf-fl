import 'package:freezed_annotation/freezed_annotation.dart';

part 'widget_config_dto.freezed.dart';
part 'widget_config_dto.g.dart';

@freezed
abstract class WidgetConfigDto with _$WidgetConfigDto {
  const factory WidgetConfigDto({
    @Default(<WidgetConfigItem>[]) List<WidgetConfigItem> widgets,
  }) = _WidgetConfigDto;

  factory WidgetConfigDto.fromJson(Map<String, dynamic> json) =>
      _$WidgetConfigDtoFromJson(json);
}

@freezed
abstract class WidgetConfigItem with _$WidgetConfigItem {
  const factory WidgetConfigItem({
    required String id,
    required String type,
    @Default(true) bool isVisible,
    @Default(0) int order,
  }) = _WidgetConfigItem;

  factory WidgetConfigItem.fromJson(Map<String, dynamic> json) =>
      _$WidgetConfigItemFromJson(json);
}
