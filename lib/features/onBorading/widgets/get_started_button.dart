import 'package:flutter/material.dart';
import 'package:flutter_advanced/core/helpers/extensions.dart';
import 'package:flutter_advanced/core/routing/routes.dart';
import 'package:flutter_advanced/core/theming/colors.dart';
import 'package:flutter_advanced/core/theming/styles.dart';

class GetStartedButton extends StatelessWidget {
  const GetStartedButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: ButtonStyle(
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            minimumSize:
                const WidgetStatePropertyAll(Size(double.infinity, 52)),
            backgroundColor:
                const WidgetStatePropertyAll(ColorsManager.mainBlue),
            shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)))),
        onPressed: () {
          context.pushNamed(Routes.loginScreen);   
        },
        child: Text(
          'Get Started',
          style: TextStyles.font16whiteMedium,
        ));
  }
}
