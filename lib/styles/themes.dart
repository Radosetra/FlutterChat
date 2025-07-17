import 'package:flutter/material.dart';
import 'package:my_chat/styles/colors.dart';

ThemeData get lightTheme {
  return ThemeData(
    brightness: Brightness.light,
    primaryColor: MyChatColors.primary,
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: MyChatColors.primary,
      secondary: MyChatColors.secondary,
      surface: MyChatColors.white,
      error: MyChatColors.red,
    ),
    scaffoldBackgroundColor: MyChatColors.white,
    appBarTheme: const AppBarTheme(
      backgroundColor: MyChatColors.primary,
      // foregroundColor: MyChatColors.secondary,
    ),
    fontFamily: 'Roboto',
    textTheme: const TextTheme(
      bodyLarge: TextStyle(
        color: MyChatColors.black,
        fontSize: 16.0,
        fontWeight: FontWeight.w400,
      ),
      bodyMedium: TextStyle(
        color: MyChatColors.black,
        fontSize: 14.0,
      ),
      bodySmall: TextStyle(
        color: MyChatColors.black,
        fontSize: 12.0,
      ),
    ),
  );
}