import 'package:flutter/material.dart';
import 'package:flutter_advanced/core/helpers/spacing.dart';
import 'package:flutter_advanced/features/home/logic/cubit/home_cubit.dart';
import 'package:flutter_advanced/features/home/logic/cubit/home_state.dart';
import 'package:flutter_advanced/features/home/ui/widgets/doctor_speciality_see_all.dart';
import 'package:flutter_advanced/features/home/ui/widgets/doctors_list/doctors_bloc_builder.dart';
import 'package:flutter_advanced/features/home/ui/widgets/doctors_blue_container.dart';
import 'package:flutter_advanced/features/home/ui/widgets/doctors_list/doctors_list_view.dart';
import 'package:flutter_advanced/features/home/ui/widgets/specialization_list/speciality_list_view.dart';
import 'package:flutter_advanced/features/home/ui/widgets/home_top_bar.dart';
import 'package:flutter_advanced/features/home/ui/widgets/specialization_list/specializations_bloc_builder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          margin: const EdgeInsets.fromLTRB(20, 16, 20, 28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HomeTopBar(),
              const DoctorsBlueContainer(),
              verticalSpacing(24),
              const DoctorSpecialitySeeAll(),
              verticalSpacing(18),
              const SpecializationsBlocBuilder(),
              verticalSpacing(8),
              const DoctorsBlocBuilder()
            ],
          ),
        ),
      ),
    );
  }

 
      }

