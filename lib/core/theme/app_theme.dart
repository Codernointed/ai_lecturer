import 'package:flutter/material.dart';

class AppTheme {
  // Primary color - Teal
  static const Color primaryColor = Color(0xFF26A69A);

  // Secondary color - Soft green
  static const Color secondaryColor = Color(0xFFA5D6A7);

  // Background colors
  static const Color backgroundColor = Color(0xFFFFFFFF);
  static const Color backgroundLightGray = Color(0xFFF5F5F5);

  // Text colors
  static const Color textDark = Color(0xFF212121);
  static const Color textMedium = Color(0xFF757575);
  static const Color textLight = Color(0xFFBDBDBD);

  // Success, error, warning colors
  static const Color successColor = Color(0xFF4CAF50);
  static const Color errorColor = Color(0xFFE53935);
  static const Color warningColor = Color(0xFFFFB74D);

  // High contrast mode colors
  static const Color highContrastBackground = Color(0xFF121212);
  static const Color highContrastText = Color(0xFFFAFAFA);
  static const Color highContrastPrimary = Color(0xFF4DB6AC);

  // Create a theme data instance
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      fontFamily: 'Poppins',
      colorScheme: ColorScheme.light(
        primary: primaryColor,
        secondary: secondaryColor,
        surface: backgroundColor,
        error: errorColor,
        onPrimary: Colors.white,
        onSecondary: textDark,
        onSurface: textDark,
        onError: Colors.white,
      ),
      scaffoldBackgroundColor: backgroundColor,
      appBarTheme: const AppBarTheme(
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          foregroundColor: Colors.white,
          minimumSize: const Size(double.infinity, 56),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: 0,
          textStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: primaryColor,
          side: const BorderSide(color: primaryColor, width: 2),
          minimumSize: const Size(double.infinity, 56),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          textStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
      textTheme: _getTextTheme(),
      inputDecorationTheme: InputDecorationTheme(
        fillColor: backgroundLightGray,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: primaryColor, width: 2),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      ),
    );
  }

  // High contrast theme for accessibility
  static ThemeData get highContrastTheme {
    return ThemeData(
      useMaterial3: true,
      fontFamily: 'Poppins',
      colorScheme: ColorScheme.dark(
        primary: highContrastPrimary,
        secondary: Colors.white,
        surface: highContrastBackground,
        error: Colors.red[400]!,
        onPrimary: Colors.black,
        onSecondary: Colors.black,
        onSurface: highContrastText,
        onError: Colors.black,
      ),
      scaffoldBackgroundColor: highContrastBackground,
      appBarTheme: AppBarTheme(
        backgroundColor: highContrastBackground,
        foregroundColor: highContrastText,
        elevation: 0,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: highContrastPrimary,
          foregroundColor: Colors.black,
          minimumSize: const Size(double.infinity, 56),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: 0,
          textStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18, // Larger text for accessibility
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: highContrastText,
          side: BorderSide(color: highContrastText, width: 2),
          minimumSize: const Size(double.infinity, 56),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          textStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18, // Larger text for accessibility
          ),
        ),
      ),
      textTheme: _getTextTheme(isHighContrast: true),
      inputDecorationTheme: InputDecorationTheme(
        fillColor: Colors.black,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.white, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: highContrastPrimary, width: 2),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        hintStyle: TextStyle(color: Colors.grey[400]),
      ),
    );
  }

  // Get text theme based on Poppins font family
  static TextTheme _getTextTheme({bool isHighContrast = false}) {
    Color textColor = isHighContrast ? highContrastText : textDark;
    double scaleFactor = isHighContrast ? 1.1 : 1.0; // Larger text for high contrast
    
    return TextTheme(
      headlineLarge: TextStyle(
        fontSize: 32 * scaleFactor,
        fontWeight: FontWeight.bold,
        color: textColor,
      ),
      headlineMedium: TextStyle(
        fontSize: 28 * scaleFactor,
        fontWeight: FontWeight.bold,
        color: textColor,
      ),
      headlineSmall: TextStyle(
        fontSize: 24 * scaleFactor,
        fontWeight: FontWeight.bold,
        color: textColor,
      ),
      titleLarge: TextStyle(
        fontSize: 20 * scaleFactor,
        fontWeight: FontWeight.w600,
        color: textColor,
      ),
      titleMedium: TextStyle(
        fontSize: 18 * scaleFactor,
        fontWeight: FontWeight.w600,
        color: textColor,
      ),
      titleSmall: TextStyle(
        fontSize: 16 * scaleFactor,
        fontWeight: FontWeight.w600,
        color: textColor,
      ),
      bodyLarge: TextStyle(
        fontSize: 16 * scaleFactor,
        fontWeight: FontWeight.normal,
        color: textColor,
      ),
      bodyMedium: TextStyle(
        fontSize: 14 * scaleFactor,
        fontWeight: FontWeight.normal,
        color: textColor,
      ),
      bodySmall: TextStyle(
        fontSize: 12 * scaleFactor,
        fontWeight: FontWeight.normal,
        color: textColor,
      ),
    );
  }
}
