import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture_app/presentation/screens/main_screen.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      name: MainScreen.routeName,
      builder: (BuildContext context, GoRouterState state) {
        return const MainScreen();
      },
      // routes: <RouteBase>[
      //   GoRoute(
      //     path: 'details',
      //     builder: (BuildContext context, GoRouterState state) {
      //       // return const DetailsScreen();
      //     },
      //   ),
      // ],
    ),
  ],
);
