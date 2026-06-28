import 'package:freezed_annotation/freezed_annotation.dart';

import 'program_dto.dart';

part 'program_detail_response.freezed.dart';
part 'program_detail_response.g.dart';

/// Response from GET /api/client/programs/[id].
///
/// Backend shape (from route.ts):
/// ```json
/// {
///   "program": { ... full ProgramDto with templates & exercises ... },
///   "isActive": true
/// }
/// ```
@freezed
abstract class ProgramDetailResponse with _$ProgramDetailResponse {
  const factory ProgramDetailResponse({
    required ProgramDto program,
    @Default(false) bool isActive,
  }) = _ProgramDetailResponse;

  factory ProgramDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$ProgramDetailResponseFromJson(json);
}
