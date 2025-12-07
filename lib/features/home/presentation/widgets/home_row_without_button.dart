import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeRowWithoutButton extends StatelessWidget {
  const HomeRowWithoutButton({
    super.key,
    required this.title,
    required this.value,
    required this.titleHex,
    required this.valueHex,
  });

  final String title;
  final String value;
  final String titleHex; // color from API for title background
  final String valueHex; // color from API for value background

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
          child: Container(
            height: 50.h,
            color: _hexToColor(titleHex),
            padding: EdgeInsets.all(20),
            child: Text(
              title,
              style: TextStyle(
                fontSize: 12.sp,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Expanded(
          child: Container(
            height: 50.h,
            color: _hexToColor(valueHex),
            padding: EdgeInsets.all(20),
            child: Text(
              value,
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
