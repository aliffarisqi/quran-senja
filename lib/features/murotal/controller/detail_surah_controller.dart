import 'dart:async';

import 'package:get/get.dart';

import '../../../features/murotal/model/detail_surah_model.dart';
import '../../../features/murotal/controller/murotal_playback_controller.dart';
import '../../../services/api/surah_service.dart';
import '../../../services/network/api_result.dart';
import '../../../shared/controllers/app_data_controller.dart';

/// A GetX controller for managing the details of a specific Surah.
///
/// This controller handles fetching Surah data from an API, managing the
/// loading state, and integrating the fetched data with the playback controller.
class DetailSurahController extends GetxController {
  // Static getter to easily access the controller instance.
  static DetailSurahController get instance => Get.find();

  // Service to handle API calls for Surah details.
  final SurahService _surahDetailService = SurahService();

  // Reactive boolean to track the loading state.
  final RxBool isLoading = false.obs;

  // Reactive nullable variable to hold the Surah detail data.
  final Rxn<DetailSurahResponse> _detailSurah = Rxn<DetailSurahResponse>();

  /// Provides read-only access to the detail Surah response.
  DetailSurahResponse? get detailSurah => _detailSurah.value;

  /// Fetches the details of a Surah from the API.
  ///
  /// - `nomor`: The number of the Surah to fetch.
  Future<void> getSurahDetail(int nomor) async {
    isLoading.value = true;
    try {
      final result = await _surahDetailService.getDetailSurah(nomor);

      switch (result) {
        // Case for a successful API call.
        case ApiSuccess<DetailSurahResponse>(data: final data):
          _detailSurah.value = data;

          // Load the list of all Surahs and the current Surah's position
          // into the playback controller to enable continuous playback.
          final allSurah = AppDataController.instance.surahList;
          final currentIndex = allSurah.indexWhere((s) => s.nomor == data.nomor);

          if (currentIndex != -1) {
            SurahPlaybackController.instance.loadSurahList(allSurah, currentIndex);
          }
          break;

        // Case for a failed API call.
        case ApiError():
          Get.snackbar('Mohon Maaf', 'Gagal mengambil detail surah');
          break;
      }
    } catch (e) {
      // Catch any unexpected errors during the process.
      Get.snackbar('Mohon Maaf', 'Terjadi Kesalahan tidak terduga');
    } finally {
      // Always set isLoading to false after the operation is complete.
      isLoading.value = false;
    }
  }
}
