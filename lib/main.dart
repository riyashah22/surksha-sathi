import 'package:flutter/material.dart';
import 'package:suraksha_sathi/nav_bar.dart';
import 'package:suraksha_sathi/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final theme = AppTheme();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: theme.light,
      home: CustomNavBar(),
    );
  }
}
