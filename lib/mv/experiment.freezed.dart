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
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  int get numberOfWords => throw _privateConstructorUsedError;
  double get numberOfSecondsPerWord => throw _privateConstructorUsedError;
  List<int> get frequencyRange => throw _privateConstructorUsedError;
  List<int> get lengthOfWords => throw _privateConstructorUsedError;

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
      {@JsonSerializable(explicitToJson: true) String name,
      String description,
      int numberOfWords,
      double numberOfSecondsPerWord,
      List<int> frequencyRange,
      List<int> lengthOfWords});
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
    Object? name = null,
    Object? description = null,
    Object? numberOfWords = null,
    Object? numberOfSecondsPerWord = null,
    Object? frequencyRange = null,
    Object? lengthOfWords = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      numberOfWords: null == numberOfWords
          ? _value.numberOfWords
          : numberOfWords // ignore: cast_nullable_to_non_nullable
              as int,
      numberOfSecondsPerWord: null == numberOfSecondsPerWord
          ? _value.numberOfSecondsPerWord
          : numberOfSecondsPerWord // ignore: cast_nullable_to_non_nullable
              as double,
      frequencyRange: null == frequencyRange
          ? _value.frequencyRange
          : frequencyRange // ignore: cast_nullable_to_non_nullable
              as List<int>,
      lengthOfWords: null == lengthOfWords
          ? _value.lengthOfWords
          : lengthOfWords // ignore: cast_nullable_to_non_nullable
              as List<int>,
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
      {@JsonSerializable(explicitToJson: true) String name,
      String description,
      int numberOfWords,
      double numberOfSecondsPerWord,
      List<int> frequencyRange,
      List<int> lengthOfWords});
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
    Object? name = null,
    Object? description = null,
    Object? numberOfWords = null,
    Object? numberOfSecondsPerWord = null,
    Object? frequencyRange = null,
    Object? lengthOfWords = null,
  }) {
    return _then(_$_NewExperiment(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      numberOfWords: null == numberOfWords
          ? _value.numberOfWords
          : numberOfWords // ignore: cast_nullable_to_non_nullable
              as int,
      numberOfSecondsPerWord: null == numberOfSecondsPerWord
          ? _value.numberOfSecondsPerWord
          : numberOfSecondsPerWord // ignore: cast_nullable_to_non_nullable
              as double,
      frequencyRange: null == frequencyRange
          ? _value._frequencyRange
          : frequencyRange // ignore: cast_nullable_to_non_nullable
              as List<int>,
      lengthOfWords: null == lengthOfWords
          ? _value._lengthOfWords
          : lengthOfWords // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_NewExperiment implements _NewExperiment {
  const _$_NewExperiment(
      {@JsonSerializable(explicitToJson: true) required this.name,
      required this.description,
      required this.numberOfWords,
      required this.numberOfSecondsPerWord,
      required final List<int> frequencyRange,
      required final List<int> lengthOfWords})
      : _frequencyRange = frequencyRange,
        _lengthOfWords = lengthOfWords;

  factory _$_NewExperiment.fromJson(Map<String, dynamic> json) =>
      _$$_NewExperimentFromJson(json);

  @override
  @JsonSerializable(explicitToJson: true)
  final String name;
  @override
  final String description;
  @override
  final int numberOfWords;
  @override
  final double numberOfSecondsPerWord;
  final List<int> _frequencyRange;
  @override
  List<int> get frequencyRange {
    if (_frequencyRange is EqualUnmodifiableListView) return _frequencyRange;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_frequencyRange);
  }

  final List<int> _lengthOfWords;
  @override
  List<int> get lengthOfWords {
    if (_lengthOfWords is EqualUnmodifiableListView) return _lengthOfWords;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_lengthOfWords);
  }

  @override
  String toString() {
    return 'NewExperiment(name: $name, description: $description, numberOfWords: $numberOfWords, numberOfSecondsPerWord: $numberOfSecondsPerWord, frequencyRange: $frequencyRange, lengthOfWords: $lengthOfWords)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NewExperiment &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.numberOfWords, numberOfWords) ||
                other.numberOfWords == numberOfWords) &&
            (identical(other.numberOfSecondsPerWord, numberOfSecondsPerWord) ||
                other.numberOfSecondsPerWord == numberOfSecondsPerWord) &&
            const DeepCollectionEquality()
                .equals(other._frequencyRange, _frequencyRange) &&
            const DeepCollectionEquality()
                .equals(other._lengthOfWords, _lengthOfWords));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      description,
      numberOfWords,
      numberOfSecondsPerWord,
      const DeepCollectionEquality().hash(_frequencyRange),
      const DeepCollectionEquality().hash(_lengthOfWords));

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
      {@JsonSerializable(explicitToJson: true) required final String name,
      required final String description,
      required final int numberOfWords,
      required final double numberOfSecondsPerWord,
      required final List<int> frequencyRange,
      required final List<int> lengthOfWords}) = _$_NewExperiment;

  factory _NewExperiment.fromJson(Map<String, dynamic> json) =
      _$_NewExperiment.fromJson;

  @override
  @JsonSerializable(explicitToJson: true)
  String get name;
  @override
  String get description;
  @override
  int get numberOfWords;
  @override
  double get numberOfSecondsPerWord;
  @override
  List<int> get frequencyRange;
  @override
  List<int> get lengthOfWords;
  @override
  @JsonKey(ignore: true)
  _$$_NewExperimentCopyWith<_$_NewExperiment> get copyWith =>
      throw _privateConstructorUsedError;
}
