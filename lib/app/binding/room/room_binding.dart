import 'package:get/get.dart';

import 'package:delivery_service/app/controller/room/room_controller.dart';

class RoomBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(RoomController());
  }
}
