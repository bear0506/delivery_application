import 'package:get/get.dart';

import 'package:delivery_service/app/controller/notice/notice_controller.dart';

class NoticeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(NoticeController());
  }
}
