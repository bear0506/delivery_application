import 'package:get/get.dart';

import 'package:delivery_service/app/controller/store/store_controller.dart';

class StoreBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(StoreController());
  }
}
