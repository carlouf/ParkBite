import 'package:flutter/material.dart';


ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,

  colorScheme: ColorScheme.dark(
    primary: Color(0xFFE9C348),
    onPrimary: Color(0xFF3C2F00),
    primaryContainer: Color(0xFF574500),
    onPrimaryContainer: Color(0xFFFFE088),
    secondary: Color(0xFFD4C5A1),
    onSecondary: Color(0xFF383016),
    secondaryContainer: Color(0xFF50462A),
    onSecondaryContainer: Color(0xFFF1E1BB),
    tertiary: Color(0xFFACCFAE),
    onTertiary: Color(0xFF19371F),
    tertiaryContainer: Color(0xFF2F4E34),
    onTertiaryContainer: Color(0xFFC8ECC9),
    error: Color(0xFFFFB4AB),
    errorContainer: Color(0xFF93000A),
    onError: Color(0xFF690005),
    onErrorContainer: Color(0xFFFFDAD6),
    background: Color(0xFF1E1B16),
    onBackground: Color(0xFFE8E2D9),
    surface: Color(0xFF1E1B16),
    onSurface: Color(0xFFE8E2D9),
    surfaceVariant: Color(0xFF4C4639),
    onSurfaceVariant: Color(0xFFCFC6B4),
    outline: Color(0xFF989080),
    onInverseSurface: Color(0xFF1E1B16),
    inverseSurface: Color(0xFFE8E2D9),
    inversePrimary: Color(0xFF735C00),
    shadow: Color(0xFF000000),
    surfaceTint: Color(0xFFE9C348),
    outlineVariant: Color(0xFF4C4639),
    scrim: Color(0xFF000000),
  ),
  
  textTheme: TextTheme(
    bodyMedium: TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.bold,
      color: Color(0xFFE8E2D9),
    ),
    bodySmall: TextStyle(
      color: Color(0xFFE8E2D9),
    )
  )

);