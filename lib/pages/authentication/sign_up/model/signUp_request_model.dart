import 'package:freezed_annotation/freezed_annotation.dart';

part 'signUp_request_model.freezed.dart';
part 'signUp_request_model.g.dart';

@freezed
class SignUpRequestModel with _$SignUpRequestModel{
  const factory SignUpRequestModel(
      {@JsonSerializable(explicitToJson: true) required String userEmail,
      required String firstName,
      required String lastName,
      required String password,
      required String age,
      required String gender,
      required String degree}) = _SignUpRequestModel;

  factory SignUpRequestModel.fromJson(Map<String, Object?> json) =>
      _$SignUpRequestModelFromJson(json);
}
