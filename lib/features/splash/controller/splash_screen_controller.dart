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

  Future<void> loadData() async {
    await Future.delayed(const Duration(seconds: 2));
    Get.offAll(() => const NavigationMenu());
  }
}
