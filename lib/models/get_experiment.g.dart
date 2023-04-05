// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_experiment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MyCreatedExperiments _$$_MyCreatedExperimentsFromJson(
        Map<String, dynamic> json) =>
    _$_MyCreatedExperiments(
      experimentId: json['experimentId'] as int,
      experimentName: json['experimentName'] as String,
      description: json['description'] as String,
      betweenWordTime: (json['betweenWordTime'] as num).toDouble(),
      wordTime: (json['wordTime'] as num).toDouble(),
      isJoinable: json['isJoinable'] as bool,
      numberOfWords: json['numberOfWords'] as int,
      words: (json['words'] as List<dynamic>).map((e) => e as String).toList(),
      participantCount: json['participantCount'] as int,
      overallResults: (json['overallResults'] as List<dynamic>)
          .map((e) => e as int)
          .toList(),
      creator: CreatorModel.fromJson(json['creator'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_MyCreatedExperimentsToJson(
        _$_MyCreatedExperiments instance) =>
    <String, dynamic>{
      'experimentId': instance.experimentId,
      'experimentName': instance.experimentName,
      'description': instance.description,
      'betweenWordTime': instance.betweenWordTime,
      'wordTime': instance.wordTime,
      'isJoinable': instance.isJoinable,
      'numberOfWords': instance.numberOfWords,
      'words': instance.words,
      'participantCount': instance.participantCount,
      'overallResults': instance.overallResults,
      'creator': instance.creator,
    };

_$_CreatorModel _$$_CreatorModelFromJson(Map<String, dynamic> json) =>
    _$_CreatorModel(
      userId: json['userId'] as int?,
      userEmail: json['userEmail'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      age: json['age'] as int?,
      gender: json['gender'] as String?,
      degree: json['degree'] as String?,
      role: json['role'] as String?,
    );

Map<String, dynamic> _$$_CreatorModelToJson(_$_CreatorModel instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'userEmail': instance.userEmail,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'age': instance.age,
      'gender': instance.gender,
      'degree': instance.degree,
      'role': instance.role,
    };
