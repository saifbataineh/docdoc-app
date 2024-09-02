import 'package:flutter/material.dart';
import 'package:flutter_advanced/core/helpers/spacing.dart';
import 'package:flutter_advanced/features/home/logic/cubit/home_cubit.dart';
import 'package:flutter_advanced/features/home/logic/cubit/home_state.dart';
import 'package:flutter_advanced/features/home/ui/widgets/doctors_list/doctors_list_view.dart';
import 'package:flutter_advanced/features/home/ui/widgets/doctors_list/doctors_shimmer_loading.dart';
import 'package:flutter_advanced/features/home/ui/widgets/specialization_list/speciality_list_view.dart';
import 'package:flutter_advanced/features/home/ui/widgets/specialization_list/speciality_shimmer_loading.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SpecializationsBlocBuilder extends StatelessWidget {
  const SpecializationsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) =>
          current is SpecializationLoding ||
          current is SpecializationSuccess ||
          current is SpecializationError,
      builder: (context, state) {
        return state.maybeWhen(
            specializationloading: () {
              return setupLoading();
            },
            specializationSuccess: (specializationsDataList) {
              var specializationslist = specializationsDataList;

              return setupSuccess(specializationslist);
            },
            specializationError: (errorHandler) => setupError(),
            orElse: () {
              return const SizedBox.shrink();
            });
      },
    );
  }

  Widget setupLoading() {
    return Expanded(
      child: Column(
        children: [
          const SpecialityShimmerLoading(),
          verticalSpacing(8),
          const DoctorsShimmerLoading(),
        ],
      ),
    );
    
    
  }

  Widget setupError() {
    return const SizedBox.shrink();
  }

  Widget setupSuccess(specializationslist) {
    return SpecialityListView(
        specializationDataList: specializationslist ?? []);
  }
}
