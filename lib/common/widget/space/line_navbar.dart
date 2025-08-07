import 'package:flutter/material.dart';
import 'package:quransenja/utils/constants/colors.dart';

import '../../../navigation_menu.dart';
import '../../../utils/helpers/helper_functions.dart';

class QSLineNavBar extends StatelessWidget {
  const QSLineNavBar({
    super.key,
    required this.controller,
  });

  final NavigationController controller;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: QSHelperFunctions.centerLineNavbar(controller.selectedIndex.value),
      width: QSHelperFunctions.screenWidth() / 4 / 2,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: QSColors.primary,
        ),
        height: 4,
      ),
    );
  }
}
