import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:resupply_ai/features/home/presentation/pages/home_screen.dart';
import 'package:resupply_ai/features/login/data/models/login_response_model.dart';
import 'package:resupply_ai/features/login/presentation/pages/login_screen.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/',
    redirect: (context, state) {
      final box = Hive.box<LoginResponseModel>('userBox');
      if (box.isEmpty) {
        return '/';
      } else {
        return '/homeScreen';
      }
    },
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => LoginScreen(),
      ),
      GoRoute(
        path: '/homeScreen',
        builder: (context, state) => HomeScreen(),
      ),
    ],
    errorBuilder: (context, state) =>
        Scaffold(body: Center(child: Text('Page not found: ${state.uri}'))),
  );
}
