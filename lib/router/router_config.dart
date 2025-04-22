import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:form1/ui/home.dart';
import 'package:form1/ui/register.dart';
import 'package:form1/ui/statistic.dart';
import 'package:form1/ui/main_screen.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        name: 'register',
        path: '/',
        builder: (context, state) => const RegisterScreen(),
      ),
      GoRoute(
        name: 'main',
        path: '/main',
        builder: (context, state) => MainScreen(),
      ),
      GoRoute(
        name: 'home',
        path: '/home',
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        name: 'statistics',
        path: '/statistics',
        builder: (context, state) => const StatisticScreen(),
      ),
    ],
  );
}

