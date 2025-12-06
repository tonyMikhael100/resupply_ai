import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:resupply_ai/core/utils/my_toast.dart';
import 'package:resupply_ai/core/utils/spacing.dart';
import 'package:resupply_ai/features/home/presentation/cubits/cubit/home_cubit.dart';
import 'package:resupply_ai/features/home/presentation/widgets/home_row.dart';
import 'package:resupply_ai/features/home/presentation/widgets/home_row_without_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.userData});

  final List<dynamic> userData;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String searchValue = '';

  /// Check if a map contains a key with a non-empty value
  bool hasKey(Map<String, dynamic> map, String key) {
    return map.containsKey(key) &&
        map[key] != null &&
        map[key].toString().isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    final items = widget.userData;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: SingleChildScrollView(
            child: BlocListener<HomeCubit, HomeState>(
              listener: (context, state) {
                if (state is HomeErrorState) {
                  MyToast.error(context, 'not found');
                } else if (state is HomeLoadedState) {
                  // Navigate if map has data
                  if (state.mainDetaislList.isNotEmpty) {
                    context.push('/homeScreenDetails',
                        extra: state.mainDetaislList);
                  }
                }
              },
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
                  for (int i = 0; i < items.length; i++)
                    _buildRow(items[i], context),
                ],
              ),
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
        onChanged: (value) {
          setState(() {
            searchValue = value;
          });
        },
        onPressed: () {
          if (searchValue.isEmpty) {
            MyToast.error(context, 'Please enter search value');
            return;
          }

          context.read<HomeCubit>().getAllProducts(
                url: action,
                searchValue: searchValue,
              );
        },
        cleftHex: cleft,
        crightHex: cright,
        buttonText: item["buttext"] ?? "Search",
      );
    }

    // Nothing to display
    return const SizedBox.shrink();
  }
}
