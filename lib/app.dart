import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'bindings/app_bindings.dart';
import 'features/splash/screen/splash_screen.dart';
import 'utils/constants/text_strings.dart';
import 'utils/theme/theme.dart';

/// The root widget of the application.
///
/// This widget sets up the theme, initial bindings, and the home screen
/// for the entire application using [GetMaterialApp].
class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // Binds the controllers and services when the app starts.
      initialBinding: QSAppBinding(),
      // The title of the app, displayed in the task switcher.
      title: QSTexts.appName,
      // Sets the light theme for the application.
      theme: QSTheme.lightTheme,
      // Specifies that the app should always use the light theme.
      themeMode: ThemeMode.light,
      // Hides the debug banner in the top-right corner.
      debugShowCheckedModeBanner: false,
      // The initial screen of the application.
      home: const SplashScreen(),
    );
  }
}
