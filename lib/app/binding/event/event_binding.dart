import 'package:get/get.dart';

import 'package:delivery_service/app/controller/event/event_controller.dart';

class EventBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(EventController());
  }
}
