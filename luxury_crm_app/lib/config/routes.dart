import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../main.dart';

class AppRouter {
  static final router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const AppEntryPoint(),
      ),
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/dashboard',
        builder: (context, state) => const DashboardScreen(),
      ),
      GoRoute(
        path: '/crm',
        builder: (context, state) => const CRMScreen(),
      ),
      GoRoute(
        path: '/visits',
        builder: (context, state) => const VisitsScreen(),
      ),
      GoRoute(
        path: '/tasks',
        builder: (context, state) => const TasksScreen(),
      ),
      GoRoute(
        path: '/proposals',
        builder: (context, state) => const Placeholder(),
      ),
      GoRoute(
        path: '/events',
        builder: (context, state) => const Placeholder(),
      ),
      GoRoute(
        path: '/contracts',
        builder: (context, state) => const Placeholder(),
      ),
      GoRoute(
        path: '/financial',
        builder: (context, state) => const Placeholder(),
      ),
      GoRoute(
        path: '/haccp-iso',
        builder: (context, state) => const Placeholder(),
      ),
      GoRoute(
        path: '/customer-service',
        builder: (context, state) => const Placeholder(),
      ),
      GoRoute(
        path: '/documents',
        builder: (context, state) => const Placeholder(),
      ),
      GoRoute(
        path: '/automation',
        builder: (context, state) => const Placeholder(),
      ),
      GoRoute(
        path: '/settings',
        builder: (context, state) => const Placeholder(),
      ),
    ],
  );
}
