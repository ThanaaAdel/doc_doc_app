import '../../../../../core/networking/api_error_handler.dart';
import '../../../../../core/networking/api_result.dart';
import '../../../../../core/networking/api_service.dart';
import '../models/login_request_body.dart';
import '../models/api_response.dart';

class LoginRepo {
  final ApiService _apiService;

  LoginRepo(this._apiService);
  Future<ApiResult<ApiResponse>> login(LoginRequestBody loginRequestBody) async{
    try{
  final response = await _apiService.login(loginRequestBody);
  return ApiResult.success(response);
    }catch(error){
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
  Future<Object?> logout() async{
    try{
      final response = await _apiService.logout();
      return response;
    }catch(error){
      return  ApiResponse().message ;
    }
  }

}
