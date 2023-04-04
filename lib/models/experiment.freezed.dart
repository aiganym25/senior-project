// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'experiment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NewExperiment _$NewExperimentFromJson(Map<String, dynamic> json) {
  return _NewExperiment.fromJson(json);
}

/// @nodoc
mixin _$NewExperiment {
  @JsonSerializable(explicitToJson: true)
  String get experimentName => throw _privateConstructorUsedError;
  List<String> get words => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  double get betweenWordTime => throw _privateConstructorUsedError;
  double get wordTime => throw _privateConstructorUsedError;
  String get isJoinable => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NewExperimentCopyWith<NewExperiment> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewExperimentCopyWith<$Res> {
  factory $NewExperimentCopyWith(
          NewExperiment value, $Res Function(NewExperiment) then) =
      _$NewExperimentCopyWithImpl<$Res, NewExperiment>;
  @useResult
  $Res call(
      {@JsonSerializable(explicitToJson: true) String experimentName,
      List<String> words,
      String description,
      double betweenWordTime,
      double wordTime,
      String isJoinable});
}

/// @nodoc
class _$NewExperimentCopyWithImpl<$Res, $Val extends NewExperiment>
    implements $NewExperimentCopyWith<$Res> {
  _$NewExperimentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? experimentName = null,
    Object? words = null,
    Object? description = null,
    Object? betweenWordTime = null,
    Object? wordTime = null,
    Object? isJoinable = null,
  }) {
    return _then(_value.copyWith(
      experimentName: null == experimentName
          ? _value.experimentName
          : experimentName // ignore: cast_nullable_to_non_nullable
              as String,
      words: null == words
          ? _value.words
          : words // ignore: cast_nullable_to_non_nullable
              as List<String>,
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
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_NewExperimentCopyWith<$Res>
    implements $NewExperimentCopyWith<$Res> {
  factory _$$_NewExperimentCopyWith(
          _$_NewExperiment value, $Res Function(_$_NewExperiment) then) =
      __$$_NewExperimentCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonSerializable(explicitToJson: true) String experimentName,
      List<String> words,
      String description,
      double betweenWordTime,
      double wordTime,
      String isJoinable});
}

/// @nodoc
class __$$_NewExperimentCopyWithImpl<$Res>
    extends _$NewExperimentCopyWithImpl<$Res, _$_NewExperiment>
    implements _$$_NewExperimentCopyWith<$Res> {
  __$$_NewExperimentCopyWithImpl(
      _$_NewExperiment _value, $Res Function(_$_NewExperiment) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? experimentName = null,
    Object? words = null,
    Object? description = null,
    Object? betweenWordTime = null,
    Object? wordTime = null,
    Object? isJoinable = null,
  }) {
    return _then(_$_NewExperiment(
      experimentName: null == experimentName
          ? _value.experimentName
          : experimentName // ignore: cast_nullable_to_non_nullable
              as String,
      words: null == words
          ? _value._words
          : words // ignore: cast_nullable_to_non_nullable
              as List<String>,
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
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_NewExperiment implements _NewExperiment {
  const _$_NewExperiment(
      {@JsonSerializable(explicitToJson: true) required this.experimentName,
      required final List<String> words,
      required this.description,
      required this.betweenWordTime,
      required this.wordTime,
      required this.isJoinable})
      : _words = words;

  factory _$_NewExperiment.fromJson(Map<String, dynamic> json) =>
      _$$_NewExperimentFromJson(json);

  @override
  @JsonSerializable(explicitToJson: true)
  final String experimentName;
  final List<String> _words;
  @override
  List<String> get words {
    if (_words is EqualUnmodifiableListView) return _words;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_words);
  }

  @override
  final String description;
  @override
  final double betweenWordTime;
  @override
  final double wordTime;
  @override
  final String isJoinable;

  @override
  String toString() {
    return 'NewExperiment(experimentName: $experimentName, words: $words, description: $description, betweenWordTime: $betweenWordTime, wordTime: $wordTime, isJoinable: $isJoinable)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NewExperiment &&
            (identical(other.experimentName, experimentName) ||
                other.experimentName == experimentName) &&
            const DeepCollectionEquality().equals(other._words, _words) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.betweenWordTime, betweenWordTime) ||
                other.betweenWordTime == betweenWordTime) &&
            (identical(other.wordTime, wordTime) ||
                other.wordTime == wordTime) &&
            (identical(other.isJoinable, isJoinable) ||
                other.isJoinable == isJoinable));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      experimentName,
      const DeepCollectionEquality().hash(_words),
      description,
      betweenWordTime,
      wordTime,
      isJoinable);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NewExperimentCopyWith<_$_NewExperiment> get copyWith =>
      __$$_NewExperimentCopyWithImpl<_$_NewExperiment>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NewExperimentToJson(
      this,
    );
  }
}

abstract class _NewExperiment implements NewExperiment {
  const factory _NewExperiment(
      {@JsonSerializable(explicitToJson: true)
          required final String experimentName,
      required final List<String> words,
      required final String description,
      required final double betweenWordTime,
      required final double wordTime,
      required final String isJoinable}) = _$_NewExperiment;

  factory _NewExperiment.fromJson(Map<String, dynamic> json) =
      _$_NewExperiment.fromJson;

  @override
  @JsonSerializable(explicitToJson: true)
  String get experimentName;
  @override
  List<String> get words;
  @override
  String get description;
  @override
  double get betweenWordTime;
  @override
  double get wordTime;
  @override
  String get isJoinable;
  @override
  @JsonKey(ignore: true)
  _$$_NewExperimentCopyWith<_$_NewExperiment> get copyWith =>
      throw _privateConstructorUsedError;
}
