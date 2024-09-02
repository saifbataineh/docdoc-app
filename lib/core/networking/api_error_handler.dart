import 'package:dio/dio.dart';

import 'api_error_model.dart';

class ApiErrorHandler {
  static ApiErrorModel handle(dynamic error) {
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionError:
          return ApiErrorModel(message: 'connection to server failed');
        case DioExceptionType.cancel:
          return ApiErrorModel(message: "request to the server was cancelled");
        case DioExceptionType.connectionTimeout:
          return ApiErrorModel(message: "connection timeout with the server ");
        case DioExceptionType.unknown:
          return ApiErrorModel(
              message:
                  "connection to the server failed due to internet connection ");
        case DioExceptionType.receiveTimeout:
          return ApiErrorModel(
              message: "receive timeout in connection with server ");
        case DioExceptionType.badResponse:
          return _handleError(error.response?.data);
        case DioExceptionType.sendTimeout:
          return ApiErrorModel(
              message: 'send timeout in connection with the server');
        default:
          return ApiErrorModel(message: "something went wrong");
      }
    } else {
      return ApiErrorModel(message: 'unexpected error ');
    }
  }
}

ApiErrorModel _handleError(dynamic data) {
  return ApiErrorModel(
      message: data['message'] ?? 'unexpected error',
      code: data['code'],
      errors: data['data']);
}
