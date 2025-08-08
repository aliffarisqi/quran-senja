import 'package:get/get.dart';

import '../features/beranda/controller/beranda_controller.dart';
import '../features/search/controller/search_controller.dart';
import '../features/splash/controller/splash_screen_controller.dart';
import '../navigation_menu.dart';
import '../shared/controllers/app_data_controller.dart';

/// A class that manages dependency injection for the entire application.
///
/// This binding is used to register controllers and services with GetX,
/// ensuring they are available globally throughout the app when needed.
class QSAppBinding extends Bindings {
  @override
  void dependencies() {
    // Registering global controllers that are needed across the application.
    // 'fenix: true' keeps the controller alive in memory even if it's not
    // actively being used, which is useful for data that needs to persist.
    Get.lazyPut(() => AppDataController(), fenix: true);

    // Registering specific controllers for different features.

    // Splash screen controller.
    Get.lazyPut(() => SplashScreenController());

    // Navigation and home screen controllers.
    Get.lazyPut(() => NavigationController(), fenix: true);
    Get.lazyPut(() => BerandaController(), fenix: true);

    // Search screen controller.
    Get.lazyPut(() => QSSearchController(), fenix: true);
  }
}
