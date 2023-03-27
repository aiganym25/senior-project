// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_experiment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GetExperiment _$$_GetExperimentFromJson(Map<String, dynamic> json) =>
    _$_GetExperiment(
      data: Experiment.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String,
      status: json['status'] as int,
    );

Map<String, dynamic> _$$_GetExperimentToJson(_$_GetExperiment instance) =>
    <String, dynamic>{
      'data': instance.data,
      'message': instance.message,
      'status': instance.status,
    };

_$_Experiment _$$_ExperimentFromJson(Map<String, dynamic> json) =>
    _$_Experiment(
      experimentId: json['experimentId'] as int,
      name: json['name'] as String,
      description: json['description'] as String,
      createdBy: json['createdBy'] as String,
      numberOfWords: json['numberOfWords'] as int,
      lengthOfWords: (json['lengthOfWords'] as List<dynamic>)
          .map((e) => e as int)
          .toList(),
      frequencyRange: json['frequencyRange'],
      numberOfSecondsPerWord:
          (json['numberOfSecondsPerWord'] as num).toDouble(),
      words: (json['words'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$_ExperimentToJson(_$_Experiment instance) =>
    <String, dynamic>{
      'experimentId': instance.experimentId,
      'name': instance.name,
      'description': instance.description,
      'createdBy': instance.createdBy,
      'numberOfWords': instance.numberOfWords,
      'lengthOfWords': instance.lengthOfWords,
      'frequencyRange': instance.frequencyRange,
      'numberOfSecondsPerWord': instance.numberOfSecondsPerWord,
      'words': instance.words,
    };
