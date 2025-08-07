import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

import 'common/widget/space/line_navbar.dart';
import 'features/beranda/screen/beranda_screen.dart';
import 'features/favorite/screen/favorite_screen.dart';
import 'utils/constants/colors.dart';
import 'utils/helpers/helper_functions.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({
    super.key,
    this.initialIndex = 0,
  });
  final int initialIndex;

  @override
  Widget build(BuildContext context) {
    final NavigationController controller = NavigationController.instance;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.setIndex(initialIndex);
    });
    return Scaffold(
      bottomNavigationBar: Obx(
        () => Stack(
          children: [
            NavigationBar(
              elevation: 0,
              selectedIndex: controller.selectedIndex.value,
              onDestinationSelected: (index) => controller.selectedIndex.value = index,
              backgroundColor: QSColors.white,
              indicatorColor: Colors.transparent,
              destinations: [
                NavigationDestination(
                  icon: Icon(IconsaxPlusLinear.star),
                  selectedIcon: Icon(IconsaxPlusBold.star, color: QSColors.primary),
                  label: 'Beranda',
                ),
                NavigationDestination(
                  icon: Icon(IconsaxPlusLinear.heart),
                  selectedIcon: Icon(IconsaxPlusBold.heart, color: QSColors.primary),
                  label: 'Favorite',
                ),
              ],
            ),
            Positioned(
              top: 0,
              left: 0,
              width: QSHelperFunctions.screenWidth(),
              child: Container(
                decoration: const BoxDecoration(
                  color: QSColors.grey,
                ),
                height: 1.0,
              ),
            ),
            QSLineNavBar(controller: controller),
          ],
        ),
      ),
      body: Obx(() => controller.screen[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController {
  static NavigationController get instance => Get.find();
  final Rx<int> selectedIndex = 0.obs;

  final screen = [
    const BerandaScreen(),
    const FavoriteScreen(),
  ];
  void setIndex(int index) {
    selectedIndex.value = index;
  }
}
