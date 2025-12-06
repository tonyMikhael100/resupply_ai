import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:resupply_ai/core/utils/spacing.dart';
import 'package:resupply_ai/features/login/data/models/login_response_model.dart';
import 'package:resupply_ai/core/widgets/app_text_field.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final userData = Hive.box<LoginResponseModel>('userBox').get('user');
  final cageCode = Hive.box('cageCodeBox').get('cageCode');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            children: [
              Image.asset(
                'assets/images/app_logo.png',
                width: double.infinity,
                height: 150.h,
                fit: BoxFit.contain,
              ),
              SizedBox(height: 16.h),
              Expanded(
                child: Row(
                  children: [
                    // LEFT BLUE PANEL -------------------------------------
                    Expanded(
                      child: Container(
                        color: const Color(0xff0B55A1),
                        padding: EdgeInsets.only(left: 16.w, top: 20.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start, // FIXED
                          children: [
                            _leftLabel("SUPPLIER NAME"),
                            SizedBox(height: 20.h),
                            _leftLabel("CAGE CODE"),
                            SizedBox(height: 20.h),
                            _leftLabel("Enter NSN / Part No"),
                            SizedBox(height: 20.h),
                            _leftLabel("ENTER MANUFACTURER"),
                            SizedBox(height: 20.h),
                            _leftLabel("ENTER DESCRIPTION"),
                            SizedBox(height: 20.h),
                            _leftLabel("BIBLE SEARCH"),
                          ],
                        ),
                      ),
                    ),

                    // RIGHT GRAY PANEL ------------------------------------
                    Expanded(
                      flex: 2,
                      child: Container(
                        color: const Color(0xffD9D9D9),
                        padding:
                            EdgeInsets.only(left: 20.w, top: 20.h, right: 10.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment:
                              MainAxisAlignment.spaceBetween, // FIXED
                          children: [
                            // Supplier Name
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                userData?.supname ?? "N/A",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),

                            SizedBox(height: 20.h),
                            // Cage Code
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                cageCode ?? "N/A",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),

                            _rowField(buttonText: "Get List"),
                            SizedBox(height: 20.h),

                            _rowField(buttonText: "Search"),
                            SizedBox(height: 20.h),

                            _rowField(buttonText: "Get List"),
                            SizedBox(height: 20.h),

                            _rowField(buttonText: "Search"),
                            verticalSpace(20)
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _leftLabel(String text) {
    return SizedBox(
      width: double.infinity,
      child: Text(
        text,
        textAlign: TextAlign.left,
        style: TextStyle(
          color: Colors.white,
          fontSize: 18.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  /// Field + Button Row
  Widget _rowField({required String buttonText}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // LEFT — FIELD aligned left
        Expanded(
          child: Align(
            alignment: Alignment.centerLeft,
            child: SizedBox(
              height: 40.h,
              child: AppTextField(
                hintText: "",
              ),
            ),
          ),
        ),

        SizedBox(width: 10.w),

        // RIGHT — BUTTON
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xff5E66D1),
            padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
          ),
          child: Text(
            buttonText,
            style: TextStyle(
              fontSize: 14.sp,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
