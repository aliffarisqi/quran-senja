import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';
import '../../../../utils/helpers/device_utility.dart';
import '../../controller/search_controller.dart';

/// A custom app bar widget for search functionality.
///
/// This widget implements [PreferredSizeWidget] to be used directly as an
/// app bar. It includes a back button, a dynamic search text field, and a
/// separator line at the bottom.
class QSAppBarSearch extends StatelessWidget implements PreferredSizeWidget {
  const QSAppBarSearch({
    super.key,
    required this.searchController,
  });

  /// The controller to manage the search state and logic.
  final QSSearchController searchController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: QSSizes.spacingMd),
      child: AppBar(
        // Leading icon button to navigate back.
        leadingWidth: 42,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(
            CupertinoIcons.chevron_left,
            color: QSColors.primaryMedium,
          ),
        ),
        backgroundColor: QSColors.white,
        automaticallyImplyLeading: false,
        titleSpacing: 0,
        // The title contains the search text field.
        title: Padding(
          padding: const EdgeInsets.only(right: QSSizes.spacingMd),
          // Obx makes the TextField reactive to controller changes.
          child: Obx(
            () => TextField(
              controller: searchController.searchTextController,
              autofocus: true,
              focusNode: searchController.searchFocusNode,
              decoration: InputDecoration(
                hintText: QSTexts.searchPlaceHolder,
                contentPadding: const EdgeInsets.all(0),
                prefixIcon: const Icon(IconsaxPlusLinear.search_normal),
                // Conditionally shows a close button if the user is typing.
                suffixIcon: searchController.isTyping.value
                    ? IconButton(
                        icon: const Icon(
                          IconsaxPlusBold.close_circle,
                          color: QSColors.primaryMedium,
                        ),
                        onPressed: searchController.clearSearch,
                      )
                    : const SizedBox.shrink(),
              ),
              onSubmitted: searchController.searchSurah,
            ),
          ),
        ),
        centerTitle: true,
        // A custom widget at the bottom of the app bar to create a separator line.
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0),
          child: Container(
            color: QSColors.borderPrimary,
            height: 1.0,
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(QSDeviceUtils.getAppBarHeight() + 16);
}
