import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppCard extends StatelessWidget {
  const AppCard({
    super.key,
    this.image,
    required this.child,
    this.width,
    this.height,
  });
  final String? image;
  final Widget child;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.h),
      width: width ?? double.infinity,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        image: DecorationImage(
          image: AssetImage(
            image ?? 'assets/images/main_card_bg.png',
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: child,
    );
  }
}
