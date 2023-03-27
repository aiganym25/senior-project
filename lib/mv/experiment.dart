import 'package:freezed_annotation/freezed_annotation.dart';

part 'experiment.freezed.dart';
part 'experiment.g.dart';

@freezed
class NewExperiment with _$NewExperiment {
  const factory NewExperiment({
    @JsonSerializable(explicitToJson: true)
    required String name,
    required String description,
    required int numberOfWords,
    required double numberOfSecondsPerWord,
    required List<int> frequencyRange,
    required List<int> lengthOfWords,
  }) = _NewExperiment;

  factory NewExperiment.fromJson(Map<String, Object?> json)
      => _$NewExperimentFromJson(json);
}
