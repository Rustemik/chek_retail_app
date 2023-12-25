import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get lightTheme {
    final base = ThemeData.light();

    return base.copyWith(
      textTheme: TextTheme(
        bodyMedium: TextStyle(fontFamily: "Sora", color: Color(0xff252849)),
        bodySmall: TextStyle(fontFamily: "Sora", color: Color(0xB5B5B5)),
      ),
      appBarTheme: AppBarTheme(
        titleTextStyle: TextStyle(
          fontFamily: "Sora",
          color: Color(0xff252849),
          fontSize: 18,
          fontWeight: FontWeight.w700,
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedLabelStyle: TextStyle(
          fontFamily: "Sora",
          fontWeight: FontWeight.w600,
          fontSize: 10,
          color: Color(0xFF60607B),
        ),
        selectedItemColor: Color(0xFF67CD00),
        unselectedItemColor: Color(0xFF60607B),
      ),
    );
  }
}
