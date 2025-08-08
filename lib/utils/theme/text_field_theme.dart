import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/colors.dart';

/// A utility class for defining custom `InputDecorationTheme`s.
///
/// This class provides a consistent look and feel for all text fields
/// in the application, including styles for various states like focused,
/// error, and enabled.
class QSTextFieldTheme {
  // Private constructor to prevent instantiation.
  QSTextFieldTheme._();

  /// Defines the light theme for `InputDecoration`.
  static InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
    // The maximum number of lines for error messages.
    errorMaxLines: 3,
    // The color of prefix icons.
    prefixIconColor: QSColors.dark,
    // The color of suffix icons.
    suffixIconColor: QSColors.dark,
    // The style for the label text.
    labelStyle: GoogleFonts.museoModerno(
      fontSize: 14.0,
      color: Colors.black,
    ),
    // The style for the hint text.
    hintStyle: GoogleFonts.museoModerno(
      fontSize: 14.0,
      color: Colors.black,
    ),
    // The style for the error text.
    errorStyle: GoogleFonts.museoModerno(
      fontSize: 12.0,
      color: QSColors.primary,
      fontWeight: FontWeight.w400,
    ),
    // The style for the floating label text.
    floatingLabelStyle: GoogleFonts.museoModerno(
      fontSize: 14.0,
      color: Colors.black,
    ),
    // The default border for all states.
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(width: 1, color: QSColors.primaryLight),
    ),
    // The border for the enabled but unfocused state.
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(width: 1, color: QSColors.borderPrimary),
    ),
    // The border for the focused state.
    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(width: 1, color: QSColors.primaryMedium),
    ),
    // The border for the error state.
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(width: 1, color: QSColors.primary),
    ),
    // The border for the focused error state.
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(width: 2, color: Colors.black12),
    ),
  );
}
