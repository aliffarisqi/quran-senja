import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';

class ACLRoundedContainer extends StatelessWidget {
  const ACLRoundedContainer({
    super.key,
    this.width,
    this.height,
    this.child,
    this.showBorder = false,
    this.shadowShow = false,
    this.radius = QSSizes.cardRadiusLg,
    this.borderColor = QSColors.borderPrimary,
    this.backgroundColor = Colors.white,
    this.padding,
    this.margin,
    this.backgroundImagePath,
  });

  final double? width;
  final double? height;
  final double radius;
  final Widget? child;
  final bool showBorder;
  final bool shadowShow;
  final Color borderColor;
  final Color backgroundColor;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final String? backgroundImagePath;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(radius),
        border: showBorder ? Border.all(color: borderColor) : null,
        boxShadow: shadowShow
            ? [
                const BoxShadow(
                  color: QSColors.light,
                  spreadRadius: 1,
                  blurRadius: 6,
                  offset: Offset(0, 0),
                ),
              ]
            : null, // Jika false, tidak ada shadow
        image: backgroundImagePath != null
            ? DecorationImage(
                image: AssetImage(backgroundImagePath!),
                fit: BoxFit.fill,
              )
            : null,
      ),
      child: child,
    );
  }
}
