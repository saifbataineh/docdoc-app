import 'package:flutter/foundation.dart';
import 'package:flutter_advanced/core/networking/api_error_handler.dart';
import 'package:flutter_advanced/core/networking/api_error_model.dart';
import 'package:flutter_advanced/features/home/data/models/specializations_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial() = _Initial;

  //specializations
  const factory HomeState.specializationloading() = SpecializationLoding;
  const factory HomeState.specializationSuccess(
      List<SpecializationsData?>? specializationsData) = SpecializationSuccess;
  const factory HomeState.specializationError(ApiErrorModel apiErrorModel) =
      SpecializationError;

  //Doctors
 
  const factory HomeState.doctorsSuccess(List<Doctors?>? doctorsList) =
      DoctorsSuccess;
  const factory HomeState.doctorsError() =
      DoctorsError;
}
