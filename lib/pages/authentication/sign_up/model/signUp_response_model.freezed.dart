// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'signUp_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SignUpResponseModel _$SignUpResponseModelFromJson(Map<String, dynamic> json) {
  return _SignUpResponseModel.fromJson(json);
}

/// @nodoc
mixin _$SignUpResponseModel {
  @JsonSerializable(explicitToJson: true)
  String get userEmail => throw _privateConstructorUsedError;
  String get firstName => throw _privateConstructorUsedError;
  String get lastName => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  String get age => throw _privateConstructorUsedError;
  String get gender => throw _privateConstructorUsedError;
  String get degree => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SignUpResponseModelCopyWith<SignUpResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignUpResponseModelCopyWith<$Res> {
  factory $SignUpResponseModelCopyWith(
          SignUpResponseModel value, $Res Function(SignUpResponseModel) then) =
      _$SignUpResponseModelCopyWithImpl<$Res, SignUpResponseModel>;
  @useResult
  $Res call(
      {@JsonSerializable(explicitToJson: true) String userEmail,
      String firstName,
      String lastName,
      String password,
      String age,
      String gender,
      String degree});
}

/// @nodoc
class _$SignUpResponseModelCopyWithImpl<$Res, $Val extends SignUpResponseModel>
    implements $SignUpResponseModelCopyWith<$Res> {
  _$SignUpResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userEmail = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? password = null,
    Object? age = null,
    Object? gender = null,
    Object? degree = null,
  }) {
    return _then(_value.copyWith(
      userEmail: null == userEmail
          ? _value.userEmail
          : userEmail // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      age: null == age
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as String,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String,
      degree: null == degree
          ? _value.degree
          : degree // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SignUpResponseModelCopyWith<$Res>
    implements $SignUpResponseModelCopyWith<$Res> {
  factory _$$_SignUpResponseModelCopyWith(_$_SignUpResponseModel value,
          $Res Function(_$_SignUpResponseModel) then) =
      __$$_SignUpResponseModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonSerializable(explicitToJson: true) String userEmail,
      String firstName,
      String lastName,
      String password,
      String age,
      String gender,
      String degree});
}

/// @nodoc
class __$$_SignUpResponseModelCopyWithImpl<$Res>
    extends _$SignUpResponseModelCopyWithImpl<$Res, _$_SignUpResponseModel>
    implements _$$_SignUpResponseModelCopyWith<$Res> {
  __$$_SignUpResponseModelCopyWithImpl(_$_SignUpResponseModel _value,
      $Res Function(_$_SignUpResponseModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userEmail = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? password = null,
    Object? age = null,
    Object? gender = null,
    Object? degree = null,
  }) {
    return _then(_$_SignUpResponseModel(
      userEmail: null == userEmail
          ? _value.userEmail
          : userEmail // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      age: null == age
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as String,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String,
      degree: null == degree
          ? _value.degree
          : degree // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SignUpResponseModel implements _SignUpResponseModel {
  const _$_SignUpResponseModel(
      {@JsonSerializable(explicitToJson: true) required this.userEmail,
      required this.firstName,
      required this.lastName,
      required this.password,
      required this.age,
      required this.gender,
      required this.degree});

  factory _$_SignUpResponseModel.fromJson(Map<String, dynamic> json) =>
      _$$_SignUpResponseModelFromJson(json);

  @override
  @JsonSerializable(explicitToJson: true)
  final String userEmail;
  @override
  final String firstName;
  @override
  final String lastName;
  @override
  final String password;
  @override
  final String age;
  @override
  final String gender;
  @override
  final String degree;

  @override
  String toString() {
    return 'SignUpResponseModel(userEmail: $userEmail, firstName: $firstName, lastName: $lastName, password: $password, age: $age, gender: $gender, degree: $degree)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SignUpResponseModel &&
            (identical(other.userEmail, userEmail) ||
                other.userEmail == userEmail) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.age, age) || other.age == age) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.degree, degree) || other.degree == degree));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, userEmail, firstName, lastName,
      password, age, gender, degree);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SignUpResponseModelCopyWith<_$_SignUpResponseModel> get copyWith =>
      __$$_SignUpResponseModelCopyWithImpl<_$_SignUpResponseModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SignUpResponseModelToJson(
      this,
    );
  }
}

abstract class _SignUpResponseModel implements SignUpResponseModel {
  const factory _SignUpResponseModel(
      {@JsonSerializable(explicitToJson: true) required final String userEmail,
      required final String firstName,
      required final String lastName,
      required final String password,
      required final String age,
      required final String gender,
      required final String degree}) = _$_SignUpResponseModel;

  factory _SignUpResponseModel.fromJson(Map<String, dynamic> json) =
      _$_SignUpResponseModel.fromJson;

  @override
  @JsonSerializable(explicitToJson: true)
  String get userEmail;
  @override
  String get firstName;
  @override
  String get lastName;
  @override
  String get password;
  @override
  String get age;
  @override
  String get gender;
  @override
  String get degree;
  @override
  @JsonKey(ignore: true)
  _$$_SignUpResponseModelCopyWith<_$_SignUpResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}
