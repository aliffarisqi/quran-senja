import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quransenja/bindings/app_bindings.dart';
import '../utils/constants/text_strings.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: QSAppBinding(),
      title: ACLTexts.appName,
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      home: const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
