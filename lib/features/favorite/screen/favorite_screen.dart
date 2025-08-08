import 'package:flutter/material.dart';
import 'package:quransenja/common/widget/animation/image_title_sub_title.dart';
import 'package:quransenja/utils/constants/images_string.dart';

/// A placeholder screen for the "Favorite" feature.
///
/// This screen displays a "Coming Soon" message, informing the user that
/// the functionality is not yet available. It uses a reusable widget to
/// present the message and an image in a clear and centered format.
class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favorite"),
      ),
      body: const Column(
        children: [
          QSIconImageTitleSubTitle(
            imagePath: QSImages.soon,
            title: "Coming Soon",
            subTitle: "This feature is not yet available.",
          )
        ],
      ),
    );
  }
}
