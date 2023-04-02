// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signUp_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SignUpRequestModel _$$_SignUpRequestModelFromJson(
        Map<String, dynamic> json) =>
    _$_SignUpRequestModel(
      userEmail: json['userEmail'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      password: json['password'] as String,
      age: json['age'] as String,
      gender: json['gender'] as String,
      degree: json['degree'] as String,
    );

Map<String, dynamic> _$$_SignUpRequestModelToJson(
        _$_SignUpRequestModel instance) =>
    <String, dynamic>{
      'userEmail': instance.userEmail,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'password': instance.password,
      'age': instance.age,
      'gender': instance.gender,
      'degree': instance.degree,
    };
