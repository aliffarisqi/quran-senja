import 'package:get/get.dart';

import '../features/beranda/controller/beranda_controller.dart';
import '../features/splash/controller/splash_screen_controller.dart';
import '../navigation_menu.dart';
import '../shared/controllers/app_data_controller.dart';

class QSAppBinding extends Bindings {
  @override
  void dependencies() {
    // Global Controller
    Get.lazyPut(() => AppDataController(), fenix: true);

    // Spesific Controller
    // Splash
    Get.lazyPut(() => SplashScreenController(), fenix: true);

    //Menu
    Get.lazyPut(() => NavigationController(), fenix: true);
    Get.lazyPut(() => BerandaController(), fenix: true);
  }
}
