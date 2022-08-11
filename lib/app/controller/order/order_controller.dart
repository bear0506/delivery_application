import 'package:get/get.dart';

import 'package:flutter/material.dart';

import 'package:delivery_service/main.dart';

import 'package:delivery_service/app/data/provider/order/order_provider.dart';
import 'package:delivery_service/app/data/model/order/order_model.dart';

class OrderController extends GetxController with GetTickerProviderStateMixin {
  late Rx<dynamic> storeIdx = Get.parameters["storeIdx"].obs;

  Rx<ScrollController> scrollController = ScrollController().obs;

  RxBool temp = true.obs;

  Rx<Color> tempColor = const Color(0xFFECECEC).obs;

  late RxList<OrderDetailResponseModel> cartMenus =
      <OrderDetailResponseModel>[].obs;

  // 전체 조회
  Future<void> handleCartInitProvider() async {
    try {
      await CartInitProvider().dio().then((value) {
        if (value.status == "success") {
          print("장바구니 조회 성공");

          cartMenus.assignAll(value.orderDetails);
          cartMenus.refresh();
          update();

          print(cartMenus.length);
        } else {
          print("장바구니 조회 실패");
        }
      });
    } catch (e) {
      logger.d(e);
    } finally {
      Future.delayed(
          const Duration(milliseconds: 500),
          // ignore: avoid_print
          () {});
    }
  }

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
