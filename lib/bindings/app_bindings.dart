import 'package:get/get.dart';
import 'package:quransenja/features/splash/controller/splash_screen_controller.dart';

class QSAppBinding extends Bindings {
  @override
  void dependencies() {
    // Controller
    // Splash
    Get.lazyPut(() => SplashScreenController(), fenix: true);
  }
}
