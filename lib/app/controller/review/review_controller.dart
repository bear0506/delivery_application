import 'dart:convert';
import 'dart:io';

import 'package:delivery_service/app/data/model/review/review_model.dart';
import 'package:delivery_service/main.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:delivery_service/app/data/provider/review/review_provider.dart';

enum Sort {
  latest,
  higher,
  lower,
}

class ReviewController extends GetxController with GetTickerProviderStateMixin {
  // 스켈레톤(쉬머)
  // RxBool isLoaderVisible = false.obs;
  RxInt defaultRatingStar = 5.obs;

  RxDouble ratingValue = 0.0.obs;

  Rx<ScrollController> scrollController = ScrollController().obs;
  Rx<TextEditingController> textEditingController = TextEditingController().obs;

  RxBool temp = true.obs;

  Rx<Sort> sort = Sort.latest.obs;
  RxBool photoRiviewCheck = false.obs;

  // 이미지
  RxList imageList = [].obs;
  final ImagePicker picker = ImagePicker();

  // 리퀘스트 모델(데이터 넘기기)
  Rx<ReviewAddRequestModel> reviewAddRequestModel = ReviewAddRequestModel(
    storeIdx: 0,
    score: 0.0,
    photos: [],
    comment: "",
  ).obs;

  void handleReviewAddRequestModel({
    required int storeIdx,
    required double score,
    required dynamic photos,
    required String comment,
  }) {
    reviewAddRequestModel.update((_) {
      _?.storeIdx = storeIdx;
      _?.score = score;
      _?.photos = photos;
      _?.comment = comment;
    });
  }

  void handleChangeSort(selectedValue) {
    sort.value = selectedValue;
  }

  // 이미지 선택시
  Future<void> handleSelectImage() async {
    final XFile? selectedImages =
        await picker.pickImage(source: ImageSource.gallery);

    if (selectedImages != null) {
      imageList.add({
        "type": "local",
        "path": selectedImages.path,
        "base64": handleBase64Format(selectedImages.path)
      });
    }
  }

  // Base64 변환
  String handleBase64Format(String path) {
    File file = File(path);
    List<int> fileInByte = file.readAsBytesSync();
    return base64Encode(fileInByte);
  }

  void handleDeleteImage(int index) {
    imageList.removeAt(index);
  }

  // 리뷰 작성
  Future<void> handleReviewAddProvider() async {
    handleReviewAddRequestModel(
      storeIdx: int.parse(Get.parameters["storeIdx"]!),
      score: ratingValue.value,
      photos: imageList,
      comment: textEditingController.value.text,
    );

    var previousRoute = Get.previousRoute;

    try {
      await ReviewAddProvider()
          .dio(requestModel: reviewAddRequestModel)
          .then((value) async {
        if (value.status == "success") {
          print("리뷰 작성 성공!");

          Get.dialog(
            AlertDialog(
              content: SizedBox(
                width: 800.w,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "리뷰 작성이 완료되었습니다.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        // color: const Color(0xFFB8B8B8),
                        fontSize: 60.sp,
                        fontFamily: 'Core_Gothic_D5',
                      ),
                    ),
                  ],
                ),
              ),
              contentPadding: EdgeInsets.only(
                  left: 80.w, right: 80.w, top: 80.h, bottom: 50.h),
              actions: [
                TextButton(
                  child: Text(
                    "확인",
                    style: TextStyle(
                      color: const Color(0xFFFF8800),
                      fontSize: 60.sp,
                      fontFamily: 'Core_Gothic_D5',
                    ),
                  ),
                  onPressed: () {
                    // Get.back();
                    Get.until((route) => Get.currentRoute == previousRoute);
                  },
                )
              ],
              actionsAlignment: MainAxisAlignment.center,
              actionsPadding: EdgeInsets.zero,
            ),
          );
        } else {
          print("리뷰 작성 실패!");

          Get.dialog(
            AlertDialog(
              content: SizedBox(
                width: 800.w,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "리뷰 작성에 실패하였습니다.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        // color: const Color(0xFFB8B8B8),
                        fontSize: 60.sp,
                        fontFamily: 'Core_Gothic_D5',
                      ),
                    ),
                  ],
                ),
              ),
              contentPadding: EdgeInsets.only(
                  left: 80.w, right: 80.w, top: 80.h, bottom: 50.h),
              actions: [
                TextButton(
                  child: Text(
                    "확인",
                    style: TextStyle(
                      color: const Color(0xFFFF8800),
                      fontSize: 60.sp,
                      fontFamily: 'Core_Gothic_D5',
                    ),
                  ),
                  onPressed: () {
                    Get.back();
                  },
                )
              ],
              actionsAlignment: MainAxisAlignment.center,
              actionsPadding: EdgeInsets.zero,
            ),
          );
        }
      });
    } catch (e) {
      logger.d(e);
    } finally {
      // isLoaderVisible.value = true;
    }
  }

  @override
  // ignore: unnecessary_overrides
  void onReady() {
    sort.value = Sort.latest;

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
