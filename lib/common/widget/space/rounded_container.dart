import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';

/// A customizable container widget with rounded corners and optional border/shadow.
///
/// This widget provides a reusable way to create containers with a consistent
/// look and feel, supporting various customization options.
class QSRoundedContainer extends StatelessWidget {
  const QSRoundedContainer({
    super.key,
    this.width,
    this.height,
    this.child,
    this.showBorder = false,
    this.hasShadow = false,
    this.radius = QSSizes.cardRadiusLg,
    this.borderColor = QSColors.borderPrimary,
    this.backgroundColor = Colors.white,
    this.padding,
    this.margin,
    this.backgroundImage,
    this.gradientColor,
  });

  /// The width of the container. Defaults to `null` (unconstrained).
  final double? width;

  /// The height of the container. Defaults to `null` (unconstrained).
  final double? height;

  /// The border radius of the container. Defaults to [QSSizes.cardRadiusLg].
  final double radius;

  /// The widget to be displayed inside the container.
  final Widget? child;

  /// A flag to show a border around the container.
  final bool showBorder;

  /// A flag to show a shadow beneath the container.
  final bool hasShadow;

  /// The color of the border. Defaults to [QSColors.borderPrimary].
  final Color borderColor;

  /// The background color of the container. Defaults to [Colors.white].
  final Color backgroundColor;

  /// The padding of the child inside the container.
  final EdgeInsetsGeometry? padding;

  /// The margin of the container.
  final EdgeInsetsGeometry? margin;

  /// The path to a background image asset. Defaults to `null`.
  final String? backgroundImage;

  /// The value of gradient to set gradient color on the container
  final Gradient? gradientColor;
  @override
  Widget build(BuildContext context) {
    // Builds the main Container widget
    return Container(
      // Sets the width of the Container according to the property, if available
      width: width,
      // Sets the height of the Container according to the property, if available
      height: height,
      // Applies padding inside the Container
      padding: padding,
      // Applies margin outside the Container
      margin: margin,
      // Configures the visual decoration of the Container
      decoration: BoxDecoration(
        // Sets the background color of the Container
        color: backgroundColor,
        // Sets the background color of the container to gradient
        gradient: gradientColor,
        // Configures the border radius (rounded corners)
        borderRadius: BorderRadius.circular(radius),
        // Displays a border if the showBorder property is true
        border: showBorder ? Border.all(color: borderColor) : null,
        // Displays a shadow if the hasShadow property is true
        boxShadow: hasShadow
            ? [
                BoxShadow(
                  color: QSColors.light,
                  spreadRadius: 1,
                  blurRadius: 6,
                  offset: const Offset(0, 0),
                ),
              ]
            : null,
        // Displays a background image if the backgroundImage property is not null
        image: backgroundImage != null
            ? DecorationImage(
                image: AssetImage(backgroundImage!),
                fit: BoxFit.fill,
              )
            : null,
      ),
      // Places the child widget inside the Container
      child: child,
    );
  }
}
