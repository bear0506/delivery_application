import 'package:get/get.dart';

import 'package:delivery_service/app/controller/address/address_controller.dart';

class AddressBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(AddressController());
  }
}
