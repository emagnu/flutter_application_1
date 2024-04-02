//   ///
//  Import LIBRARIES
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:go_router/go_router.dart';
//  Import FILES
// import 'pages/home_page.dart';
import './routes/routes.dart';
//  PARTS
//  PROVIDERS
//  //  //   ///

void main() {
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Riverpod example',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      // home: const HomePage(),
      routerConfig: router,
    );
  }
}

//   ///
//  Import LIBRARIES
//  Import FILES
//  PARTS
//  PROVIDERS
//  //  //   ///