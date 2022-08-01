import 'package:get/get.dart';

import 'package:delivery_service/app/controller/mypage/mypage_controller.dart';

class MyPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(MyPageController());
  }
}
