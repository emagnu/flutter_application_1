//   ///
//  Import LIBRARIES
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
//  Import FILES
import '../pages/form_page.dart';
import '../pages/main_page.dart';
//  PARTS
//  PROVIDERS
//  //  //   ///

final router = GoRouter(
  routes: [
    GoRoute(
        name: 'home',
        path: '/',
        pageBuilder: (context, state) {
          return CustomTransitionPage<void>(
            key: state.pageKey,
            child: const MainPage(),
            barrierDismissible: true,
            barrierColor: Colors.black38,
            opaque: false,
            transitionDuration: Duration.zero,
            transitionsBuilder: (_, __, ___, Widget child) => child,
          );
        },
        routes: const []),
    GoRoute(
        name: 'form',
        path: '/form',
        pageBuilder: (context, state) {
          return CustomTransitionPage<void>(
            key: state.pageKey,
            child: const FormPage(),
            barrierDismissible: true,
            barrierColor: Colors.black38,
            opaque: false,
            transitionDuration: Duration.zero,
            transitionsBuilder: (_, __, ___, Widget child) => child,
          );
        },
        routes: const []),
  ],
);
