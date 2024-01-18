import 'package:json_annotation/json_annotation.dart';

part 'api_response.g.dart';
@JsonSerializable()
class ApiResponse {
  String? message;
  @JsonKey(name: 'data')
  UserData? userData;
  bool? status;
  int? code;

  ApiResponse({this.message, this.userData, this.status, this.code});
 factory ApiResponse.fromJson(Map<String , dynamic> json) =>
     _$ApiResponseFromJson(json);



}
@JsonSerializable()
class UserData {
  String? token;
  @JsonKey(name: 'username')
  String? userName;

  UserData({this.token, this.userName});
  factory UserData.fromJson(Map<String , dynamic> json) =>
      _$UserDataFromJson(json);


}