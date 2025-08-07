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

  static double centerLineNavbar(int selectedIndex) {
    double screenWidth = QSHelperFunctions.screenWidth();
    return (screenWidth / 4) * selectedIndex + (screenWidth / 4 / 2) - (screenWidth / 4 / 3 / 1.9);
  }
}
