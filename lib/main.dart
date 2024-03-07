/// [File] main.dart
///
/// Main entry point into application
///
/// [Author] Chris Kneller

/// [Date] March 5, 2024

import 'package:flutter/material.dart';

import 'src/config/locator.dart';
import 'src/config/router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Locator locator = Locator();
    locator.initDependancies();

    return MaterialApp.router(
      title: 'Clean Login App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: AppRouter().router,
    );
  }
}
