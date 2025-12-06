import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:resupply_ai/core/utils/my_toast.dart';
import 'package:resupply_ai/core/utils/spacing.dart';
import 'package:resupply_ai/features/home/presentation/cubits/cubit/home_cubit.dart';
import 'package:resupply_ai/features/home/presentation/widgets/home_row.dart';
import 'package:resupply_ai/features/home/presentation/widgets/home_row_without_button.dart';

class HomeScreenTitle extends StatefulWidget {
  const HomeScreenTitle({super.key, required this.data});

  final List<dynamic> data;

  @override
  State<HomeScreenTitle> createState() => _HomeScreenTitleState();
}

class _HomeScreenTitleState extends State<HomeScreenTitle> {
  /// Check if a map contains a key with a non-empty value

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: SingleChildScrollView(
            child: Column(
              children: [
                /// App Logo
                Image.asset(
                  'assets/images/app_logo.png',
                  width: double.infinity,
                  height: 150.h,
                  fit: BoxFit.contain,
                ),

                verticalSpace(20),

                /// Build Rows From Map
                for (int i = 0; i < widget.data.length; i++)
                  _buildRow(widget.data[i], context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Build each row dynamically based on the item map
  Widget _buildRow(Map<String, dynamic> item, BuildContext context) {
    final type = item["type"] ?? "";
    final title = item["title"] ?? "";
    final content = item["content"] ?? "";
    final action = item["action"] ?? "";
    final cleft = item["cleft"] ?? "000000";
    final cright = item["cright"] ?? "000000";

    // DATA row (no button)
    if (type == "DATA") {
      return HomeRowWithoutButton(
        title: title,
        value: content,
        titleHex: cleft,
        valueHex: cright,
      );
    }

    // INPUT row with button
    if (type == "INPUT" && action.isNotEmpty) {
      return HomeRow(
        title: title,
        onChanged: (value) {},
        onPressed: () {},
        cleftHex: cleft,
        crightHex: cright,
        buttonText: item["buttext"] ?? "Search",
      );
    }

    // Nothing to display
    return const SizedBox.shrink();
  }
}
