import 'package:flutter/material.dart';
import 'package:flutter_advanced/core/theming/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextButton extends StatelessWidget {
  const AppTextButton(
      {super.key,
      this.borderRadius,
      this.backGroundColor,
      this.horizontalPadding,
      this.verticalPadding,
      this.buttonWidth,
      required this.buttonText,
      required this.textStyle,
      required this.onPressed,
      this.buttonHeight});
  final double? borderRadius;
  final Color? backGroundColor;
  final double? horizontalPadding;
  final double? verticalPadding;
  final double? buttonWidth;
  final double? buttonHeight;
  final String buttonText;
  final TextStyle textStyle;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: ButtonStyle(
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 16.0),
            ),
          ),
          backgroundColor: WidgetStatePropertyAll(
              backGroundColor ?? ColorsManager.mainBlue),
          padding: WidgetStateProperty.all<EdgeInsets>(
            EdgeInsets.symmetric(
              vertical: verticalPadding?.h ?? 14.h,
              horizontal: horizontalPadding?.w ?? 12.w,
            ),
          ),
          fixedSize: WidgetStateProperty.all(Size(
              buttonWidth?.w ?? double.maxFinite, buttonHeight?.h ?? 50.h)),
        ),
        onPressed: onPressed,
        child: Text(
          buttonText,
          style: textStyle,
        ));
  }
}
