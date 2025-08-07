import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QSHelperFunctions {
  static void showSnackBar(String message) {
    ScaffoldMessenger.of(Get.context!).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  static Size screenSize() {
    return MediaQuery.of(Get.context!).size;
  }

  static double screenHeight() {
    return MediaQuery.of(Get.context!).size.height;
  }

  static double screenWidth() {
    return MediaQuery.of(Get.context!).size.width;
  }

  static double centerLineNavbar(int selectedIndex, {int navItemCount = 2, double indicatorWidth = 50}) {
    double screenWidth = QSHelperFunctions.screenWidth();
    double itemWidth = screenWidth / navItemCount;
    double itemCenter = itemWidth * selectedIndex + itemWidth / 2;

    return itemCenter - indicatorWidth / 2;
  }
}
