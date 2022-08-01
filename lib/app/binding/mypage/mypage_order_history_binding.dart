import 'package:get/get.dart';

import 'package:delivery_service/app/controller/mypage/mypage_order_history_controller.dart';

class MyPageOrderHistoryBinding implements Bindings {
  @override
  void dependencies() => Get.lazyPut<MyPageOrderHistoryController>(
      () => MyPageOrderHistoryController(),
      fenix: true);
}
