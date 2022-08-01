import 'package:get/get.dart';

import 'package:flutter/material.dart';

class OrderController extends GetxController with GetTickerProviderStateMixin {
  late Rx<dynamic> storeIdx = Get.parameters["storeIdx"].obs;

  Rx<ScrollController> scrollController = ScrollController().obs;

  RxBool temp = true.obs;

  @override
  // ignore: unnecessary_overrides
  void onReady() {
    super.onReady();
  }

  @override
  // ignore: unnecessary_overrides
  void onClose() {
    super.onClose();
  }

  @override
  // ignore: unnecessary_overrides
  void dispose() {
    Get.delete<OrderController>();

    super.dispose();
  }

  @override
  // ignore: unnecessary_overrides
  InternalFinalCallback<void> get onStart => super.onStart;

  @override
  // ignore: unnecessary_overrides
  InternalFinalCallback<void> get onDelete => super.onDelete;
}
