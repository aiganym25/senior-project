import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_response_model.freezed.dart';
part 'login_response_model.g.dart';

@freezed
class LoginResponseModel with _$LoginResponseModel {
  const factory LoginResponseModel({
    @JsonSerializable(explicitToJson: true)
    required String token,
  }) = _LoginResponseModel;

  factory LoginResponseModel.fromJson(Map<String, Object?> json)
      => _$LoginResponseModelFromJson(json);
}