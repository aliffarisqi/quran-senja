import 'package:get/get.dart';

import '../../../shared/controllers/app_data_controller.dart';
import '../../../shared/models/surah_model.dart';

/// Controller for the home screen (Beranda).
///
/// This controller provides a clean interface to access the Surah list
/// that is already loaded and managed by the [AppDataController].
class BerandaController extends GetxController {
  // Static getter to easily access the controller instance.
  static BerandaController get instance => Get.find();

  /// A getter that retrieves the list of Surahs from the global data controller.
  ///
  /// This provides a convenient way for the home screen to access the data
  /// without needing to reference the [AppDataController] directly.
  List<SurahModel> get surahList => AppDataController.instance.surahList;
}
