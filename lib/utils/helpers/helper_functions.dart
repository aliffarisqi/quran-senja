import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// A utility class containing helper functions for common tasks
/// such as showing a snackbar and getting screen dimensions.
///
/// All methods are static, allowing them to be called without
/// creating an instance of the class.
class QSHelperFunctions {
  /// Displays a snackbar with a given message.
  ///
  /// This function uses the context from `Get.context` to show the snackbar.
  static void showSnackBar(String message) {
    ScaffoldMessenger.of(Get.context!).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  /// Returns the size of the current screen.
  static Size screenSize() {
    return MediaQuery.of(Get.context!).size;
  }

  /// Returns the height of the current screen.
  static double screenHeight() {
    return MediaQuery.of(Get.context!).size.height;
  }

  /// Returns the width of the current screen.
  static double screenWidth() {
    return MediaQuery.of(Get.context!).size.width;
  }

  /// Calculates the horizontal position for a centered indicator in a navigation bar.
  ///
  /// This function determines the `x` offset needed to place an indicator
  /// at the center of a navigation item.
  ///
  /// - `selectedIndex`: The index of the currently selected navigation item.
  /// - `navItemCount`: The total number of navigation items.
  /// - `indicatorWidth`: The width of the indicator to be centered.
  static double centerLineNavbar(int selectedIndex, {int navItemCount = 2, double indicatorWidth = 50}) {
    // Get the total screen width.
    double screenWidth = QSHelperFunctions.screenWidth();
    // Calculate the width of a single navigation item.
    double itemWidth = screenWidth / navItemCount;
    // Calculate the center point of the selected item.
    double itemCenter = itemWidth * selectedIndex + itemWidth / 2;

    // Return the final position by subtracting half of the indicator's width.
    return itemCenter - indicatorWidth / 2;
  }
}
