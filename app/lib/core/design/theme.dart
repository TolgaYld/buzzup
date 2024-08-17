import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  AppTheme._();
  // Light Theme Colors
  static const Color _lightBackgroundColor = Color(0xFFFFFFFF);
  static const Color _lightPrimaryColor = Color(0xFF008080);
  static const Color _lightPrimaryVariantColor = Color(0xFFFFC800);
  static const Color _lightOnPrimaryColor = _lightPrimaryVariantColor;
  static const Color _lightTextColorPrimary = _lightPrimaryColor;
  static const Color _appBarColorLight = _lightPrimaryColor; // Teal

  // Dark Theme Colors
  static final Color _darkBackgroundColor = Colors.grey[850]!;
  static final Color _darkPrimaryColor = Colors.grey[850]!; // Dunkles Grau
  static const Color _darkPrimaryVariantColor = Colors.black;
  static const Color _darkOnPrimaryColor = Color(0xFFFFD700); // Gold
  static const Color _darkTextColorPrimary = Color(0xFFFFD700); // Gold
  static final Color _appBarColorDark = Colors.grey[850]!; // Dunkles Grau

  static const Color _iconColor = Color(0xFFFFFFFF);

  static const Color _accentColorDark = Color.fromRGBO(253, 166, 41, 1);

  static final TextStyle _lightHeadingText = GoogleFonts.dmSans(
    color: _lightTextColorPrimary,
    fontSize: 21,
    fontWeight: FontWeight.bold,
  );

  static final TextStyle _lightBodyText = GoogleFonts.dmSans(
    color: _lightTextColorPrimary,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.bold,
    fontSize: 15,
  );

  static final TextStyle _darkThemeHeadingTextStyle = _lightHeadingText.copyWith(
    color: _darkTextColorPrimary,
  );

  static final TextStyle _darkThemeBodyTextStyle = _lightBodyText.copyWith(
    color: _darkTextColorPrimary,
  );

  static final InputDecorationTheme _inputDecorationTheme = InputDecorationTheme(
    floatingLabelStyle: const TextStyle(color: _lightTextColorPrimary),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(9),
      borderSide: const BorderSide(color: _lightTextColorPrimary),
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(9),
    ),
  );

  static final ElevatedButtonThemeData _elevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: _lightOnPrimaryColor,
      foregroundColor: _lightTextColorPrimary,
      splashFactory: NoSplash.splashFactory,
    ),
  );

  static final TextButtonThemeData _textButtonTheme = TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: _lightTextColorPrimary,
      textStyle: _lightBodyText,
      splashFactory: NoSplash.splashFactory,
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
    ),
  );

  static final TextTheme _lightTextTheme = TextTheme(
    displayLarge: _lightHeadingText,
    bodyLarge: _lightBodyText,
    labelLarge: _lightBodyText,
    bodyMedium: _lightBodyText.copyWith(fontSize: 14),
    labelMedium: _lightBodyText.copyWith(fontSize: 14),
    bodySmall: _lightBodyText.copyWith(fontSize: 12),
    labelSmall: _lightBodyText.copyWith(fontSize: 12),
  );

  static final TextTheme _darkTextTheme = TextTheme(
    displayLarge: _darkThemeHeadingTextStyle,
    bodyLarge: _darkThemeBodyTextStyle,
  );

  static final ThemeData lightTheme = ThemeData(
    elevatedButtonTheme: _elevatedButtonTheme,
    textButtonTheme: _textButtonTheme,
    primaryTextTheme: _lightTextTheme,
    useMaterial3: true,
    inputDecorationTheme: _inputDecorationTheme,
    textSelectionTheme: const TextSelectionThemeData(cursorColor: _lightTextColorPrimary),
    scaffoldBackgroundColor: _lightBackgroundColor,
    appBarTheme: const AppBarTheme(
      color: _appBarColorLight,
      iconTheme: IconThemeData(color: _iconColor),
    ),
    bottomAppBarTheme: const BottomAppBarTheme(color: _appBarColorLight),
    colorScheme: const ColorScheme.light(
      surface: _lightBackgroundColor,
      outline: _lightPrimaryVariantColor,
      onSurface: _lightTextColorPrimary,
      onSecondary: _lightTextColorPrimary,
      primary: _lightPrimaryColor,
      onPrimary: _lightPrimaryVariantColor,
      secondary: _lightOnPrimaryColor,
      primaryContainer: _lightPrimaryVariantColor,
    ),
    textTheme: _lightTextTheme,
  );

  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    inputDecorationTheme: _inputDecorationTheme,
    textSelectionTheme: const TextSelectionThemeData(cursorColor: _darkTextColorPrimary),
    scaffoldBackgroundColor: _darkBackgroundColor,
    appBarTheme: AppBarTheme(
      color: _appBarColorDark,
      iconTheme: const IconThemeData(color: _iconColor),
    ),
    bottomAppBarTheme: BottomAppBarTheme(color: _appBarColorDark),
    colorScheme: ColorScheme.dark(
      primary: _darkPrimaryColor,
      secondary: _accentColorDark,
      onPrimary: _darkOnPrimaryColor,
      primaryContainer: _darkPrimaryVariantColor,
    ),
    textTheme: _darkTextTheme,
  );
}
