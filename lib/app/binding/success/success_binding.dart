import 'package:get/get.dart';
import 'package:delivery_service/app/controller/success/success_controller.dart';

class SuccessBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SuccessController>(() => SuccessController(), fenix: true);
  }
}
