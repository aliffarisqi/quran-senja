import 'package:flutter/material.dart';
import 'package:quransenja/utils/extensions/context_extension.dart';

import '../../../../common/widget/shape/app_spacing.dart';
import '../../../../common/widget/space/rounded_container.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';

/// A custom header widget for the home screen (Beranda).
///
/// This widget displays the application name and a greeting message inside a
/// rounded container with a linear gradient background.
class HeaderBeranda extends StatelessWidget {
  const HeaderBeranda({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return QSRoundedContainer(
      // Setscolor for container backgroundx
      backgroundColor: QSColors.white,
      // Sets the container's radius to 0 for a non-rounded, full-width look
      radius: 0,
      // Applies padding to the container's content
      padding: const EdgeInsets.only(
        left: QSSizes.spacingLg,
        right: QSSizes.spacingLg,
        top: QSSizes.spacingLg,
      ),
      child: Column(
        // Aligns children to the start of the cross-axis (left)
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Displays the app name with a specific headline style and color
          Text(
            QSTexts.appName,
            style: context.textTheme.headlineLarge?.copyWith(
              color: QSColors.primaryMedium,
            ),
          ),
          // Adds a small vertical space
          QSAppSpacing.verticalSm,

          // Displays the greeting sentence with a body style
          Text(
            QSTexts.greetingBeranda,
            style: context.textTheme.bodyMedium,
          ),
          // Adds a small vertical space
          QSAppSpacing.verticalSm,
        ],
      ),
    );
  }
}
