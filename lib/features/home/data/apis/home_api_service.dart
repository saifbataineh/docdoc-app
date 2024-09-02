import 'package:dio/dio.dart';
import 'package:flutter_advanced/core/networking/api_constansts.dart';
import 'package:flutter_advanced/features/home/data/apis/home_api_constans.dart';
import 'package:flutter_advanced/features/home/data/models/specializations_response_model.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
part 'home_api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class HomeApiService {
  factory HomeApiService(Dio dio) = _HomeApiService;

  @GET(HomeApiConstans.specialaizationEP)
  
  Future<SpecializationsResponseModel> getSpecializationData();
}
