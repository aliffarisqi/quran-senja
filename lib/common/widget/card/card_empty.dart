import 'package:flutter/material.dart';
import 'package:quransenja/utils/constants/images_string.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../shape/app_spacing.dart';
import '../space/rounded_container.dart';

/// A reusable card widget for displaying an empty state.
///
/// This widget shows a title, an optional image, and an optional child widget
/// inside a rounded container. It's ideal for "no data" or "empty list" scenarios.
class QSCardEmpty extends StatelessWidget {
  const QSCardEmpty({
    super.key,
    required this.title,
    this.child,
    this.image = QSImages.empty,
  });

  /// The main title or message for the empty state.
  final String title;

  /// An optional widget to display below the title.
  final Widget? child;

  /// The path to the image asset to be displayed.
  final String image;

  @override
  Widget build(BuildContext context) {
    return QSRoundedContainer(
      // Applies a medium border radius.
      radius: QSSizes.borderRadiusMd,
      // Adds padding to the content inside the container.
      padding: const EdgeInsets.all(QSSizes.spacingMd),
      // Makes the container take the full width.
      width: double.infinity,
      child: Column(
        children: [
          // Displays the specified image asset.
          Image.asset(
            image,
            width: QSSizes.imageSizeMd,
          ),
          // Adds vertical spacing.
          QSAppSpacing.verticalMd,
          // Displays the title text with a specific style.
          Text(
            title,
            style: Theme.of(context).textTheme.titleSmall!.copyWith(color: QSColors.dark),
          ),
          // Conditionally displays the child widget or an empty box.
          if (child != null) ...[child!],
        ],
      ),
    );
  }
}
