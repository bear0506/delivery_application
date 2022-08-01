import 'package:get/get.dart';

import 'package:delivery_service/app/controller/order/order_controller.dart';

class OrderBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(OrderController());
  }
}
