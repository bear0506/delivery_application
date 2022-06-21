import 'package:get/get.dart';

import 'package:delivery_service/app/controller/signin/signin_controller.dart';

class SignInBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(SignInController());
  }
}
