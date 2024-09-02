import 'package:flutter_advanced/core/networking/api_error_handler.dart';
import 'package:flutter_advanced/core/networking/api_results.dart';
import 'package:flutter_advanced/features/home/data/apis/home_api_service.dart';
import 'package:flutter_advanced/features/home/data/models/specializations_response_model.dart';

class HomeRepo {
  final HomeApiService _homeApiSerivce;
  HomeRepo(this._homeApiSerivce);

  Future<ApiResult<SpecializationsResponseModel>>
      getSpecializationData() async {
    try {
      final response = await _homeApiSerivce.getSpecializationData();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
