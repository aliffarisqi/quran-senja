import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/colors.dart';

/// Custom theme data for the Qur'an Senja application.
///
/// This theme centralizes all design specifications like colors, text styles,
/// and other UI properties to ensure consistency.
class QSTheme {
  QSTheme._(); // Private constructor to prevent instantiation

  // --- Light Theme ---
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: GoogleFonts.poppins().fontFamily, // Menggunakan Poppins sebagai contoh font default
    brightness: Brightness.light,
    colorScheme: ColorScheme.light(
      primary: QSColors.primary,
      secondary: QSColors.secondary,
      surface: QSColors.white,
      error: QSColors.error,
    ),
    textTheme: _textTheme,
  );

  // --- Dark Theme ---
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: GoogleFonts.poppins().fontFamily,
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(
      primary: QSColors.primary,
      secondary: QSColors.secondary,
      surface: QSColors.black,
      error: QSColors.error,
    ),
    textTheme: _textTheme,
  );

  // --- Themed Text Styles ---
  // This text theme is shared by both light and dark themes.
  // The color of the text will automatically adapt to the theme's brightness.
  static final TextTheme _textTheme = TextTheme(
    // === DISPLAY ===
    displayLarge: GoogleFonts.museoModerno(
      fontSize: 57,
      fontWeight: FontWeight.w400,
    ),
    displayMedium: GoogleFonts.museoModerno(
      fontSize: 45,
      fontWeight: FontWeight.w400,
    ),
    displaySmall: GoogleFonts.museoModerno(
      fontSize: 36,
      fontWeight: FontWeight.w400,
    ),
    // === HEADLINE ===
    headlineLarge: GoogleFonts.museoModerno(
      fontSize: 28,
      fontWeight: FontWeight.w500,
    ),
    headlineMedium: GoogleFonts.museoModerno(
      fontSize: 24,
      fontWeight: FontWeight.w500,
    ),
    headlineSmall: GoogleFonts.museoModerno(
      fontSize: 22,
      fontWeight: FontWeight.w500,
    ),
    // === TITLE ===
    titleLarge: GoogleFonts.museoModerno(
      fontSize: 18,
      fontWeight: FontWeight.w500,
    ),
    titleMedium: GoogleFonts.museoModerno(
      fontSize: 16,
      fontWeight: FontWeight.w500,
    ),
    titleSmall: GoogleFonts.museoModerno(
      fontSize: 14,
      fontWeight: FontWeight.w500,
    ),
    // === BODY ===
    bodyLarge: GoogleFonts.museoModerno(
      fontSize: 16,
      fontWeight: FontWeight.w400,
    ),
    bodyMedium: GoogleFonts.museoModerno(
      fontSize: 14,
      fontWeight: FontWeight.w400,
    ),
    bodySmall: GoogleFonts.museoModerno(
      fontSize: 12,
      fontWeight: FontWeight.w400,
    ),
    // === LABEL ===
    labelLarge: GoogleFonts.museoModerno(
      fontSize: 14,
      fontWeight: FontWeight.w500,
    ),
    labelMedium: GoogleFonts.museoModerno(
      fontSize: 12,
      fontWeight: FontWeight.w500,
    ),
    labelSmall: GoogleFonts.museoModerno(
      fontSize: 11,
      fontWeight: FontWeight.w500,
    ),
  );
}
