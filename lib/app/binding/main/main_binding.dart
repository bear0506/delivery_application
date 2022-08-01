import 'package:get/get.dart';

import 'package:delivery_service/app/controller/main/main_controller.dart';
import 'package:delivery_service/app/controller/home/home_controller.dart';
import 'package:delivery_service/app/controller/map/map_controller.dart';
import 'package:delivery_service/app/controller/room/room_controller.dart';

class MainBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(MainController());
    Get.put(HomeController());
    Get.put(MapController());
    Get.put(RoomController());
  }
}
