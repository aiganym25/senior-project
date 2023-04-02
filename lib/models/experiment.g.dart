// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'experiment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_NewExperiment _$$_NewExperimentFromJson(Map<String, dynamic> json) =>
    _$_NewExperiment(
      name: json['name'] as String,
      description: json['description'] as String,
      numberOfWords: json['numberOfWords'] as int,
      numberOfSecondsPerWord:
          (json['numberOfSecondsPerWord'] as num).toDouble(),
      frequencyRange: (json['frequencyRange'] as List<dynamic>)
          .map((e) => e as int)
          .toList(),
      lengthOfWords: (json['lengthOfWords'] as List<dynamic>)
          .map((e) => e as int)
          .toList(),
    );

Map<String, dynamic> _$$_NewExperimentToJson(_$_NewExperiment instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'numberOfWords': instance.numberOfWords,
      'numberOfSecondsPerWord': instance.numberOfSecondsPerWord,
      'frequencyRange': instance.frequencyRange,
      'lengthOfWords': instance.lengthOfWords,
    };
