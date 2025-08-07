import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quransenja/utils/constants/colors.dart';

import '../../../navigation_menu.dart';
import '../../../utils/helpers/helper_functions.dart';

/// A customizable horizontal line indicator for a navigation bar.
///
/// This widget is designed to be used with a `Positioned` widget to
/// visually indicate the currently selected item in a navigation menu.
class QSLineNavBar extends StatelessWidget {
  const QSLineNavBar({
    super.key,
    required this.controller,
  });

  /// The controller that holds the selected index as an observable.
  final NavigationController controller;

  @override
  Widget build(BuildContext context) {
    // The Obx widget ensures that the UI rebuilds whenever the
    // observable selectedIndex changes, providing a reactive experience.
    return Obx(
      () => Positioned(
        // The indicator is placed at the top of the parent widget.
        top: 0,
        // The 'left' position is dynamically calculated to center the indicator
        // on the currently selected navigation item using a helper function.
        left: QSHelperFunctions.centerLineNavbar(controller.selectedIndex.value),
        // Sets the width of the indicator line.
        width: QSHelperFunctions.screenWidth() / 4 / 2,
        child: Container(
          // Defines the visual style of the indicator.
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: QSColors.primary,
          ),
          // Sets the fixed height of the indicator line.
          height: 4,
        ),
      ),
    );
  }
}
