import 'package:flutter_advanced/core/helpers/extensions.dart';
import 'package:flutter_advanced/main_development.dart';
import 'package:json_annotation/json_annotation.dart';
part 'api_error_model.g.dart';

@JsonSerializable()
class ApiErrorModel {
  final String? message;
  final int? code;
  @JsonKey(name: 'data')
  final Map<String, dynamic>? errors;

  ApiErrorModel({this.message, this.code, this.errors});

  factory ApiErrorModel.fromJson(Map<String, dynamic> json) =>
      _$ApiErrorModelFromJson(json);

  Map<String, dynamic> toJson() => _$ApiErrorModelToJson(this);

  ///Returns a String containing all the error messages
  String getAllErrorMessages() {
    if (errors.isNullorEmpty()) return message ?? 'Unknown Error occured';
    final errorMessage = errors!.entries.map((entry) {
      final value = entry.value;
      return '${value.join(',')}';
    }).join('\n');
    return errorMessage;
  }
}
