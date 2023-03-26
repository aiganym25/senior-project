import 'package:freezed_annotation/freezed_annotation.dart';

part 'experiment.freezed.dart';
part 'experiment.g.dart';

@freezed
class Experiment with _$Experiment {
  const factory Experiment({
    @JsonSerializable(explicitToJson: true)
    required String name,
    required String description,
    required int numberOfWords,
    required double numberOfSecondsPerWord,
    required List<int> frequencyRange,
    required List<int> lengthOfWords,
  }) = _Experiment;

  factory Experiment.fromJson(Map<String, Object?> json)
      => _$ExperimentFromJson(json);
}
