import 'package:get/get.dart';

import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';

class ReviewController extends GetxController with GetTickerProviderStateMixin {
  late Rx<dynamic> storeIdx = Get.parameters["storeIdx"].obs;
  // 스켈레톤(쉬머)
  RxBool isLoaderVisible = true.obs;

  RxInt defaultRatingStar = 5.obs;

  RxDouble ratingValue = 0.0.obs;

  Rx<ScrollController> scrollController = ScrollController().obs;
  Rx<TextEditingController> textEditingController = TextEditingController().obs;

  RxBool temp = true.obs;

  void getGalleryImage() {
    var image = ImagePicker.platform.pickImage(source: ImageSource.gallery);
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
    Get.delete<ReviewController>();

    super.dispose();
  }

  @override
  // ignore: unnecessary_overrides
  InternalFinalCallback<void> get onStart => super.onStart;

  @override
  // ignore: unnecessary_overrides
  InternalFinalCallback<void> get onDelete => super.onDelete;
}
