import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../utils/constants/text_strings.dart';
import 'bindings/app_bindings.dart';
import 'features/splash/screen/splash_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: QSAppBinding(),
      title: QSTexts.appName,
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
