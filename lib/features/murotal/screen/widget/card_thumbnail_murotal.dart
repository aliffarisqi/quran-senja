import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:quransenja/utils/extensions/context_extension.dart';

import '../../../../common/widget/card/card_ayah.dart';
import '../../../../common/widget/shape/app_spacing.dart';
import '../../../../common/widget/space/rounded_container.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/images_string.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../controller/murotal_playback_controller.dart';

/// A card widget to display a Surah's thumbnail, name, and key details.
///
/// This component is designed to show essential information for a Surah,
/// including its number, place of revelation, name, meaning, and number of verses.
class CardThumbnailMurotal extends StatelessWidget {
  const CardThumbnailMurotal({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final playbackController = SurahPlaybackController.instance;

    // The entire content is wrapped in Obx to reactively respond to changes
    // in currentSurah from the controller.
    return Obx(() {
      final surah = playbackController.currentSurah;

      // Only build the card if the surah data is available.
      // This prevents runtime errors from accessing a null value.
      if (surah == null) {
        return const SizedBox.shrink(); // Return an empty widget if data is not yet loaded.
      }

      return Padding(
        padding: const EdgeInsets.all(QSSizes.spacingLg),
        child: QSRoundedContainer(
          backgroundColor: QSColors.white,
          showBorder: true,
          borderColor: QSColors.primaryLight,
          hasShadow: true,
          padding: const EdgeInsets.all(QSSizes.spacingLg),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Displays the Ayah number using the custom card widget.
              QSAyahCard(nomorAyah: surah.nomor),
              // Conditionally displays the Mecca or Medina image based on the Surah's place of revelation.
              Image.asset(
                surah.tempatTurun == "madinah" ? QSImages.medina : QSImages.mecca,
                width: QSHelperFunctions.screenWidth() / 2,
              ),
              QSAppSpacing.verticalLg,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  // Left column: Surah name and meaning.
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          surah.namaLatin,
                          style: context.textTheme.headlineLarge,
                        ),
                        Text(
                          "${surah.arti} - ${surah.tempatTurun}",
                          style: context.textTheme.titleSmall,
                        ),
                      ],
                    ),
                  ),
                  // Right column: Surah Arabic name and number of verses.
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        surah.nama,
                        style: context.textTheme.titleSmall,
                      ),
                      Text(
                        "${surah.jumlahAyat.toString()} Ayat",
                        style: context.textTheme.titleLarge?.copyWith(
                          color: QSColors.primaryMedium,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    });
  }
}
