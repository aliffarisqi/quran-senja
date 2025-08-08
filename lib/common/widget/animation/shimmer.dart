import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../utils/constants/colors.dart';

/// A reusable widget that provides a shimmering loading effect.
///
/// This widget is useful for indicating that content is being loaded,
/// enhancing the user experience by providing visual feedback.
class QSShimmerEffect extends StatelessWidget {
  const QSShimmerEffect({
    super.key,
    required this.width,
    required this.height,
    this.radius = 15,
    this.color,
  });

  /// The width of the shimmer effect container.
  final double width;

  /// The height of the shimmer effect container.
  final double height;

  /// The border radius of the shimmer effect container. Defaults to 15.
  final double radius;

  /// The background color of the shimmer container. Defaults to QSColors.white.
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      // The base color of the shimmer effect.
      baseColor: const Color.fromARGB(47, 199, 199, 199),
      // The highlight color that moves across the effect.
      highlightColor: const Color.fromARGB(159, 255, 255, 255),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          // Sets the background color, defaulting to white.
          color: color ?? (QSColors.white),
          // Applies the specified border radius.
          borderRadius: BorderRadius.circular(radius),
        ),
      ),
    );
  }
}
