import 'package:get/get.dart';

import 'package:delivery_service/app/controller/setting/setting_controller.dart';

class SettingBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(SettingController());
  }
}
