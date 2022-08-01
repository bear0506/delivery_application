import 'package:get/get.dart';

import 'package:delivery_service/app/controller/mypage/mypage_favorites_controller.dart';

class MyPageFavoritesBinding implements Bindings {
  @override
  void dependencies() =>
      Get.lazyPut<MyPageFavoritesController>(() => MyPageFavoritesController(),
          fenix: true);
}
