import 'package:freezed_annotation/freezed_annotation.dart';

part 'experiment.freezed.dart';
part 'experiment.g.dart';

@freezed
class NewExperiment with _$NewExperiment {
  const factory NewExperiment({
    @JsonSerializable(explicitToJson: true)
    required String experimentName,
    required List<String> words,
    required String description,
    required String experimentType,
    required double betweenWordTime,
    required double wordTime,
    required String isJoinable
  }) = _NewExperiment;

  factory NewExperiment.fromJson(Map<String, Object?> json)
      => _$NewExperimentFromJson(json);
}
