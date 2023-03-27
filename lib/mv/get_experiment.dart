import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_experiment.freezed.dart';
part 'get_experiment.g.dart';

@freezed
class GetExperiment with _$GetExperiment {
  factory GetExperiment({
    required Experiment data,
    required String message,
    required int status,
  }) = _GetExperiment;

  factory GetExperiment.fromJson(Map<String, dynamic> json) =>
      _$GetExperimentFromJson(json);
}

@freezed
class Experiment with _$Experiment {
  factory Experiment({
    required int experimentId,
    required String name,
    required String description,
    required String createdBy,
    required int numberOfWords,
    required List<int> lengthOfWords,
    required dynamic frequencyRange,
    required double numberOfSecondsPerWord,
    required List<String> words,
  }) = _Experiment;

  factory Experiment.fromJson(Map<String, dynamic> json) =>
      _$ExperimentFromJson(json);
}
