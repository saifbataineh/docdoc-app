import 'package:flutter/material.dart';
import 'package:flutter_advanced/core/networking/api_error_handler.dart';
import 'package:flutter_advanced/features/home/logic/cubit/home_cubit.dart';
import 'package:flutter_advanced/features/home/logic/cubit/home_state.dart';
import 'package:flutter_advanced/features/home/ui/widgets/doctors_list/doctors_list_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DoctorsBlocBuilder extends StatelessWidget {
  const DoctorsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
        buildWhen: (previous, current) =>
            current is DoctorsSuccess || current is DoctorsError,
        builder: (context, state) {
          return state.maybeWhen(
              doctorsSuccess: (doctorsList) {
                return setUpSuccess(doctorsList);
              },
              doctorsError: () => setUpError(),
              orElse: () {
                return const SizedBox.shrink();
              });
        });
  }

  Widget setUpSuccess(doctorsList) {
    return DoctorsListView(
      doctorsList: doctorsList,
    );
  }

  Widget setUpError() {
    return const SizedBox.shrink();
  }
}
