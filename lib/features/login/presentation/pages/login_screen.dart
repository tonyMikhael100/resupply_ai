import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:resupply_ai/core/themes/app_colors.dart';
import 'package:resupply_ai/core/utils/my_toast.dart';
import 'package:resupply_ai/core/utils/spacing.dart';
import 'package:resupply_ai/core/widgets/app_button.dart';
import 'package:resupply_ai/core/widgets/app_text_form_field.dart';
import 'package:resupply_ai/features/login/presentation/cubits/cubit/login_cubit.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _cageCodeController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Image.asset(
                  'assets/images/app_logo.png',
                  width: double.infinity,
                  height: 200.h,
                ),
                AppTextFormField(
                  labelText: 'Cage code',
                  hintText: 'Enter your cage code',
                  controller: _cageCodeController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your cage code';
                    }
                    return null;
                  },
                ),
                verticalSpace(20),
                AppTextFormField(
                  labelText: 'Password',
                  hintText: 'Enter your password',
                  controller: _passwordController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                ),
                verticalSpace(20),
                BlocConsumer<LoginCubit, LoginState>(
                  buildWhen: (previous, current) =>
                      current is LoginLoading ||
                      current is LoginSuccess ||
                      current is LoginFailure,
                  listener: (context, state) {
                    if (state is LoginSuccess) {
                      MyToast.success(context, 'Login successful');
                      context.push('/homeScreen',
                          extra: state.loginResponseMap);
                    } else if (state is LoginFailure) {
                      MyToast.error(context, state.errMessage);
                    }
                  },
                  builder: (context, state) {
                    if (state is LoginLoading) {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: AppColors.primaryColor,
                        ),
                      );
                    }
                    return AppButton(
                      buttonText: 'Login',
                      backgroundColor: AppColors.primaryColor,
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          context.read<LoginCubit>().login(
                                cageCode: _cageCodeController.text,
                                password: _passwordController.text,
                              );
                        }
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
