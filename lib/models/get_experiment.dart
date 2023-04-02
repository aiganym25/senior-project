import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_experiment.freezed.dart';
part 'get_experiment.g.dart';

@freezed
abstract class MyCreatedExperiments with _$MyCreatedExperiments {
  const factory MyCreatedExperiments({
    required int experimentId,
    required String experimentName,
    required String description,
    required double betweenWordTime,
    required double wordTime,
    required bool isJoinable,
    required List<String> words,
    required int participantCount,
    required List<int> overallResults,
    required int experimentType,
    required UserModel creator,
  }) = _MyCreatedExperiments;

  factory MyCreatedExperiments.fromJson(Map<String, dynamic> json) =>
      _$MyCreatedExperimentsFromJson(json);
}

@freezed
abstract class UserModel with _$UserModel {
  const factory UserModel({
    required int userId,
    required String userEmail,
    required String firstName,
    required String lastName,
    required String password,
    required int age,
    required String? gender,
    required String? degree,
    required String role,
    required bool enabled,
    required List<AuthorityModel> authorities,
    required String username,
    required bool accountNonExpired,
    required bool accountNonLocked,
    required bool credentialsNonExpired,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}

@freezed
abstract class AuthorityModel with _$AuthorityModel {
  const factory AuthorityModel({
    required String authority,
  }) = _AuthorityModel;

  factory AuthorityModel.fromJson(Map<String, dynamic> json) =>
      _$AuthorityModelFromJson(json);
}