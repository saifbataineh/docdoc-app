import 'package:flutter/material.dart';
import 'package:flutter_advanced/core/theming/colors.dart';

import 'package:shimmer/shimmer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorsShimmerLoading extends StatelessWidget {
  const DoctorsShimmerLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.only(bottom: 16.h),
                child: Row(
                  children: [
                    Shimmer.fromColors(
                      baseColor: ColorsManager.lightGray,
                      highlightColor: Colors.white,
                      child: Container(
                        width: 110.w,
                        height: 120.h,
                        decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(12.0),
                            color: Colors.white),
                      ),
                    )
                  ],
                ),
              );
            }));
  }
}
