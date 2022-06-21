import 'package:get/get.dart';

import 'package:delivery_service/app/controller/map/map_controller.dart';

class MapBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(MapController());
  }
}
