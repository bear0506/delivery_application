import 'package:get/get.dart';

import 'package:delivery_service/app/controller/splash/splash_controller.dart';

class SplashBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(SplashController());
  }
}
