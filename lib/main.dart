import 'package:flutter/material.dart';
import 'menu_yoneticisi.dart';

void main() {
  runApp(const SofrasofraApp());
}

class SofrasofraApp extends StatelessWidget {
  const SofrasofraApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sofrasofra',
      theme: ThemeData(
          brightness: Brightness.dark, primaryColor: const Color(0xFFFFB300)),
      home: const MenuYoneticisi(),
    );
  }
}
