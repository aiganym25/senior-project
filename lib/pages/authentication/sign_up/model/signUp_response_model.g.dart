// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signUp_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SignUpResponseModel _$$_SignUpResponseModelFromJson(
        Map<String, dynamic> json) =>
    _$_SignUpResponseModel(
      userEmail: json['userEmail'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      password: json['password'] as String,
      age: json['age'] as String,
      gender: json['gender'] as String,
      degree: json['degree'] as String,
    );

Map<String, dynamic> _$$_SignUpResponseModelToJson(
        _$_SignUpResponseModel instance) =>
    <String, dynamic>{
      'userEmail': instance.userEmail,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'password': instance.password,
      'age': instance.age,
      'gender': instance.gender,
      'degree': instance.degree,
    };
