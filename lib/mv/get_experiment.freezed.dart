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

GetExperiment _$GetExperimentFromJson(Map<String, dynamic> json) {
  return _GetExperiment.fromJson(json);
}

/// @nodoc
mixin _$GetExperiment {
  Experiment get data => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  int get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GetExperimentCopyWith<GetExperiment> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetExperimentCopyWith<$Res> {
  factory $GetExperimentCopyWith(
          GetExperiment value, $Res Function(GetExperiment) then) =
      _$GetExperimentCopyWithImpl<$Res, GetExperiment>;
  @useResult
  $Res call({Experiment data, String message, int status});

  $ExperimentCopyWith<$Res> get data;
}

/// @nodoc
class _$GetExperimentCopyWithImpl<$Res, $Val extends GetExperiment>
    implements $GetExperimentCopyWith<$Res> {
  _$GetExperimentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? message = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Experiment,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ExperimentCopyWith<$Res> get data {
    return $ExperimentCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_GetExperimentCopyWith<$Res>
    implements $GetExperimentCopyWith<$Res> {
  factory _$$_GetExperimentCopyWith(
          _$_GetExperiment value, $Res Function(_$_GetExperiment) then) =
      __$$_GetExperimentCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Experiment data, String message, int status});

  @override
  $ExperimentCopyWith<$Res> get data;
}

/// @nodoc
class __$$_GetExperimentCopyWithImpl<$Res>
    extends _$GetExperimentCopyWithImpl<$Res, _$_GetExperiment>
    implements _$$_GetExperimentCopyWith<$Res> {
  __$$_GetExperimentCopyWithImpl(
      _$_GetExperiment _value, $Res Function(_$_GetExperiment) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? message = null,
    Object? status = null,
  }) {
    return _then(_$_GetExperiment(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Experiment,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GetExperiment implements _GetExperiment {
  _$_GetExperiment(
      {required this.data, required this.message, required this.status});

  factory _$_GetExperiment.fromJson(Map<String, dynamic> json) =>
      _$$_GetExperimentFromJson(json);

  @override
  final Experiment data;
  @override
  final String message;
  @override
  final int status;

  @override
  String toString() {
    return 'GetExperiment(data: $data, message: $message, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GetExperiment &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, data, message, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GetExperimentCopyWith<_$_GetExperiment> get copyWith =>
      __$$_GetExperimentCopyWithImpl<_$_GetExperiment>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GetExperimentToJson(
      this,
    );
  }
}

abstract class _GetExperiment implements GetExperiment {
  factory _GetExperiment(
      {required final Experiment data,
      required final String message,
      required final int status}) = _$_GetExperiment;

  factory _GetExperiment.fromJson(Map<String, dynamic> json) =
      _$_GetExperiment.fromJson;

  @override
  Experiment get data;
  @override
  String get message;
  @override
  int get status;
  @override
  @JsonKey(ignore: true)
  _$$_GetExperimentCopyWith<_$_GetExperiment> get copyWith =>
      throw _privateConstructorUsedError;
}

Experiment _$ExperimentFromJson(Map<String, dynamic> json) {
  return _Experiment.fromJson(json);
}

/// @nodoc
mixin _$Experiment {
  int get experimentId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get createdBy => throw _privateConstructorUsedError;
  int get numberOfWords => throw _privateConstructorUsedError;
  List<int> get lengthOfWords => throw _privateConstructorUsedError;
  dynamic get frequencyRange => throw _privateConstructorUsedError;
  double get numberOfSecondsPerWord => throw _privateConstructorUsedError;
  List<String> get words => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ExperimentCopyWith<Experiment> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExperimentCopyWith<$Res> {
  factory $ExperimentCopyWith(
          Experiment value, $Res Function(Experiment) then) =
      _$ExperimentCopyWithImpl<$Res, Experiment>;
  @useResult
  $Res call(
      {int experimentId,
      String name,
      String description,
      String createdBy,
      int numberOfWords,
      List<int> lengthOfWords,
      dynamic frequencyRange,
      double numberOfSecondsPerWord,
      List<String> words});
}

/// @nodoc
class _$ExperimentCopyWithImpl<$Res, $Val extends Experiment>
    implements $ExperimentCopyWith<$Res> {
  _$ExperimentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? experimentId = null,
    Object? name = null,
    Object? description = null,
    Object? createdBy = null,
    Object? numberOfWords = null,
    Object? lengthOfWords = null,
    Object? frequencyRange = freezed,
    Object? numberOfSecondsPerWord = null,
    Object? words = null,
  }) {
    return _then(_value.copyWith(
      experimentId: null == experimentId
          ? _value.experimentId
          : experimentId // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      createdBy: null == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String,
      numberOfWords: null == numberOfWords
          ? _value.numberOfWords
          : numberOfWords // ignore: cast_nullable_to_non_nullable
              as int,
      lengthOfWords: null == lengthOfWords
          ? _value.lengthOfWords
          : lengthOfWords // ignore: cast_nullable_to_non_nullable
              as List<int>,
      frequencyRange: freezed == frequencyRange
          ? _value.frequencyRange
          : frequencyRange // ignore: cast_nullable_to_non_nullable
              as dynamic,
      numberOfSecondsPerWord: null == numberOfSecondsPerWord
          ? _value.numberOfSecondsPerWord
          : numberOfSecondsPerWord // ignore: cast_nullable_to_non_nullable
              as double,
      words: null == words
          ? _value.words
          : words // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ExperimentCopyWith<$Res>
    implements $ExperimentCopyWith<$Res> {
  factory _$$_ExperimentCopyWith(
          _$_Experiment value, $Res Function(_$_Experiment) then) =
      __$$_ExperimentCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int experimentId,
      String name,
      String description,
      String createdBy,
      int numberOfWords,
      List<int> lengthOfWords,
      dynamic frequencyRange,
      double numberOfSecondsPerWord,
      List<String> words});
}

/// @nodoc
class __$$_ExperimentCopyWithImpl<$Res>
    extends _$ExperimentCopyWithImpl<$Res, _$_Experiment>
    implements _$$_ExperimentCopyWith<$Res> {
  __$$_ExperimentCopyWithImpl(
      _$_Experiment _value, $Res Function(_$_Experiment) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? experimentId = null,
    Object? name = null,
    Object? description = null,
    Object? createdBy = null,
    Object? numberOfWords = null,
    Object? lengthOfWords = null,
    Object? frequencyRange = freezed,
    Object? numberOfSecondsPerWord = null,
    Object? words = null,
  }) {
    return _then(_$_Experiment(
      experimentId: null == experimentId
          ? _value.experimentId
          : experimentId // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      createdBy: null == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String,
      numberOfWords: null == numberOfWords
          ? _value.numberOfWords
          : numberOfWords // ignore: cast_nullable_to_non_nullable
              as int,
      lengthOfWords: null == lengthOfWords
          ? _value._lengthOfWords
          : lengthOfWords // ignore: cast_nullable_to_non_nullable
              as List<int>,
      frequencyRange: freezed == frequencyRange
          ? _value.frequencyRange
          : frequencyRange // ignore: cast_nullable_to_non_nullable
              as dynamic,
      numberOfSecondsPerWord: null == numberOfSecondsPerWord
          ? _value.numberOfSecondsPerWord
          : numberOfSecondsPerWord // ignore: cast_nullable_to_non_nullable
              as double,
      words: null == words
          ? _value._words
          : words // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Experiment implements _Experiment {
  _$_Experiment(
      {required this.experimentId,
      required this.name,
      required this.description,
      required this.createdBy,
      required this.numberOfWords,
      required final List<int> lengthOfWords,
      required this.frequencyRange,
      required this.numberOfSecondsPerWord,
      required final List<String> words})
      : _lengthOfWords = lengthOfWords,
        _words = words;

  factory _$_Experiment.fromJson(Map<String, dynamic> json) =>
      _$$_ExperimentFromJson(json);

  @override
  final int experimentId;
  @override
  final String name;
  @override
  final String description;
  @override
  final String createdBy;
  @override
  final int numberOfWords;
  final List<int> _lengthOfWords;
  @override
  List<int> get lengthOfWords {
    if (_lengthOfWords is EqualUnmodifiableListView) return _lengthOfWords;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_lengthOfWords);
  }

  @override
  final dynamic frequencyRange;
  @override
  final double numberOfSecondsPerWord;
  final List<String> _words;
  @override
  List<String> get words {
    if (_words is EqualUnmodifiableListView) return _words;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_words);
  }

  @override
  String toString() {
    return 'Experiment(experimentId: $experimentId, name: $name, description: $description, createdBy: $createdBy, numberOfWords: $numberOfWords, lengthOfWords: $lengthOfWords, frequencyRange: $frequencyRange, numberOfSecondsPerWord: $numberOfSecondsPerWord, words: $words)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Experiment &&
            (identical(other.experimentId, experimentId) ||
                other.experimentId == experimentId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.numberOfWords, numberOfWords) ||
                other.numberOfWords == numberOfWords) &&
            const DeepCollectionEquality()
                .equals(other._lengthOfWords, _lengthOfWords) &&
            const DeepCollectionEquality()
                .equals(other.frequencyRange, frequencyRange) &&
            (identical(other.numberOfSecondsPerWord, numberOfSecondsPerWord) ||
                other.numberOfSecondsPerWord == numberOfSecondsPerWord) &&
            const DeepCollectionEquality().equals(other._words, _words));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      experimentId,
      name,
      description,
      createdBy,
      numberOfWords,
      const DeepCollectionEquality().hash(_lengthOfWords),
      const DeepCollectionEquality().hash(frequencyRange),
      numberOfSecondsPerWord,
      const DeepCollectionEquality().hash(_words));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ExperimentCopyWith<_$_Experiment> get copyWith =>
      __$$_ExperimentCopyWithImpl<_$_Experiment>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ExperimentToJson(
      this,
    );
  }
}

abstract class _Experiment implements Experiment {
  factory _Experiment(
      {required final int experimentId,
      required final String name,
      required final String description,
      required final String createdBy,
      required final int numberOfWords,
      required final List<int> lengthOfWords,
      required final dynamic frequencyRange,
      required final double numberOfSecondsPerWord,
      required final List<String> words}) = _$_Experiment;

  factory _Experiment.fromJson(Map<String, dynamic> json) =
      _$_Experiment.fromJson;

  @override
  int get experimentId;
  @override
  String get name;
  @override
  String get description;
  @override
  String get createdBy;
  @override
  int get numberOfWords;
  @override
  List<int> get lengthOfWords;
  @override
  dynamic get frequencyRange;
  @override
  double get numberOfSecondsPerWord;
  @override
  List<String> get words;
  @override
  @JsonKey(ignore: true)
  _$$_ExperimentCopyWith<_$_Experiment> get copyWith =>
      throw _privateConstructorUsedError;
}
