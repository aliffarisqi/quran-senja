import 'package:flutter/material.dart';
import 'package:quransenja/common/widget/shape/app_spacing.dart';
import 'package:quransenja/utils/extensions/context_extension.dart';

import '../../../utils/constants/sizes.dart';

/// A reusable widget that displays an image, a title, and a subtitle.
///
/// This widget is ideal for presenting information in a clear and centered format,
/// such as on empty states or info screens.
class QSIconImageTitleSubTitle extends StatelessWidget {
  const QSIconImageTitleSubTitle({
    super.key,
    required this.imagePath,
    required this.title,
    required this.subTitle,
    this.width,
    this.isMarginTop = true,
  });

  /// The path to the image asset to be displayed.
  final String imagePath;

  /// The main title text.
  final String title;

  /// The subtitle text, usually a more detailed description.
  final String subTitle;

  /// The width of the image. Defaults to 150 if not specified.
  final double? width;

  /// A flag to determine whether to add a top margin.
  final bool isMarginTop;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(QSSizes.spacingMd),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Conditionally adds a top margin based on the `isMarginTop` flag.
            isMarginTop ? QSAppSpacing.verticalLg : const SizedBox.shrink(),
            // Displays the image asset with a specified width.
            Image.asset(imagePath, width: width ?? 150),
            // Adds vertical spacing after the image.
            QSAppSpacing.verticalLg,
            // Displays the title text with the app's titleMedium style.
            Text(title, style: context.textTheme.titleMedium),
            // Adds vertical spacing after the title.
            QSAppSpacing.verticalSm,
            // Displays the subtitle text with the app's bodyMedium style.
            Text(
              subTitle,
              style: context.textTheme.bodyMedium,
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
