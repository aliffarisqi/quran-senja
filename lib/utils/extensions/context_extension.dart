import 'package:flutter/material.dart';

/// Extension to provide easy access to theme text styles from BuildContext.
extension ThemeTextExtension on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;
}
