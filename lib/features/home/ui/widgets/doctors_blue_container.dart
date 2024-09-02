import 'package:flutter/material.dart';
import 'package:flutter_advanced/core/helpers/spacing.dart';
import 'package:flutter_advanced/core/theming/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorsBlueContainer extends StatelessWidget {
  const DoctorsBlueContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 195.h,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            width: double.infinity,
            height: 165.h,
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/home_blue_pattern.png"),
                  fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(24.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Book and\nschedule with\nnearest doctor",
                  style: TextStyles.font18whiteMedium,
                  textAlign: TextAlign.start,
                ),
                verticalSpacing(16),
                Expanded(
                  child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(48.0))),
                      child: Text(
                        'Find Nearby',
                        style: TextStyles.font12BlueRegular,
                      )),
                )
              ],
            ),
          ),
          Positioned(
              right: 16.w,
              top: 0,
              child: Image.asset('assets/images/home_doctor.png'))
        ],
      ),
    );
  }
}
