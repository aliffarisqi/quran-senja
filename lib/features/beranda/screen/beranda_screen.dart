import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/text_strings.dart';

class BerandaScreen extends StatelessWidget {
  const BerandaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      backgroundColor: QSColors.white,
    );
  }

  AppBar appBar() {
    return AppBar(
      title: Text(QSTexts.beranda),
      backgroundColor: QSColors.primaryLight,
    );
  }
}
