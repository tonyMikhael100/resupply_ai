import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:resupply_ai/core/utils/spacing.dart';
import 'package:resupply_ai/core/widgets/app_text_field.dart';

class HomeRow extends StatelessWidget {
  const HomeRow({
    super.key,
    required this.title,
    required this.onPressed,
    required this.crightHex,
    required this.cleftHex,
    required this.buttonText,
    required this.onChanged,
  });

  final String title;
  final void Function()? onPressed;
  final String crightHex;
  final String cleftHex;
  final String buttonText;
  final Function(String)? onChanged;

  Color _hexToColor(String hex) {
    String formattedHex = hex.replaceAll('#', '');
    if (formattedHex.length == 6)
      formattedHex = 'FF$formattedHex'; // full opacity
    return Color(int.parse(formattedHex, radix: 16));
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Container(
            height: 100.h,
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            alignment: Alignment.center,
            color: _hexToColor(cleftHex),
            child: Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            height: 100.h,
            color: _hexToColor(crightHex),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                horizontalSpace(5),
                Expanded(
                  child: AppTextField(
                    hintText: '',
                    onChanged:onChanged ,
                  ),
                ),
                horizontalSpace(5),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff5E66D1),
                    padding:
                        EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
                  ),
                  onPressed: onPressed,
                  child: Text(
                    buttonText,
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.white,
                    ),
                  ),
                ),
                horizontalSpace(5),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
