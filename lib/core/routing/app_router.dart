import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:resupply_ai/features/home/presentation/pages/home_screen.dart';
import 'package:resupply_ai/features/home/presentation/pages/home_screen_details.dart';
import 'package:resupply_ai/features/home/presentation/pages/home_screen_title.dart';
import 'package:resupply_ai/features/login/presentation/pages/login_screen.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => LoginScreen(),
      ),
      GoRoute(
        path: '/homeScreen',
        builder: (context, state) {
          final userDataList = state.extra as List<dynamic>;
          return HomeScreen(userData: userDataList);
        },
      ),
      GoRoute(
        path: '/homeScreenDetails',
        builder: (context, state) {
          final mainDetailsList = state.extra as List;
          return HomeScreenDetails(data: mainDetailsList);
        },
      ),
      GoRoute(
        path: '/homeScreenTitle',
        builder: (context, state) {
          final pageData = state.extra as List;
          return HomeScreenTitle(
            data: pageData,
          );
        },
      ),
    ],
    errorBuilder: (context, state) =>
        Scaffold(body: Center(child: Text('Page not found: ${state.uri}'))),
  );
}
