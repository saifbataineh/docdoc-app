import 'package:dio/dio.dart';
import 'package:flutter_advanced/core/networking/api_constansts.dart';
import 'package:flutter_advanced/features/login/data/models/logic_request_body.dart';
import 'package:flutter_advanced/features/login/data/models/login_response.dart';
import 'package:flutter_advanced/features/signUp/data/models/sign_up_request_body.dart';
import 'package:flutter_advanced/features/signUp/data/models/sign_up_response.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST(ApiConstants.login)
  Future<LoginResponse> login(
    @Body() LoginRequestBody loginRequestBody,
  );
  @POST(ApiConstants.signup)
  Future<SignUpResponse> signUp(
    @Body() SignUpRequestBody signupRequestBody,
  );
}
