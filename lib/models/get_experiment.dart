import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_experiment.freezed.dart';
part 'get_experiment.g.dart';

@freezed
abstract class MyCreatedExperiments with _$MyCreatedExperiments {
  const factory MyCreatedExperiments({
    required int experimentId,
    required String experimentName,
    required String description,
    required double betweenWordTime,
    required double wordTime,
    required bool isJoinable,
    required int numberOfWords,
    required List<String> words,
    required int participantCount,
    required List<int> overallResults,
    required CreatorModel creator,
  }) = _MyCreatedExperiments;

  factory MyCreatedExperiments.fromJson(Map<String, dynamic> json) =>
      _$MyCreatedExperimentsFromJson(json);
}

@freezed
abstract class CreatorModel with _$CreatorModel {
  const factory CreatorModel({
    int? userId,
    String? userEmail,
    String? firstName,
    String? lastName,
    int? age,
    String? gender,
    String? degree,
    String? role,
  }) = _CreatorModel;

  factory CreatorModel.fromJson(Map<String, dynamic> json) =>
      _$CreatorModelFromJson(json);
}
