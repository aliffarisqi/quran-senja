import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

import 'common/widget/space/line_navbar.dart';
import 'features/beranda/screen/beranda_screen.dart';
import 'features/favorite/screen/favorite_screen.dart';
import 'utils/constants/colors.dart';
import 'utils/helpers/helper_functions.dart';

/// The main navigation hub of the application.
///
/// This widget provides a bottom navigation bar that allows users to switch
/// between different screens (Beranda and Favorite).
class NavigationMenu extends StatelessWidget {
  const NavigationMenu({
    super.key,
    this.initialIndex = 0,
  });

  /// The initial index to be selected when the navigation menu is first built.
  final int initialIndex;

  @override
  Widget build(BuildContext context) {
    // Get the instance of the navigation controller.
    final NavigationController controller = NavigationController.instance;

    // Set the initial index after the first frame has been rendered.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.setIndex(initialIndex);
    });

    return Scaffold(
      // The bottom navigation bar, wrapped in Obx to be reactive.
      bottomNavigationBar: Obx(
        () => Stack(
          children: [
            // The core NavigationBar widget.
            NavigationBar(
              elevation: 0,
              selectedIndex: controller.selectedIndex.value,
              onDestinationSelected: (index) => controller.selectedIndex.value = index,
              backgroundColor: QSColors.white,
              indicatorColor: Colors.transparent,
              destinations: const [
                // Destination for the "Beranda" screen.
                NavigationDestination(
                  icon: Icon(IconsaxPlusLinear.star),
                  selectedIcon: Icon(IconsaxPlusBold.star, color: QSColors.primary),
                  label: 'Beranda',
                ),
                // Destination for the "Favorite" screen.
                NavigationDestination(
                  icon: Icon(IconsaxPlusLinear.heart),
                  selectedIcon: Icon(IconsaxPlusBold.heart, color: QSColors.primary),
                  label: 'Favorite',
                ),
              ],
            ),
            // A positioned container to create a subtle grey line at the top of the nav bar.
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
            // A custom line indicator for the selected item.
            QSLineNavBar(controller: controller),
          ],
        ),
      ),
      // The body of the screen, which changes based on the selected index.
      body: Obx(() => controller.screen[controller.selectedIndex.value]),
    );
  }
}

/// A GetX controller for managing the state of the bottom navigation bar.
///
/// This controller handles the selected index and provides the list of
/// screens to be displayed.
class NavigationController extends GetxController {
  // Static getter to easily access the controller instance.
  static NavigationController get instance => Get.find();

  // A reactive variable to store the index of the currently selected screen.
  final Rx<int> selectedIndex = 0.obs;

  // The list of screens corresponding to each navigation destination.
  final List<Widget> screen = const [
    BerandaScreen(),
    FavoriteScreen(),
  ];

  /// Sets the selected index of the navigation menu.
  void setIndex(int index) {
    selectedIndex.value = index;
  }
}
