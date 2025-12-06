import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:resupply_ai/core/themes/app_colors.dart';

class AppTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final String? labelText;
  final TextInputType? keyboardType;
  final bool obscureText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final void Function(String)? onFieldSubmitted;

  const AppTextFormField({
    super.key,
    this.controller,
    this.hintText,
    this.labelText,
    this.keyboardType,
    this.obscureText = false,
    this.prefixIcon,
    this.suffixIcon,
    this.validator,
    this.onChanged,
    this.onFieldSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: TextFormField(
        onTapOutside: (event) {
          FocusScope.of(context).unfocus();
        },
        controller: controller,
        keyboardType: keyboardType,
        obscureText: obscureText,
        validator: validator,
        onChanged: onChanged,
        onFieldSubmitted: onFieldSubmitted,
        style: TextStyle(fontSize: 14.sp, color: Colors.black),
        decoration: InputDecoration(
          contentPadding:
              EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
          hintText: hintText,
          labelText: labelText,
          hintStyle: TextStyle(color: Colors.grey, fontSize: 13.sp),
          labelStyle: TextStyle(color: Colors.grey[700], fontSize: 13.sp),
          filled: true,
          fillColor: Colors.grey[100],
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.r),
            borderSide: BorderSide(color: Colors.grey.shade300),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.r),
            borderSide: BorderSide(color: AppColors.primaryColor, width: 1.5),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.r),
            borderSide: const BorderSide(color: Colors.red),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.r),
            borderSide: const BorderSide(color: Colors.red, width: 1.5),
          ),
        ),
      ),
    );
  }
}
