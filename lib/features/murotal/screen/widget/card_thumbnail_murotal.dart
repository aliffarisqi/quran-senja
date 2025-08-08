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
    // We can safely use '!' here because this widget is only built after
    // the data is successfully loaded in the parent screen.
    final playbackController = SurahPlaybackController.instance;

    return Column(
      children: [
        Obx(
          () => Padding(
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
                  QSAyahCard(nomorAyah: playbackController.currentSurah!.nomor),
                  // Conditionally displays the Mecca or Medina image based on the Surah's place of revelation.
                  Image.asset(
                    playbackController.currentSurah!.tempatTurun == "madinah" ? QSImages.medina : QSImages.mecca,
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
                              playbackController.currentSurah!.namaLatin,
                              style: context.textTheme.headlineLarge,
                            ),
                            Text(
                              "${playbackController.currentSurah!.arti} - ${playbackController.currentSurah!.tempatTurun}",
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
                            playbackController.currentSurah!.nama,
                            style: context.textTheme.titleSmall,
                          ),
                          Text(
                            "${playbackController.currentSurah!.jumlahAyat.toString()} Ayat",
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
          ),
        ),
      ],
    );
  }
}
