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
      words: (json['words'] as List<dynamic>).map((e) => e as String).toList(),
      participantCount: json['participantCount'] as int,
      overallResults: (json['overallResults'] as List<dynamic>)
          .map((e) => e as int)
          .toList(),
      experimentType: json['experimentType'] as int,
      creator: UserModel.fromJson(json['creator'] as Map<String, dynamic>),
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
      'words': instance.words,
      'participantCount': instance.participantCount,
      'overallResults': instance.overallResults,
      'experimentType': instance.experimentType,
      'creator': instance.creator,
    };

_$_UserModel _$$_UserModelFromJson(Map<String, dynamic> json) => _$_UserModel(
      userId: json['userId'] as int,
      userEmail: json['userEmail'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      password: json['password'] as String,
      age: json['age'] as int,
      gender: json['gender'] as String?,
      degree: json['degree'] as String?,
      role: json['role'] as String,
      enabled: json['enabled'] as bool,
      authorities: (json['authorities'] as List<dynamic>)
          .map((e) => AuthorityModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      username: json['username'] as String,
      accountNonExpired: json['accountNonExpired'] as bool,
      accountNonLocked: json['accountNonLocked'] as bool,
      credentialsNonExpired: json['credentialsNonExpired'] as bool,
    );

Map<String, dynamic> _$$_UserModelToJson(_$_UserModel instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'userEmail': instance.userEmail,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'password': instance.password,
      'age': instance.age,
      'gender': instance.gender,
      'degree': instance.degree,
      'role': instance.role,
      'enabled': instance.enabled,
      'authorities': instance.authorities,
      'username': instance.username,
      'accountNonExpired': instance.accountNonExpired,
      'accountNonLocked': instance.accountNonLocked,
      'credentialsNonExpired': instance.credentialsNonExpired,
    };

_$_AuthorityModel _$$_AuthorityModelFromJson(Map<String, dynamic> json) =>
    _$_AuthorityModel(
      authority: json['authority'] as String,
    );

Map<String, dynamic> _$$_AuthorityModelToJson(_$_AuthorityModel instance) =>
    <String, dynamic>{
      'authority': instance.authority,
    };
