import 'package:doc_doc_app/features/auth/register_screen/data/model/register_request_body.dart';
import '../../../../../core/networking/api_error_handler.dart';
import '../../../../../core/networking/api_result.dart';
import '../../../../../core/networking/api_service.dart';
import '../../../login_screen/data/models/api_response.dart';

class RegisterRepo {
  final ApiService _apiService;

  RegisterRepo(this._apiService);
  Future<ApiResult<ApiResponse>> register(RegisterRequestBody registerRequestBody) async{
    try{
      final response = await _apiService.register(registerRequestBody);
      return ApiResult.success(response);
    }catch(error){
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}