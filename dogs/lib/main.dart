import 'package:dogs/e_commerce_screen_before.dart';
import 'package:dogs/flex_screen.dart';
import 'package:dogs/profile_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green,
        brightness: Brightness.light,
        appBarTheme: AppBarTheme(
          elevation: 10,
          titleTextStyle: const TextTheme(
            titleLarge: TextStyle(fontFamily: 'LeckerliOne', fontSize: 24),
          ).titleLarge,
        ),
      ),
      home: ECommerceScreen(),
    );
  }
}
