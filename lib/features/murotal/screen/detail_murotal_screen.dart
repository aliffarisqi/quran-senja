import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:quransenja/common/widget/shape/app_spacing.dart';
import 'package:quransenja/utils/constants/sizes.dart';

import '../../../common/widget/animation/shimmer.dart';
import '../../../common/widget/appbar/appbar.dart';
import '../controller/detail_surah_controller.dart';
import 'widget/card_thumbnail_murotal.dart';
import 'widget/playback_controll.dart';

/// A screen that displays the details of a specific Surah and its playback controls.
///
/// This screen fetches Surah details from an API and displays a shimmer effect
/// while the data is being loaded. Since the controller is already initialized in AppBinding,
/// this page will use `Get.find()` to access it.
class DetailMurotalScreen extends StatefulWidget {
  const DetailMurotalScreen({
    super.key,
    required this.surahNumber,
  });

  /// The number of the Surah to be displayed.
  final int surahNumber;

  @override
  State<DetailMurotalScreen> createState() => _DetailMurotalScreenState();
}

class _DetailMurotalScreenState extends State<DetailMurotalScreen> {
  // Accessing the controller instance created via AppBinding.
  // There is no need to use Get.put() as the controller is already in memory.
  final detailSurahController = DetailSurahController.instance;

  @override
  void initState() {
    super.initState();
    // Calling the API to get Surah details when the page is first initialized.
    detailSurahController.getSurahDetail(widget.surahNumber);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const QSAppBar(
        showBackArrow: true,
        title: "Qur'an Senja",
        isTitleCentered: true,
      ),
      body: _body(context),
    );
  }

  /// Builds the body of the page that changes dynamically based on
  /// the loading status of the controller.
  Widget _body(BuildContext context) {
    return Obx(
      // Using Obx to reactively listen for changes in isLoading.
      () => detailSurahController.isLoading.value
          ? _shimmerLoading()
          : Stack(
              children: [
                // Displays the Surah thumbnail and details.
                CardThumbnailMurotal(),
                // Displays the audio playback controls.
                PlaybackControll()
              ],
            ),
    );
  }

  /// Builds the shimmer loading effect while data is being fetched.
  Widget _shimmerLoading() {
    return const Padding(
      padding: EdgeInsets.all(QSSizes.spacingLg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          QSShimmerEffect(
            width: double.infinity,
            height: 200,
          ),
          QSAppSpacing.verticalMd,
          QSShimmerEffect(width: 100, height: 30),
          QSAppSpacing.verticalMd,
          QSShimmerEffect(width: 200, height: 30),
        ],
      ),
    );
  }
}
