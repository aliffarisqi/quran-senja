import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/widget/appbar/appbar.dart';
import '../../../common/widget/card/card_empty.dart';
import '../../../common/widget/card/card_surah.dart';
import '../../../common/widget/shape/app_spacing.dart';
import '../../../common/widget/shape/search_container.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/constants/text_strings.dart';
import '../../search/screen/search_screen.dart';
import '../controller/beranda_controller.dart';
import 'widget/delegate/search_bar_delegate.dart';
import 'widget/header_beranda.dart';

/// The main screen for the home page (Beranda).
///
/// This screen displays a custom scroll view with a header, a sticky search bar,
/// and a list of all Surahs.
class BerandaScreen extends StatelessWidget {
  const BerandaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the instance of the home screen controller.
    final BerandaController berandaController = BerandaController.instance;

    return Scaffold(
      // Set the background color.
      backgroundColor: QSColors.white,
      // The app bar for the screen.
      appBar: _appBar(),
      // The main body of the screen, using a CustomScrollView.
      body: _body(context, berandaController),
    );
  }

  /// Builds the main body of the screen using a CustomScrollView.
  ///
  /// This method organizes the UI into different slivers, including the header,
  /// search bar, and the list of Surahs.
  CustomScrollView _body(BuildContext context, BerandaController berandaController) {
    return CustomScrollView(
      slivers: [
        // A non-scrolling widget for the header.
        _header(),
        // A vertical space.
        SliverToBoxAdapter(child: QSAppSpacing.verticalSm),
        // The sticky search bar.
        _search(),
        // A vertical space.
        SliverToBoxAdapter(child: QSAppSpacing.verticalLg),
        // The list of Surahs.
        Obx(
          () => berandaController.surahList.isEmpty ? _emptyData() : _listSurah(berandaController),
        ),
      ],
    );
  }

  /// Builds the custom app bar for the screen.
  QSAppBar _appBar() {
    return const QSAppBar(
      showBackArrow: false,
      backgroundColor: QSColors.white,
      isHide: true,
    );
  }

  /// Build empty card when list of surah is empty
  SliverToBoxAdapter _emptyData() {
    return const SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.all(QSSizes.spacingMd),
        child: QSCardEmpty(
          title: "Tidak Ada Data Surah",
        ),
      ),
    );
  }

  /// Builds the home screen header widget.
  SliverToBoxAdapter _header() => const SliverToBoxAdapter(child: HeaderBeranda());

  /// Builds the sticky search bar.
  SliverPersistentHeader _search() {
    return SliverPersistentHeader(
      // Pins the header to the top when scrolling.
      pinned: true,
      delegate: QSSearchBarDelegate(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: QSSizes.spacingLg),
          child: QSSearchContainer(
            showBorder: false,
            text: QSTexts.searchPlaceHolder,
            // The onTap function to search screen.
            onTap: () => Get.to(() => const SearchScreen()),
          ),
        ),
      ),
    );
  }

  /// Builds the list of Surah cards.
  SliverList _listSurah(BerandaController berandaController) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          // Get the Surah model for the current index.
          final surah = berandaController.surahList[index];
          // Return a Surah card widget.
          return CardSurah(surah: surah);
        },
        // The total number of Surahs to display.
        childCount: berandaController.surahList.length,
      ),
    );
  }
}
