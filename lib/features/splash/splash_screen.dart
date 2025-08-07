import 'package:flutter/material.dart';
import 'package:quransenja/utils/constants/images_string.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Image.asset(QSImages.logoQuranSenja),
            Text("Qur'an Senja"),
            Text("Sahabat Terbaik Menjelang Senja"),
          ],
        ),
      ),
    );
  }
}
