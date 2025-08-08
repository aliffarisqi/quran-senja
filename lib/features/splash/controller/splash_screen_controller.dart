import 'dart:async';

import 'package:get/get.dart';

import '../../../navigation_menu.dart';
import '../../../services/api/surah_service.dart';
import '../../../services/network/api_result.dart';
import '../../../shared/controllers/app_data_controller.dart';
import '../../../shared/models/surah_model.dart';

/// Controller for managing the splash screen logic.
///
/// This controller is responsible for loading essential data (Surah list)
/// from the API and then navigating to the main application menu.
class SplashScreenController extends GetxController {
  // Static getter to easily access the controller instance.
  static SplashScreenController get instance => Get.find();

  // Service to handle API calls for Surah data.
  final SurahService _surahService = SurahService();

  /// Called when the controller is first initialized.
  /// This method triggers the data loading process.
  @override
  void onInit() {
    super.onInit();
    loadData();
  }

  /// Loads the Surah list from the API.
  ///
  /// This asynchronous method attempts to fetch the Surah list. On success,
  /// it stores the data and navigates to the main menu. On failure, it
  /// still navigates to the main menu and shows an error snackbar.
  Future<void> loadData() async {
    try {
      // Attempt to get the Surah list from the API service.
      final result = await _surahService.getSurahList();

      // Check if the API call was successful and data is available.
      if (result is ApiSuccess<List<SurahModel>>) {
        // Store the fetched Surah list in the global data controller.
        AppDataController.instance.setSurahList(result.data);
      }
    } catch (e) {
      // Catch any exceptions and show a user-friendly snackbar.
      Get.snackbar('Mohon Maaf', 'Gagal mengambil data surah');
    } finally {
      // Ensure navigation always occurs, regardless of success or failure.
      // The `offAll` method removes all previous routes from the stack.
      Get.offAll(() => const NavigationMenu());
    }
  }
}
