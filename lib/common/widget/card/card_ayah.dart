import 'package:flutter/material.dart';
import 'package:quransenja/utils/extensions/context_extension.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/images_string.dart';
import '../../../utils/constants/sizes.dart';
import '../shape/app_spacing.dart';

/// A reusable card widget to display an Ayah number with decorative frames.
///
/// This widget arranges a number between two image assets, providing a
/// consistent and visually appealing way to label Ayahs.
class QSAyahCard extends StatelessWidget {
  const QSAyahCard({
    super.key,
    required this.nomorAyah,
  });

  /// The number of the Ayah to be displayed.
  final int nomorAyah;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Top frame image for the number.
        Image.asset(QSImages.frameUpperGrey, width: QSSizes.iconLg),
        // Adds a small vertical space.
        QSAppSpacing.verticalSm,
        // Displays the Surah number with a specific text style.
        Text(
          nomorAyah.toString(),
          style: context.textTheme.titleLarge?.copyWith(
            color: QSColors.primaryMedium,
          ),
        ),
        // Bottom frame image for the number.
        QSAppSpacing.verticalSm,
        Image.asset(QSImages.frameBottomGrey, width: QSSizes.iconLg),
      ],
    );
  }
}
