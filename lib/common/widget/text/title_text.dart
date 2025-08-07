import 'package:flutter/material.dart';
import 'package:quransenja/utils/extensions/context_extension.dart';

import '../../../utils/constants/colors.dart';

/// A reusable widget for displaying text with a large title style.
///
/// This widget provides a consistent way to display a title text with
/// an optional color override, using the theme's [titleLarge] text style.
class QSTextTitle extends StatelessWidget {
  const QSTextTitle({
    super.key,
    required this.text,
    this.color = QSColors.dark,
  });

  /// The text content to be displayed.
  final String text;

  /// The color of the text. Defaults to [QSColors.dark].
  final Color color;

  @override
  Widget build(BuildContext context) {
    // Displays the provided text with the titleLarge style from the current theme.
    // The color can be overridden by the 'color' property.
    return Text(
      text,
      style: context.textTheme.titleLarge?.copyWith(color: color),
    );
  }
}
