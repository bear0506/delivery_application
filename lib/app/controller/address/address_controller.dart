import 'package:delivery_service/app/data/model/main/main_model.dart';
import 'package:delivery_service/main.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'package:delivery_service/app/data/provider/main/main_provider.dart';

class AddressController extends GetxController {
  Rx<ScrollController> scrollController = ScrollController().obs;

  RxString temp = "주소 설정".obs;
  RxString temp2 = "상세 주소 입력".obs;

  @override
  // ignore: unnecessary_overrides
  void onInit() async {
    super.onInit();
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
  InternalFinalCallback<void> get onStart => super.onStart;

  @override
  // ignore: unnecessary_overrides
  InternalFinalCallback<void> get onDelete => super.onDelete;
}
