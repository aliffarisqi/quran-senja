import 'package:get/get.dart';

import '../models/surah_model.dart';

/// A global controller to manage application-wide data.
///
/// This controller stores and provides access to the list of all Surahs,
/// making it a centralized source of truth for the application's core data.
class AppDataController extends GetxController {
  // Static getter to easily access the controller instance.
  static AppDataController get instance => Get.find();

  // An RxList to hold the Surah data.
  // The `.obs` makes it observable, allowing widgets to react to changes.
  final RxList<SurahModel> _surahList = <SurahModel>[].obs;

  // Getter
  /// Provides read-only access to the list of Surahs.
  ///
  /// Widgets can use this getter to retrieve the data.
  List<SurahModel> get surahList => _surahList;

  // Setter
  /// Updates the Surah list with a new list of Surah models.
  ///
  /// The `assignAll` method efficiently replaces all existing items with
  /// the new ones, triggering a UI update for any listening widgets.
  void setSurahList(List<SurahModel> value) {
    _surahList.assignAll(value);
  }
}
