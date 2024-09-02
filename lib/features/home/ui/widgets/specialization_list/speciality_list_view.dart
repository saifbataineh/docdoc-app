import 'package:flutter/material.dart';
import 'package:flutter_advanced/core/routing/app_router.dart';

import 'package:flutter_advanced/features/home/data/models/specializations_response_model.dart';
import 'package:flutter_advanced/features/home/logic/cubit/home_cubit.dart';
import 'package:flutter_advanced/features/home/ui/widgets/specialization_list/speciality_list_view_item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SpecialityListView extends StatefulWidget {
  final List<SpecializationsData?> specializationDataList;
  const SpecialityListView(
      {super.key, required this.specializationDataList});

  @override
  State<SpecialityListView> createState() =>
      _DoctorsSpecialityListViewState();
}

class _DoctorsSpecialityListViewState extends State<SpecialityListView> {
  var selectedSpecailizationIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: widget.specializationDataList.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedSpecailizationIndex = index;
                });
                context.read<HomeCubit>().getDoctorsList(
                    specializationsId:
                        widget.specializationDataList[index]?.id);
              },
              child: SpecialityListViewItem(
                itemIndex: index,
                
                specializationsData: widget.specializationDataList[index],
                selectedIndex:selectedSpecailizationIndex
              ),
            );
          }),
    );
  }
}
