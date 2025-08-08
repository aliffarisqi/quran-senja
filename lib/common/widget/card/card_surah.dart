import 'package:flutter/material.dart';
import 'package:quransenja/utils/extensions/context_extension.dart';

import '../shape/app_spacing.dart';
import '../space/rounded_container.dart';
import '../text/title_text.dart';
import '../../../shared/models/surah_model.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import 'card_ayah.dart';

/// A customizable card widget to display information about a Surah.
///
/// This widget uses a `QSRoundedContainer` to provide a consistent visual
/// style and displays the Surah number, name, meaning, and Arabic name.
class CardSurah extends StatelessWidget {
  const CardSurah({
    super.key,
    required this.surah,
    required this.onTap,
  });

  /// The Surah model containing all the data to be displayed.
  final SurahModel surah;

  /// The callback function ontap to running the logic
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    // The main container for the Surah card with gesture detector
    return GestureDetector(
      // Void callback when click the card
      onTap: onTap,
      child: QSRoundedContainer(
        // Padding for the content inside the card
        padding: const EdgeInsets.all(QSSizes.spacingMd),
        // Margin to create space around the card
        margin: const EdgeInsets.only(
          left: QSSizes.spacingLg,
          right: QSSizes.spacingLg,
          bottom: QSSizes.spacingMd,
        ),
        // Applies a large border radius for rounded corners
        radius: QSSizes.cardRadiusLg,
        // Displays a light primary border
        showBorder: true,
        borderColor: QSColors.primaryLight,
        // Displays a subtle shadow
        hasShadow: true,
        // Fixed height for consistency
        height: 100,
        child: Row(
          // Aligns children vertically in the center
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Column for displaying the Surah number and its frame
            QSAyahCard(nomorAyah: surah.nomor),
            // Horizontal spacing between the number column and the text content
            QSAppSpacing.horizontalMd,
            // Expanded widget to take up the remaining space for the text
            Expanded(
              child: Column(
                // Aligns text to the start (left)
                crossAxisAlignment: CrossAxisAlignment.start,
                // Aligns children vertically in the center
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Surah name in Latin using a custom text title widget
                  QSTextTitle(text: surah.namaLatin),
                  // Surah meaning text with a body style
                  Text(
                    surah.arti,
                    style: context.textTheme.bodyMedium,
                    maxLines: 1, // Restricts text to a single line
                    overflow: TextOverflow.ellipsis, // Adds "..." if text is too long
                  ),
                  // total ayah
                  Text(
                    "${surah.tempatTurun} (${surah.jumlahAyat} Ayat)",
                    style: context.textTheme.labelMedium?.copyWith(color: QSColors.primary),
                  ),
                ],
              ),
            ),
            // Surah name in Arabic with a title style
            Text(
              surah.nama,
              style: context.textTheme.headlineSmall,
            ),
          ],
        ),
      ),
    );
  }
}
