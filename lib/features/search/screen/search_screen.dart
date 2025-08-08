import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/widget/animation/image_title_sub_title.dart';
import '../../../common/widget/card/card_surah.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/images_string.dart';
import '../../../utils/constants/sizes.dart';
import '../../murotal/screen/detail_murotal_screen.dart';
import '../controller/search_controller.dart';
import 'widget/appbar_search.dart';

/// The screen dedicated to the search functionality.
///
/// This screen displays a search app bar and dynamically changes its body
/// based on the user's search input and results.
class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the instance of the search controller.
    final QSSearchController searchController = QSSearchController.instance;

    return Scaffold(
      backgroundColor: QSColors.white,
      // The custom search app bar.
      appBar: QSAppBarSearch(searchController: searchController),
      // The body is wrapped in Obx to reactively update based on the controller's state.
      body: Obx(
        () {
          // Case 1: If there are search results, display them in a list.
          if (searchController.searchResults.isNotEmpty) {
            return _listResult(searchController);
          }
          // Case 2: If the search text is not empty but no results were found,
          // display a "not found" message.
          else if (searchController.searchTextController.text.isNotEmpty) {
            return _notFound(searchController);
          }
          // Case 3: If the search text is empty, display a "start searching" message.
          else {
            return _findStart();
          }
        },
      ),
    );
  }

  /// Builds the list of search results.
  Widget _listResult(QSSearchController controller) {
    final results = controller.searchResults;
    return ListView.builder(
      padding: const EdgeInsets.only(top: QSSizes.spacingLg),
      itemCount: results.length,
      itemBuilder: (_, i) => CardSurah(
        surah: results[i],
        onTap: () => Get.to(() => DetailMurotalScreen(surahNumber: results[i].nomor)),
      ),
    );
  }

  /// Builds the "not found" message for when no results match the search query.
  Widget _notFound(QSSearchController controller) {
    return QSIconImageTitleSubTitle(
      imagePath: QSImages.notFound,
      title: '"${controller.searchTextController.text}" Tidak Ditemukan',
      subTitle: "Coba cari lagi dengan keyword nama surah, arti atau tempat di turunkannya",
    );
  }

  /// Builds the initial "start searching" message when the search bar is empty.
  Widget _findStart() {
    return const QSIconImageTitleSubTitle(
      imagePath: QSImages.logoQuranSenja,
      title: "Cari Surah Pilihan",
      subTitle: "Bersama Qur'an Senja dengarkan murotal dari semua surah di Al-Qur'an",
    );
  }
}
