import 'package:flutter/material.dart';

import '../../../utils/constants/images_string.dart';
import '../../../utils/constants/sizes.dart';
import '../controller/splash_screen_controller.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SplashScreenController.instance;
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(QSImages.logoQuranSenja, width: QSSizes.imageSizeMd),
            Text("Qur'an Senja"),
            Text("Sahabat Terbaik Menjelang Senja"),
          ],
        ),
      ),
    );
  }
}
