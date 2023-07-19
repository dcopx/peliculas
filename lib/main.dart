import 'package:flutter/material.dart';
import 'package:peliculas/config/router/app_router.dart';
import 'package:peliculas/config/theme/app_theme.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: routes,
      theme: AppTheme().getTheme(),
    );
  }
}
