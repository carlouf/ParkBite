import 'package:flutter/material.dart';


ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,

  colorScheme: ColorScheme.light(
    primary: Color(0xFF735C00),
    onPrimary: Color(0xFFFFFFFF),
    primaryContainer: Color(0xFFFFE088),
    onPrimaryContainer: Color(0xFF241A00),
    secondary: Color(0xFF695D3F),
    onSecondary: Color(0xFFFFFFFF),
    secondaryContainer: Color(0xFFF1E1BB),
    onSecondaryContainer: Color(0xFF221B04),
    tertiary: Color(0xFF46664B),
    onTertiary: Color(0xFFFFFFFF),
    tertiaryContainer: Color(0xFFC8ECC9),
    onTertiaryContainer: Color(0xFF03210C),
    error: Color(0xFFBA1A1A),
    errorContainer: Color(0xFFFFDAD6),
    onError: Color(0xFFFFFFFF),
    onErrorContainer: Color(0xFF410002),
    background: Color(0xFFFFFBFF),
    onBackground: Color(0xFF1E1B16),
    surface: Color(0xFFFFFBFF),
    onSurface: Color(0xFF1E1B16),
    surfaceVariant: Color(0xFFEBE1CF),
    onSurfaceVariant: Color(0xFF4C4639),
    outline: Color(0xFF7D7667),
    onInverseSurface: Color(0xFFF7F0E7),
    inverseSurface: Color(0xFF33302A),
    inversePrimary: Color(0xFFE9C348),
    shadow: Color(0xFF000000),
    surfaceTint: Color(0xFF735C00),
    outlineVariant: Color(0xFFCFC6B4),
    scrim: Color(0xFF000000),
  ),
  textTheme: TextTheme(
    bodyMedium: TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.bold,
      color: Color(0xFF1E1B16),
    ),
    bodySmall: TextStyle(
      color: Color(0xFF1E1B16),
    )
  )

);