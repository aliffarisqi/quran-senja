import 'package:flutter/material.dart';

/// Extension on [num] to easily create vertical and horizontal spacing.
///
/// Example:
/// `24.verticalSpace` will create a `SizedBox(height: 24.0)`
/// `16.horizontalSpace` will create a `SizedBox(width: 16.0)`
extension Spacing on num {
  /// Returns a `SizedBox` with the current number as height.
  SizedBox get verticalSpace => SizedBox(height: toDouble());

  /// Returns a `SizedBox` with the current number as width.
  SizedBox get horizontalSpace => SizedBox(width: toDouble());
}
