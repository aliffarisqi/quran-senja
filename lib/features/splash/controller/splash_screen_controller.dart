import 'dart:async';

import 'package:get/get.dart';

import '../../../navigation_menu.dart';

class SplashScreenController extends GetxController {
  static SplashScreenController get instance => Get.find();
  @override
  void onInit() {
    super.onInit();
    loadData();
  }

  void loadData() {
    Timer(const Duration(seconds: 2), () {
      Get.offAll(() => const NavigationMenu());
    });
  }
}
