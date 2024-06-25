import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Color(0xFF0033A0), // Domino's Blue
    hintColor: Color(0xFFED2939), // Domino's Red

    colorScheme: ColorScheme.dark(
        primary: Color(0xFF0033A0), // Domino's Blue
        onPrimary: Color(0xFFFFFFFF), // White
        primaryContainer: Color(0xFF002080), // Darker Blue
        onPrimaryContainer: Color(0xFFD0E0FF), // Light Blue

        secondary: Color(0xFFED2939), // Domino's Red
        onSecondary: Color(0xFFFFFFFF), // White
        secondaryContainer: Color(0xFFB22234), // Darker Red
        onSecondaryContainer: Color(0xFFFFDAD6), // Light Red

        tertiary: Color(0xFFFFD700), // Mario's Yellow
        onTertiary: Color(0xFF000000), // Black
        tertiaryContainer: Color(0xFFFFA700), // Darker Yellow
        onTertiaryContainer: Color(0xFFFFE88C), // Light Yellow

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
        inversePrimary: Color(0xFF0033A0), // Inverse to primary blue

        shadow: Color(0xFF000000),
        surfaceTint: Color(0xFF0033A0), // Primary blue tint
        outlineVariant: Color(0xFF4C4639),
        scrim: Color(0xFF000000),
    ),

    textTheme: TextTheme(
        bodyLarge: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            color: Color(0xFFE8E2D9), // Text color matching the theme
        ),
        bodyMedium: TextStyle(
            color: Color(0xFFE8E2D9), // Text color matching the theme
        ),
        displayLarge: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
            color: Color(0xFFFFD700), // Mario's Yellow
        ),
        displayMedium: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Color(0xFFED2939), // Domino's Red
        ),
        titleMedium: TextStyle(
            fontSize: 16.0,
            color: Color(0xFFD0E0FF), // Light Blue
        ),
    ),

    buttonTheme: ButtonThemeData(
        buttonColor: Color(0xFFED2939), // Domino's Red for buttons
        textTheme: ButtonTextTheme.primary,
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            foregroundColor: Color(0xFFFFFFFF), backgroundColor: Color(0xFFED2939), // White text on buttons
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
    ),
);

