import 'package:flutter/material.dart';

import 'package:flutter_advanced/core/theming/styles.dart';
import 'package:flutter_svg/svg.dart';

class DoctorImageAndText extends StatelessWidget {
  const DoctorImageAndText({super.key});

  @override 
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SvgPicture.asset('assets/images/docdoc_logo_low_opacity.svg',),
        Container(
          foregroundDecoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.white, Colors.white.withOpacity(0.0)],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  stops: const [0.14, 0.4])),
          child: Image.asset("assets/images/onBoarding_doctor.png"),
        ),
        Positioned(
            bottom: 30,
            left: 0,
            right: 0,
            child: Text(
              'Best Doctor \nappointment App',
              textAlign: TextAlign.center,
              style: TextStyles.font32BlueBold.copyWith(
                height: 1.4,
              ),
            ))
      ],
    );
  }
}
