// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'experiment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_NewExperiment _$$_NewExperimentFromJson(Map<String, dynamic> json) =>
    _$_NewExperiment(
      experimentName: json['experimentName'] as String,
      words: (json['words'] as List<dynamic>).map((e) => e as String).toList(),
      description: json['description'] as String,
      betweenWordTime: (json['betweenWordTime'] as num).toDouble(),
      wordTime: (json['wordTime'] as num).toDouble(),
      isJoinable: json['isJoinable'] as String,
    );

Map<String, dynamic> _$$_NewExperimentToJson(_$_NewExperiment instance) =>
    <String, dynamic>{
      'experimentName': instance.experimentName,
      'words': instance.words,
      'description': instance.description,
      'betweenWordTime': instance.betweenWordTime,
      'wordTime': instance.wordTime,
      'isJoinable': instance.isJoinable,
    };
