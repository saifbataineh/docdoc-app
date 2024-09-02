import 'package:flutter_advanced/core/helpers/extensions.dart';
import 'package:flutter_advanced/core/networking/api_error_handler.dart';
import 'package:flutter_advanced/features/home/data/models/specializations_response_model.dart';
import 'package:flutter_advanced/features/home/data/repos/home_repo.dart';
import 'package:flutter_advanced/main_development.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo _homeRepo;
  HomeCubit(this._homeRepo) : super(const HomeState.initial());

  List<SpecializationsData?>? specializationsList = [];

  void getSpecialization() async {
    emit(const HomeState.specializationloading());
    final response = await _homeRepo.getSpecializationData();
    response.when(success: (specializationsResponseModel) {
      specializationsList =
          specializationsResponseModel.specializationDataList ?? [];
      getDoctorsList(specializationsId: specializationsList?.first?.id);
      emit(HomeState.specializationSuccess(specializationsList));
    }, failure: (apiErrorModel) {
      emit(HomeState.specializationError(apiErrorModel));
    });
  }

  void getDoctorsList({required int? specializationsId}) {
    List<Doctors?>? doctorsList =
        getDoctorsListBySpecializationId(specializationsId);
    if (!doctorsList.isNullorEmpty()) {
      emit(HomeState.doctorsSuccess(doctorsList));
    } else {
      emit(HomeState.doctorsError());
    }
  }

  /// returns the list of doctors based on the specialization id
  getDoctorsListBySpecializationId(specializationId) {
    return specializationsList
        ?.firstWhere((specialization) => specialization?.id == specializationId)
        ?.doctorsList;
  }
}
