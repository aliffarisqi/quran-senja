import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/export.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../utils/helpers/device_utility.dart';

/// A customizable widget for a search input field.
///
/// This widget provides a tappable search bar with an optional background and border,
/// displaying an icon and a text placeholder.
class QSSearchContainer extends StatelessWidget {
  const QSSearchContainer({
    super.key,
    required this.text,
    this.icon = IconsaxPlusLinear.search_normal,
    this.showBackground = true,
    this.showBorder = true,
    this.onTap,
    this.padding = const EdgeInsets.symmetric(
      horizontal: QSSizes.spacingMd,
      vertical: QSSizes.spacingMd,
    ),
    this.width,
  });

  /// The placeholder text to display in the search bar.
  final String text;

  /// The icon to display at the beginning of the search bar.
  final IconData? icon;

  /// A flag to control the visibility of the background color.
  final bool showBackground;

  /// A flag to control the visibility of the border.
  final bool showBorder;

  /// The callback function to be executed when the container is tapped.
  final VoidCallback? onTap;

  /// The internal padding of the search container.
  final EdgeInsetsGeometry padding;

  /// The width of the container. Defaults to `null` to fill the available space.
  final double? width;

  @override
  Widget build(BuildContext context) {
    // The GestureDetector makes the entire container tappable, triggering the onTap callback.
    return GestureDetector(
      onTap: onTap,
      child: Container(
        // Sets the width to either the provided width or fills the parent
        width: width ?? QSDeviceUtils.getScreenWidth(context),

        // Applies padding for the content inside the container
        padding: padding,

        // Defines the visual decoration of the container
        decoration: BoxDecoration(
          // Sets the background color based on the showBackground flag
          color: showBackground ? QSColors.primaryLight : Colors.transparent,

          // Applies a border radius for rounded corners
          borderRadius: BorderRadius.circular(QSSizes.borderRadiusLg),

          // Sets the border if the showBorder flag is true
          border: showBorder ? Border.all(color: QSColors.primaryMedium) : null,
        ),
        child: Row(
          children: [
            // Displays the search icon with a constant color
            Icon(icon, color: QSColors.dark),

            // Adds horizontal space between the icon and the text
            const SizedBox(width: QSSizes.spacingMd),

            // Displays the placeholder text with a specific style
            Text(text, style: context.textTheme.bodyMedium)
          ],
        ),
      ),
    );
  }
}
