import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:resupply_ai/core/routing/app_router.dart';
import 'package:resupply_ai/core/themes/app_colors.dart';
import 'package:resupply_ai/features/login/data/models/login_response_model.dart';
import 'package:resupply_ai/features/login/presentation/cubits/cubit/login_cubit.dart';
import 'package:resupply_ai/features/login/presentation/pages/login_screen.dart';
import 'package:toastification/toastification.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  // Register Hive adapters
  Hive.registerAdapter(LoginResponseModelAdapter());
  Hive.registerAdapter(LoginItemAdapter());
  await Hive.openBox('cageCodeBox');

  // Optional: open a box now
  await Hive.openBox<LoginResponseModel>('userBox');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: ToastificationWrapper(
        child: MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => LoginCubit()),
          ],
          child: MaterialApp.router(
            routerConfig: AppRouter.router,
            debugShowCheckedModeBanner: false,
            useInheritedMediaQuery: true,
            theme: ThemeData(
              drawerTheme: DrawerThemeData(
                backgroundColor: AppColors.white,
              ),
              appBarTheme: AppBarTheme(
                elevation: 0,
                surfaceTintColor: Colors.grey.shade100,
                backgroundColor: Colors.grey.shade100,
              ),
              scaffoldBackgroundColor: Colors.grey.shade300,
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                backgroundColor: Colors.grey.shade100,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
