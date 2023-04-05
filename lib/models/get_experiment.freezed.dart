// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_experiment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MyCreatedExperiments _$MyCreatedExperimentsFromJson(Map<String, dynamic> json) {
  return _MyCreatedExperiments.fromJson(json);
}

/// @nodoc
mixin _$MyCreatedExperiments {
  int get experimentId => throw _privateConstructorUsedError;
  String get experimentName => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  double get betweenWordTime => throw _privateConstructorUsedError;
  double get wordTime => throw _privateConstructorUsedError;
  bool get isJoinable => throw _privateConstructorUsedError;
  int get numberOfWords => throw _privateConstructorUsedError;
  List<String> get words => throw _privateConstructorUsedError;
  int get participantCount => throw _privateConstructorUsedError;
  List<int> get overallResults => throw _privateConstructorUsedError;
  CreatorModel get creator => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MyCreatedExperimentsCopyWith<MyCreatedExperiments> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MyCreatedExperimentsCopyWith<$Res> {
  factory $MyCreatedExperimentsCopyWith(MyCreatedExperiments value,
          $Res Function(MyCreatedExperiments) then) =
      _$MyCreatedExperimentsCopyWithImpl<$Res, MyCreatedExperiments>;
  @useResult
  $Res call(
      {int experimentId,
      String experimentName,
      String description,
      double betweenWordTime,
      double wordTime,
      bool isJoinable,
      int numberOfWords,
      List<String> words,
      int participantCount,
      List<int> overallResults,
      CreatorModel creator});

  $CreatorModelCopyWith<$Res> get creator;
}

/// @nodoc
class _$MyCreatedExperimentsCopyWithImpl<$Res,
        $Val extends MyCreatedExperiments>
    implements $MyCreatedExperimentsCopyWith<$Res> {
  _$MyCreatedExperimentsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? experimentId = null,
    Object? experimentName = null,
    Object? description = null,
    Object? betweenWordTime = null,
    Object? wordTime = null,
    Object? isJoinable = null,
    Object? numberOfWords = null,
    Object? words = null,
    Object? participantCount = null,
    Object? overallResults = null,
    Object? creator = null,
  }) {
    return _then(_value.copyWith(
      experimentId: null == experimentId
          ? _value.experimentId
          : experimentId // ignore: cast_nullable_to_non_nullable
              as int,
      experimentName: null == experimentName
          ? _value.experimentName
          : experimentName // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      betweenWordTime: null == betweenWordTime
          ? _value.betweenWordTime
          : betweenWordTime // ignore: cast_nullable_to_non_nullable
              as double,
      wordTime: null == wordTime
          ? _value.wordTime
          : wordTime // ignore: cast_nullable_to_non_nullable
              as double,
      isJoinable: null == isJoinable
          ? _value.isJoinable
          : isJoinable // ignore: cast_nullable_to_non_nullable
              as bool,
      numberOfWords: null == numberOfWords
          ? _value.numberOfWords
          : numberOfWords // ignore: cast_nullable_to_non_nullable
              as int,
      words: null == words
          ? _value.words
          : words // ignore: cast_nullable_to_non_nullable
              as List<String>,
      participantCount: null == participantCount
          ? _value.participantCount
          : participantCount // ignore: cast_nullable_to_non_nullable
              as int,
      overallResults: null == overallResults
          ? _value.overallResults
          : overallResults // ignore: cast_nullable_to_non_nullable
              as List<int>,
      creator: null == creator
          ? _value.creator
          : creator // ignore: cast_nullable_to_non_nullable
              as CreatorModel,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CreatorModelCopyWith<$Res> get creator {
    return $CreatorModelCopyWith<$Res>(_value.creator, (value) {
      return _then(_value.copyWith(creator: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_MyCreatedExperimentsCopyWith<$Res>
    implements $MyCreatedExperimentsCopyWith<$Res> {
  factory _$$_MyCreatedExperimentsCopyWith(_$_MyCreatedExperiments value,
          $Res Function(_$_MyCreatedExperiments) then) =
      __$$_MyCreatedExperimentsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int experimentId,
      String experimentName,
      String description,
      double betweenWordTime,
      double wordTime,
      bool isJoinable,
      int numberOfWords,
      List<String> words,
      int participantCount,
      List<int> overallResults,
      CreatorModel creator});

  @override
  $CreatorModelCopyWith<$Res> get creator;
}

/// @nodoc
class __$$_MyCreatedExperimentsCopyWithImpl<$Res>
    extends _$MyCreatedExperimentsCopyWithImpl<$Res, _$_MyCreatedExperiments>
    implements _$$_MyCreatedExperimentsCopyWith<$Res> {
  __$$_MyCreatedExperimentsCopyWithImpl(_$_MyCreatedExperiments _value,
      $Res Function(_$_MyCreatedExperiments) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? experimentId = null,
    Object? experimentName = null,
    Object? description = null,
    Object? betweenWordTime = null,
    Object? wordTime = null,
    Object? isJoinable = null,
    Object? numberOfWords = null,
    Object? words = null,
    Object? participantCount = null,
    Object? overallResults = null,
    Object? creator = null,
  }) {
    return _then(_$_MyCreatedExperiments(
      experimentId: null == experimentId
          ? _value.experimentId
          : experimentId // ignore: cast_nullable_to_non_nullable
              as int,
      experimentName: null == experimentName
          ? _value.experimentName
          : experimentName // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      betweenWordTime: null == betweenWordTime
          ? _value.betweenWordTime
          : betweenWordTime // ignore: cast_nullable_to_non_nullable
              as double,
      wordTime: null == wordTime
          ? _value.wordTime
          : wordTime // ignore: cast_nullable_to_non_nullable
              as double,
      isJoinable: null == isJoinable
          ? _value.isJoinable
          : isJoinable // ignore: cast_nullable_to_non_nullable
              as bool,
      numberOfWords: null == numberOfWords
          ? _value.numberOfWords
          : numberOfWords // ignore: cast_nullable_to_non_nullable
              as int,
      words: null == words
          ? _value._words
          : words // ignore: cast_nullable_to_non_nullable
              as List<String>,
      participantCount: null == participantCount
          ? _value.participantCount
          : participantCount // ignore: cast_nullable_to_non_nullable
              as int,
      overallResults: null == overallResults
          ? _value._overallResults
          : overallResults // ignore: cast_nullable_to_non_nullable
              as List<int>,
      creator: null == creator
          ? _value.creator
          : creator // ignore: cast_nullable_to_non_nullable
              as CreatorModel,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MyCreatedExperiments implements _MyCreatedExperiments {
  const _$_MyCreatedExperiments(
      {required this.experimentId,
      required this.experimentName,
      required this.description,
      required this.betweenWordTime,
      required this.wordTime,
      required this.isJoinable,
      required this.numberOfWords,
      required final List<String> words,
      required this.participantCount,
      required final List<int> overallResults,
      required this.creator})
      : _words = words,
        _overallResults = overallResults;

  factory _$_MyCreatedExperiments.fromJson(Map<String, dynamic> json) =>
      _$$_MyCreatedExperimentsFromJson(json);

  @override
  final int experimentId;
  @override
  final String experimentName;
  @override
  final String description;
  @override
  final double betweenWordTime;
  @override
  final double wordTime;
  @override
  final bool isJoinable;
  @override
  final int numberOfWords;
  final List<String> _words;
  @override
  List<String> get words {
    if (_words is EqualUnmodifiableListView) return _words;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_words);
  }

  @override
  final int participantCount;
  final List<int> _overallResults;
  @override
  List<int> get overallResults {
    if (_overallResults is EqualUnmodifiableListView) return _overallResults;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_overallResults);
  }

  @override
  final CreatorModel creator;

  @override
  String toString() {
    return 'MyCreatedExperiments(experimentId: $experimentId, experimentName: $experimentName, description: $description, betweenWordTime: $betweenWordTime, wordTime: $wordTime, isJoinable: $isJoinable, numberOfWords: $numberOfWords, words: $words, participantCount: $participantCount, overallResults: $overallResults, creator: $creator)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MyCreatedExperiments &&
            (identical(other.experimentId, experimentId) ||
                other.experimentId == experimentId) &&
            (identical(other.experimentName, experimentName) ||
                other.experimentName == experimentName) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.betweenWordTime, betweenWordTime) ||
                other.betweenWordTime == betweenWordTime) &&
            (identical(other.wordTime, wordTime) ||
                other.wordTime == wordTime) &&
            (identical(other.isJoinable, isJoinable) ||
                other.isJoinable == isJoinable) &&
            (identical(other.numberOfWords, numberOfWords) ||
                other.numberOfWords == numberOfWords) &&
            const DeepCollectionEquality().equals(other._words, _words) &&
            (identical(other.participantCount, participantCount) ||
                other.participantCount == participantCount) &&
            const DeepCollectionEquality()
                .equals(other._overallResults, _overallResults) &&
            (identical(other.creator, creator) || other.creator == creator));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      experimentId,
      experimentName,
      description,
      betweenWordTime,
      wordTime,
      isJoinable,
      numberOfWords,
      const DeepCollectionEquality().hash(_words),
      participantCount,
      const DeepCollectionEquality().hash(_overallResults),
      creator);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MyCreatedExperimentsCopyWith<_$_MyCreatedExperiments> get copyWith =>
      __$$_MyCreatedExperimentsCopyWithImpl<_$_MyCreatedExperiments>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MyCreatedExperimentsToJson(
      this,
    );
  }
}

abstract class _MyCreatedExperiments implements MyCreatedExperiments {
  const factory _MyCreatedExperiments(
      {required final int experimentId,
      required final String experimentName,
      required final String description,
      required final double betweenWordTime,
      required final double wordTime,
      required final bool isJoinable,
      required final int numberOfWords,
      required final List<String> words,
      required final int participantCount,
      required final List<int> overallResults,
      required final CreatorModel creator}) = _$_MyCreatedExperiments;

  factory _MyCreatedExperiments.fromJson(Map<String, dynamic> json) =
      _$_MyCreatedExperiments.fromJson;

  @override
  int get experimentId;
  @override
  String get experimentName;
  @override
  String get description;
  @override
  double get betweenWordTime;
  @override
  double get wordTime;
  @override
  bool get isJoinable;
  @override
  int get numberOfWords;
  @override
  List<String> get words;
  @override
  int get participantCount;
  @override
  List<int> get overallResults;
  @override
  CreatorModel get creator;
  @override
  @JsonKey(ignore: true)
  _$$_MyCreatedExperimentsCopyWith<_$_MyCreatedExperiments> get copyWith =>
      throw _privateConstructorUsedError;
}

CreatorModel _$CreatorModelFromJson(Map<String, dynamic> json) {
  return _CreatorModel.fromJson(json);
}

/// @nodoc
mixin _$CreatorModel {
  int? get userId => throw _privateConstructorUsedError;
  String? get userEmail => throw _privateConstructorUsedError;
  String? get firstName => throw _privateConstructorUsedError;
  String? get lastName => throw _privateConstructorUsedError;
  int? get age => throw _privateConstructorUsedError;
  String? get gender => throw _privateConstructorUsedError;
  String? get degree => throw _privateConstructorUsedError;
  String? get role => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CreatorModelCopyWith<CreatorModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreatorModelCopyWith<$Res> {
  factory $CreatorModelCopyWith(
          CreatorModel value, $Res Function(CreatorModel) then) =
      _$CreatorModelCopyWithImpl<$Res, CreatorModel>;
  @useResult
  $Res call(
      {int? userId,
      String? userEmail,
      String? firstName,
      String? lastName,
      int? age,
      String? gender,
      String? degree,
      String? role});
}

/// @nodoc
class _$CreatorModelCopyWithImpl<$Res, $Val extends CreatorModel>
    implements $CreatorModelCopyWith<$Res> {
  _$CreatorModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = freezed,
    Object? userEmail = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? age = freezed,
    Object? gender = freezed,
    Object? degree = freezed,
    Object? role = freezed,
  }) {
    return _then(_value.copyWith(
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      userEmail: freezed == userEmail
          ? _value.userEmail
          : userEmail // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      age: freezed == age
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as int?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      degree: freezed == degree
          ? _value.degree
          : degree // ignore: cast_nullable_to_non_nullable
              as String?,
      role: freezed == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CreatorModelCopyWith<$Res>
    implements $CreatorModelCopyWith<$Res> {
  factory _$$_CreatorModelCopyWith(
          _$_CreatorModel value, $Res Function(_$_CreatorModel) then) =
      __$$_CreatorModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? userId,
      String? userEmail,
      String? firstName,
      String? lastName,
      int? age,
      String? gender,
      String? degree,
      String? role});
}

/// @nodoc
class __$$_CreatorModelCopyWithImpl<$Res>
    extends _$CreatorModelCopyWithImpl<$Res, _$_CreatorModel>
    implements _$$_CreatorModelCopyWith<$Res> {
  __$$_CreatorModelCopyWithImpl(
      _$_CreatorModel _value, $Res Function(_$_CreatorModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = freezed,
    Object? userEmail = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? age = freezed,
    Object? gender = freezed,
    Object? degree = freezed,
    Object? role = freezed,
  }) {
    return _then(_$_CreatorModel(
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      userEmail: freezed == userEmail
          ? _value.userEmail
          : userEmail // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      age: freezed == age
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as int?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      degree: freezed == degree
          ? _value.degree
          : degree // ignore: cast_nullable_to_non_nullable
              as String?,
      role: freezed == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CreatorModel implements _CreatorModel {
  const _$_CreatorModel(
      {this.userId,
      this.userEmail,
      this.firstName,
      this.lastName,
      this.age,
      this.gender,
      this.degree,
      this.role});

  factory _$_CreatorModel.fromJson(Map<String, dynamic> json) =>
      _$$_CreatorModelFromJson(json);

  @override
  final int? userId;
  @override
  final String? userEmail;
  @override
  final String? firstName;
  @override
  final String? lastName;
  @override
  final int? age;
  @override
  final String? gender;
  @override
  final String? degree;
  @override
  final String? role;

  @override
  String toString() {
    return 'CreatorModel(userId: $userId, userEmail: $userEmail, firstName: $firstName, lastName: $lastName, age: $age, gender: $gender, degree: $degree, role: $role)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CreatorModel &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.userEmail, userEmail) ||
                other.userEmail == userEmail) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.age, age) || other.age == age) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.degree, degree) || other.degree == degree) &&
            (identical(other.role, role) || other.role == role));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, userId, userEmail, firstName,
      lastName, age, gender, degree, role);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CreatorModelCopyWith<_$_CreatorModel> get copyWith =>
      __$$_CreatorModelCopyWithImpl<_$_CreatorModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CreatorModelToJson(
      this,
    );
  }
}

abstract class _CreatorModel implements CreatorModel {
  const factory _CreatorModel(
      {final int? userId,
      final String? userEmail,
      final String? firstName,
      final String? lastName,
      final int? age,
      final String? gender,
      final String? degree,
      final String? role}) = _$_CreatorModel;

  factory _CreatorModel.fromJson(Map<String, dynamic> json) =
      _$_CreatorModel.fromJson;

  @override
  int? get userId;
  @override
  String? get userEmail;
  @override
  String? get firstName;
  @override
  String? get lastName;
  @override
  int? get age;
  @override
  String? get gender;
  @override
  String? get degree;
  @override
  String? get role;
  @override
  @JsonKey(ignore: true)
  _$$_CreatorModelCopyWith<_$_CreatorModel> get copyWith =>
      throw _privateConstructorUsedError;
}
