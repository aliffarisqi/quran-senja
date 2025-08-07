import 'package:get/get.dart';
import 'package:quransenja/shared/controllers/app_data_controller.dart';

import '../features/splash/controller/splash_screen_controller.dart';
import '../navigation_menu.dart';

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
  }
}
