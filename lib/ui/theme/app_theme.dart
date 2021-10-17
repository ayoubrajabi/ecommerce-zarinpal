import 'package:flutter/material.dart';

class AppTheme {
  ThemeData? theme() {
    return ThemeData(
      scaffoldBackgroundColor: Colors.white,
      fontFamily: 'Shabnam',
      primaryColor: const Color(0xff0b1023),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Color(0xff0b1023),
        selectedItemColor: Colors.white,
        unselectedItemColor: Color(0xff6f7784),
        elevation: 10.0,
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ),
    );
  }
}
