import 'package:dio/dio.dart' hide Headers;
import '../../features/auth/login_screen/data/models/login_request_body.dart';
import '../../features/auth/login_screen/data/models/login_response.dart';
import '../../features/auth/register_screen/data/model/register_request_body.dart';
import 'api_constant.dart';
import 'package:retrofit/retrofit.dart';
part 'api_service.g.dart';
@RestApi(baseUrl: ApiConstant.apiBaseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST(ApiConstant.login)
  @FormUrlEncoded()
  Future<LoginResponse> login(
      @Body() LoginRequestBody loginRequestBody,
      );
  @POST(ApiConstant.register)
  @FormUrlEncoded()
  Future<LoginResponse> register(
      @Body() RegisterRequestBody registerRequestBody,
      );
}


