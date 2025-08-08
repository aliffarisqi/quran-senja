import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../shared/controllers/app_data_controller.dart';
import '../../../shared/models/surah_model.dart';

/// A GetX controller for managing the search functionality.
///
/// This controller handles the search input, performs the search logic,
/// and manages the state of the search results, providing a reactive
/// search experience.
class QSSearchController extends GetxController {
  // Static getter to easily access the controller instance.
  static QSSearchController get instance => Get.find();

  // A reactive list to hold the search results.
  final RxList<SurahModel> _surahListResult = <SurahModel>[].obs;

  // The controller for the search text input field.
  final searchTextController = TextEditingController();

  // The focus node for the search text field.
  final searchFocusNode = FocusNode();

  // A reactive boolean to track if the user is currently typing.
  final RxBool isTyping = false.obs;

  /// Provides read-only access to the search results list.
  List<SurahModel> get searchResults => _surahListResult;

  @override
  void onInit() {
    super.onInit();
    // Adds a listener to the text controller to automatically trigger
    // the search function whenever the text changes.
    searchTextController.addListener(() {
      final keyword = searchTextController.text.trim();
      isTyping.value = keyword.isNotEmpty;
      if (isTyping.value) {
        searchSurah(keyword);
      } else {
        // Clears the results if the search bar is empty.
        _surahListResult.clear();
      }
    });
  }

  /// Clears the search text, results, and resets the focus.
  void clearSearch() {
    searchTextController.clear();
    isTyping.value = false;
    _surahListResult.clear();
    searchFocusNode.requestFocus();
  }

  /// Performs the search operation on the list of Surahs.
  ///
  /// This method normalizes the search keyword and filters the Surah list
  /// based on matches in the name, meaning, or place of revelation.
  void searchSurah(String keyword) {
    final allSurah = AppDataController.instance.surahList;
    final lowerKeyword = _normalize(keyword);

    final results = allSurah.where((surah) {
      final namaLatin = _normalize(surah.namaLatin);
      final arti = _normalize(surah.arti);
      final tempatTurun = _normalize(surah.tempatTurun);

      return namaLatin.contains(lowerKeyword) || arti.contains(lowerKeyword) || tempatTurun.contains(lowerKeyword);
    }).toList();

    _surahListResult.assignAll(results);
  }

  /// A private helper function to normalize a string for searching.
  ///
  /// It converts the string to lowercase and removes all non-alphanumeric
  /// characters to enable a more flexible search.
  String _normalize(String text) {
    return text.toLowerCase().replaceAll(RegExp(r'[^a-zA-Z0-9 ]'), '');
  }
}
