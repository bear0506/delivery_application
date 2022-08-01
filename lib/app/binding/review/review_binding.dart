import 'package:get/get.dart';

import 'package:delivery_service/app/controller/review/review_controller.dart';

class ReviewBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ReviewController());
  }
}
