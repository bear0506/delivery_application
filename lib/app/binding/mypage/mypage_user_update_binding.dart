import 'package:get/get.dart';

import 'package:delivery_service/app/controller/mypage/mypage_user_update_controller.dart';

class MyPageUserEditBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(MyPageUserUpdateController());
  }
}
