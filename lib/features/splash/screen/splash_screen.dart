import 'package:flutter/material.dart';
import 'package:quransenja/utils/extensions/context_extension.dart';

import '../../../common/widget/shape/app_spacing.dart';
import '../../../utils/constants/images_string.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/constants/text_strings.dart';
import '../controller/splash_screen_controller.dart';

/// A widget that displays the initial loading screen of the application.
///
/// This screen typically shows the app's logo and name while
/// the app performs background tasks, such as data loading or
/// authentication checks.
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
            // Display image splash screen
            Image.asset(QSImages.logoQuranSenja, width: QSSizes.imageSizeMd),
            QSAppSpacing.verticalXl,

            // title app name
            Text(QSTexts.appName, style: context.textTheme.titleLarge),
            QSAppSpacing.verticalSm,

            // tagline for the app name
            Text(QSTexts.appTagline, style: context.textTheme.bodyMedium),
          ],
        ),
      ),
    );
  }
}
