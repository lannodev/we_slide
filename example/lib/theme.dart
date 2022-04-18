import 'package:flutter/material.dart';
//import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const _lightFillColor = Colors.black;
  static const _darkFillColor = Colors.white;

  static final Color _lightFocusColor = _lightFillColor.withOpacity(0.12);
  static final Color _darkFocusColor = Colors.white.withOpacity(0.12);

  // static const _regular = FontWeight.w400;
  // static const _medium = FontWeight.w500;
  // static const _semiBold = FontWeight.w600;
  static const _bold = FontWeight.bold;
  static const _normal = FontWeight.normal;

  static ThemeData lightThemeData =
      themeData(lightColorScheme, _lightFocusColor);
  static ThemeData darkThemeData = themeData(darkColorScheme, _darkFocusColor);
  static ThemeData blueDarkThemeData =
      themeData(blueDarkColorScheme, _darkFocusColor);

  static ThemeData themeData(ColorScheme colorScheme, Color focusColor) {
    return ThemeData(
      colorScheme: colorScheme,
      textTheme: _textTheme,
      // Matches manifest.json colors and background color.
      primaryColor: _lightFillColor,
      backgroundColor: colorScheme.background,
      // appBarTheme: AppBarTheme(
      //   textTheme: _textTheme.apply(bodyColor: colorScheme.onPrimary),
      //   color: colorScheme.background,
      //   elevation: 0,
      //   iconTheme: IconThemeData(color: colorScheme.primary),
      //   brightness: colorScheme.brightness,
      // ),
      iconTheme: IconThemeData(color: colorScheme.onPrimary),
      canvasColor: colorScheme.background,
      scaffoldBackgroundColor: colorScheme.background,
      highlightColor: Colors.transparent,
      focusColor: focusColor,
      // snackBarTheme: SnackBarThemeData(
      //   behavior: SnackBarBehavior.floating,
      //   backgroundColor: Color.alphaBlend(
      //     _lightFillColor.withOpacity(0.80),
      //     _darkFillColor,
      //   ),
      //   contentTextStyle: _textTheme.subtitle1.apply(color: _darkFillColor),
      // ),
    );
  }

  // Light Colors Scheme
  static const ColorScheme lightColorScheme = ColorScheme(
    primary: Color(0xFF57D780),
    secondary: Color(0xFFff5678),
    background: Color(0xFFFAFBFB),
    surface: Colors.white,
    onBackground: Color(0xFFE5E9F1),
    error: _lightFillColor,
    onError: _lightFillColor,
    onPrimary: _lightFillColor,
    onSecondary: _lightFillColor,
    onSurface: _lightFillColor,
    brightness: Brightness.light,
  );

  // Blue dark Colors Scheme
  static const ColorScheme blueDarkColorScheme = ColorScheme(
    primary: Color(0xFF57D780),
    secondary: Color(0xFFff5678),
    background: Color(0xFF0B1220),
    surface: Color(0xFF111727),
    onBackground: Color(0xFF141b2d),
    error: _darkFillColor,
    onError: _darkFillColor,
    onPrimary: _darkFillColor,
    onSecondary: _darkFillColor,
    onSurface: _darkFillColor,
    brightness: Brightness.dark,
  );

  // Black Colors Scheme
  static const ColorScheme darkColorScheme = ColorScheme(
    primary: Color(0xFF57D780),
    secondary: Color(0xFFff5678),
    background: Color(0xFF181818),
    surface: Color(0xFF282828),
    onBackground: Color(0xFF282828),
    error: _darkFillColor,
    onError: _darkFillColor,
    onPrimary: _darkFillColor,
    onSecondary: _darkFillColor,
    onSurface: _darkFillColor,
    brightness: Brightness.dark,
  );

  static final TextTheme _textTheme = TextTheme(
    headline4: TextStyle(fontWeight: _bold, fontSize: 28.0),
    headline5: TextStyle(fontWeight: _bold, fontSize: 24.0),
    headline6: TextStyle(fontWeight: _normal, fontSize: 18.0),
    subtitle1: TextStyle(fontWeight: _bold, fontSize: 14.0),
    subtitle2: TextStyle(fontWeight: _normal, fontSize: 14.0),
    button: TextStyle(fontWeight: _normal, fontSize: 12.0),
  );
}
