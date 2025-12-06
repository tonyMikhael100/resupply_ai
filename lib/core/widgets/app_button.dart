import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:resupply_ai/core/themes/app_colors.dart';
import 'package:resupply_ai/core/themes/app_text_styles.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.buttonText,
    required this.onPressed,
    this.backgroundColor = AppColors.primaryColor,
    this.textColor = AppColors.white,
    this.textStyle,
    this.borderRadius,
    this.height,
    this.width,
    this.padding,
    this.child,
  });

  final String buttonText;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color textColor;
  final TextStyle? textStyle;
  final BorderRadiusGeometry? borderRadius;
  final double? height;
  final double? width;
  final EdgeInsetsGeometry? padding;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 50.h,
      width: width ?? double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(16.r),
          ),
          padding: padding,
        ),
        child: child ??
            Text(
              buttonText,
              style: textStyle ??
                  AppTextStyles.font16WhiteBold.copyWith(color: textColor),
            ),
      ),
    );
  }
}
