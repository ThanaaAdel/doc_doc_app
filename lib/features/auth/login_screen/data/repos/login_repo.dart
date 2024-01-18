import 'package:doc_doc_app/core/networking/api_error_handler.dart';
import 'package:doc_doc_app/core/networking/api_result.dart';
import 'package:doc_doc_app/core/networking/api_service.dart';
import 'package:doc_doc_app/features/login_screen/data/models/login_request_body.dart';
import 'package:doc_doc_app/features/login_screen/data/models/login_response.dart';

class LoginRepo {
  final ApiService _apiService;

  LoginRepo(this._apiService);
  Future<ApiResult<LoginResponse>> login(LoginRequestBody loginRequestBody) async{
    try{
  final response = await _apiService.login(loginRequestBody);
  return ApiResult.success(response);
    }catch(error){
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

}
// import 'package:doc_doc_app/core/networking/api_error_handler.dart';
// import 'package:doc_doc_app/core/networking/api_result.dart';
// import 'package:doc_doc_app/core/networking/api_service.dart';
// import 'package:doc_doc_app/features/login_screen/data/models/login_request_body.dart';
// import 'package:doc_doc_app/features/login_screen/data/models/login_response.dart';
//
// class LoginRepo {
//   final ApiService _apiService;
//
//   LoginRepo(this._apiService);
//   Future<ApiResult<LoginResponse>> login(String email , String password) async{
//     try{
//       final response = await _apiService.login(email,password);
//       return ApiResult.success(response);
//     }catch(error){
//       return ApiResult.failure(ErrorHandler.handle(error));
//     }
//   }
//
// }
