import 'package:flutter/material.dart';

import '../../../utils/constants/sizes.dart';

/// A class containing predefined vertical and horizontal spacing widgets
/// based on the [QSSizes] constants.
///
/// This provides a consistent and easy-to-use set of spacing widgets.
class QSAppSpacing {
  QSAppSpacing._();

  // Vertical spacing
  static const Widget verticalXs = SizedBox(height: QSSizes.spacingXs);
  static const Widget verticalSm = SizedBox(height: QSSizes.spacingSm);
  static const Widget verticalMd = SizedBox(height: QSSizes.spacingMd);
  static const Widget verticalLg = SizedBox(height: QSSizes.spacingLg);
  static const Widget verticalXl = SizedBox(height: QSSizes.spacingXl);

  // Horizontal spacing
  static const Widget horizontalXs = SizedBox(width: QSSizes.spacingXs);
  static const Widget horizontalSm = SizedBox(width: QSSizes.spacingSm);
  static const Widget horizontalMd = SizedBox(width: QSSizes.spacingMd);
  static const Widget horizontalLg = SizedBox(width: QSSizes.spacingLg);
  static const Widget horizontalXl = SizedBox(width: QSSizes.spacingXl);

  // Default spacing
  static const Widget spaceBetweenItems = SizedBox(height: QSSizes.spaceBtwItems);
  static const Widget spaceBetweenSections = SizedBox(height: QSSizes.spaceBtwSections);
}
