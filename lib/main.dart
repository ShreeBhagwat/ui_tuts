import 'package:flutter/material.dart';
import 'package:ui_tuts/home_screen.dart';
import 'package:ui_tuts/login_bottom.dart';
import 'package:ui_tuts/login_screen.dart';

void main() {
  runApp(UiTuts());
}

class UiTuts extends StatelessWidget {
  const UiTuts({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginBottom(),
    );
  }
}
