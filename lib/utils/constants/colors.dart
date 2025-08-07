import 'package:flutter/material.dart';

/// A class that provides all the application's color constants.
///
/// This helps maintain a consistent color palette across the application
/// and makes it easier to update the theme.
class QSColors {
  QSColors._(); // Private constructor to prevent instantiation

  //Basic App Colors
  /// Main primary color of the app.
  static const Color primary = Color(0xFFCE681F);
  static const Color primaryLight = Color(0xFFFFE0E3);
  static const Color primaryMedium = Color(0xFFFB959F);
  static const Color secondary = Color(0xFFFFE24B);
  static const Color accent = Color(0xFFB0C7FF);

  //Gradients
  /// A linear gradient color for backgrounds or special elements.
  static const Gradient linerGradient = LinearGradient(
    begin: Alignment(0.0, 0.0),
    end: Alignment(0.707, -0.707),
    colors: [Color(0xffff9a9e), Color(0xfffad0c4), Color(0xfffad0c4)],
  );

  // Text Colors
  static const Color textPrimary = Color(0xFF333333);
  static const Color textSecondary = Color(0xFF6C757D);
  static const Color textWhite = Colors.white;

  // Background Colors
  static const Color mainBackground = Color(0xFFF6F6F6);
  static const Color light = Color(0xFFF0F0F0);
  static const Color primaryBackground = Color(0xFFF3F5FF);

  // Status and Validation Colors
  static const Color error = Color(0xFFD32F2F);
  static const Color success = Color(0xFF3DCF97);
  static const Color warning = Color(0xFFF57C00);
  static const Color info = Color(0xFF1976D2);

  // Neutral Shades
  static const Color white = Color(0xFFFFFFFF);
  static const Color lightGrey = Color(0xFFF9F9F9);
  static const Color softGrey = Color(0xFFF4F4F4);
  static const Color grey = Color(0xFFE0E0E0);
  static const Color darkGrey = Color(0xFF939393);
  static const Color darkerGrey = Color(0xFF4F4F4F);
  static const Color dark = Color(0xFF272727);
  static const Color darkSecondary = Color.fromARGB(132, 24, 24, 24);
  static const Color black = Color(0xFF232323);

  // Other Colors
  static const Color green = Color(0xFF00C6A5);
  static const Color greenLight = Color(0xFFD8FAF4);
  static const Color greenMedium = Color.fromARGB(255, 135, 255, 233);

  /// A standard orange color.
  static const Color orange = Color(0xFFFF7A30);
  static const Color orangeLight = Color(0xFFFFF0E0);

  /// A standard purple color.
  static const Color purple = Color(0xFFAD54FC);
  static const Color purpleLight = Color(0xFFF6E0FF);

  /// A standard blue color.
  static const Color blue = Color(0xFF449BFE);

  static const Color borderPrimary = Color(0xFFD9D9D9);
  static const Color borderSecondary = Color(0xFFE6E6E6);
}
