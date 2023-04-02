import 'package:freezed_annotation/freezed_annotation.dart';

part 'signUp_response_model.freezed.dart';
part 'signUp_response_model.g.dart';

@freezed
class SignUpResponseModel with _$SignUpResponseModel {
  const factory SignUpResponseModel (
      {@JsonSerializable(explicitToJson: true) required String userEmail,
      required String firstName,
      required String lastName,
      required String password,
      required String age,
      required String gender,
      required String degree}) = _SignUpResponseModel ;

  factory SignUpResponseModel .fromJson(Map<String, Object?> json) =>
      _$SignUpResponseModelFromJson(json);
}
