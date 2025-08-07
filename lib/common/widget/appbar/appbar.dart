import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';

/// A custom AppBar widget for a consistent and reusable application header.
///
/// This widget handles various leading options (back arrow, icon, or image)
/// and allows for customization of title, actions, and appearance.
class QSAppBar extends StatelessWidget implements PreferredSizeWidget {
  const QSAppBar({
    super.key,
    this.title,
    this.showBackArrow = false,
    this.leadingIcon,
    this.leadingImage,
    this.isTitleCentered = false,
    this.hasBottomBorder = false,
    this.actions,
    this.backgroundColor = QSColors.white,
    this.iconColor = QSColors.dark,
    this.onLeadingPressed,
  });

  /// The title text to display in the AppBar.
  final String? title;

  /// A flag to show a default back arrow icon.
  final bool showBackArrow;

  /// An optional custom icon for the leading position.
  final IconData? leadingIcon;

  /// An optional image asset path for the leading position.
  final String? leadingImage;

  /// A flag to center the title text.
  final bool isTitleCentered;

  /// A flag to show a 1.0 height border at the bottom of the AppBar.
  final bool hasBottomBorder;

  /// A list of widgets to display on the right side of the AppBar.
  final List<Widget>? actions;

  /// The background color of the AppBar.
  final Color backgroundColor;

  /// The color for the leading icon.
  final Color iconColor;

  /// An optional callback function for when the leading widget is pressed.
  final VoidCallback? onLeadingPressed;

  // Helper methods for leading widget logic
  Widget? _buildLeadingWidget() {
    if (showBackArrow) {
      return IconButton(
        onPressed: onLeadingPressed ?? () => Get.back(),
        icon: const Icon(
          CupertinoIcons.chevron_left,
          color: QSColors.dark,
        ),
      );
    }
    if (leadingImage != null) {
      return Padding(
        padding: const EdgeInsets.all(QSSizes.spacingSm),
        child: Image.asset(
          leadingImage!,
          fit: BoxFit.contain,
        ),
      );
    }
    if (leadingIcon != null) {
      return IconButton(
        onPressed: onLeadingPressed,
        icon: Icon(leadingIcon, color: iconColor),
      );
    }
    return null;
  }

  // Helper method for bottom border
  PreferredSizeWidget? _buildBottomBorder() {
    if (hasBottomBorder) {
      return PreferredSize(
        preferredSize: const Size.fromHeight(1.0),
        child: Container(
          color: QSColors.borderPrimary,
          height: 1.0,
        ),
      );
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      automaticallyImplyLeading: false,
      leading: _buildLeadingWidget(),
      titleSpacing: _buildLeadingWidget() == null ? QSSizes.spacingMd : 0.0,
      title: title != null ? Text(title!, style: Theme.of(context).textTheme.titleLarge) : null,
      centerTitle: isTitleCentered,
      bottom: _buildBottomBorder(),
      actions: actions,
    );
  }

  @override
  Size get preferredSize {
    const double kAppBarHeight = kToolbarHeight;
    return Size.fromHeight(kAppBarHeight + (hasBottomBorder ? 1.0 : 0.0));
  }
}
