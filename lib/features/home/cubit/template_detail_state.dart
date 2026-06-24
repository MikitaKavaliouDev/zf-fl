import 'package:freezed_annotation/freezed_annotation.dart';

import '../../trainers/data/models/template_dto.dart';

part 'template_detail_state.freezed.dart';

@freezed
sealed class TemplateDetailState with _$TemplateDetailState {
  const factory TemplateDetailState.initial() = TemplateDetailInitial;

  const factory TemplateDetailState.loading() = TemplateDetailLoading;

  const factory TemplateDetailState.loaded({
    required TemplateDto template,
    required List<TemplateExerciseDto> exercises,
  }) = TemplateDetailLoaded;

  const factory TemplateDetailState.error(String message) =
      TemplateDetailError;
}
