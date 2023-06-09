import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:delivery_service/app/controller/review/review_controller.dart';

class ReviewWriteUi extends GetView<ReviewController> {
  const ReviewWriteUi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            alignment: Alignment.center,
            icon: Image.asset(
              "assets/icons/back.png",
              color: const Color(0xFF333333),
              width: 80.w,
              height: 60.h,
            ),
            onPressed: () => Get.back(),
          ),
          title: Text(
            "리뷰작성",
            textAlign: TextAlign.start,
            style: TextStyle(
              color: const Color(0xFF333333),
              fontSize: 70.sp,
              fontFamily: 'Core_Gothic_D6',
              fontWeight: FontWeight.bold,
            ),
          ),
          elevation: 0,
        ),
        body: Theme(
          data: Theme.of(context).copyWith(
            dividerColor: Colors.transparent,
            colorScheme: ColorScheme.fromSwatch(
              accentColor: Colors.transparent,
            ),
          ),
          child: NotificationListener<OverscrollIndicatorNotification>(
            onNotification: (OverscrollIndicatorNotification? overscroll) {
              overscroll!.disallowIndicator();
              return true;
            },
            child: SafeArea(
              child: ReviewWriteContentWidget(),
              // child: controller.isLoaderVisible.value == false
              //     ? const ReviewWriteContentShimmerWidget()
              //     : ReviewWriteContentWidget(),
            ),
          ),
        ),
        bottomNavigationBar: const BottomOutlinedButtonWidget(),
      ),
    );
  }
}

class ReviewWriteContentWidget extends GetView<ReviewController> {
  ReviewWriteContentWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Obx(
        () => SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 100.w,
                  vertical: 110.h,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "당신의 점수는?",
                      style: TextStyle(
                        color: const Color(0xFF333333),
                        fontSize: 55.sp,
                        fontFamily: 'Core_Gothic_D5',
                      ),
                    ),
                    RatingBar(
                      glow: false,
                      initialRating: 0,
                      direction: Axis.horizontal,
                      allowHalfRating: false,
                      itemSize: 30,
                      itemCount: 5,
                      ratingWidget: RatingWidget(
                        full: Image.asset("assets/icons/star_full.png"),
                        half: Image.asset("assets/icons/star_half.png"),
                        empty: Image.asset("assets/icons/star.png"),
                      ),
                      itemPadding: EdgeInsets.symmetric(horizontal: 15.w),
                      onRatingUpdate: (value) {
                        controller.ratingValue.value = value;
                      },
                      wrapAlignment: WrapAlignment.center,
                    ),
                    Text(
                      "${controller.ratingValue.value}",
                      style: TextStyle(
                        color: const Color(0xFF333333),
                        fontSize: 100.sp,
                        fontFamily: 'Core_Gothic_D6',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                color: Color(0xFFECECEC),
                height: 4.h,
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 100.w,
                  top: 80.h,
                  bottom: 85.h,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        controller.handleSelectImage();
                      },
                      child: Container(
                        color: const Color(0xFFF1F1F1),
                        width: 400.w,
                        height: 400.h,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/icons/picture_plus.png",
                              scale: 2.5,
                            ),
                            SizedBox(
                              height: 30.h,
                            ),
                            Text(
                              "사진 추가",
                              style: TextStyle(
                                color: const Color(0xFFB8B8B8),
                                fontSize: 40.sp,
                                fontFamily: 'Core_Gothic_D4',
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 50.w),
                    Expanded(
                      child: SizedBox(
                        height: 312.h,
                        child: ListView.builder(
                          physics: const ClampingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: controller.imageList.length,
                          itemBuilder: (context, index) => Container(
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 30.w),
                              child: InkWell(
                                onTap: () {
                                  controller.handleDeleteImage(index);
                                },
                                child: Container(
                                  width: 312.w,
                                  height: 312.h,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFF1F1F1),
                                    image: DecorationImage(
                                      image: Image.memory(base64Decode(
                                              controller.imageList[index]
                                                  ["base64"]))
                                          .image,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 1240.w,
                height: 600.h,
                child: TextField(
                  controller: controller.textEditingController.value,
                  keyboardType: TextInputType.multiline,
                  maxLines: 10,
                  style: TextStyle(
                    color: const Color(0xFF333333),
                    fontSize: 40.sp,
                    fontFamily: 'Core_Gothic_D4',
                    fontWeight: FontWeight.bold,
                  ),
                  decoration: InputDecoration(
                    hintText: "이 음식점은 당신에게 어떤 추억을 남겨주었나요? 당신의 경험을 알려주세요.",
                    hintStyle: TextStyle(
                      color: const Color(0xFFB8B8B8),
                      fontSize: 40.sp,
                      fontFamily: 'Core_Gothic_D4',
                      fontWeight: FontWeight.bold,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 1.w,
                        color: const Color(0xFF707070),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}

class BottomOutlinedButtonWidget extends GetView<ReviewController> {
  const BottomOutlinedButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: 150.h,
        left: 100.w,
        right: 100.w,
      ),
      child: SizedBox(
        width: 1240.w,
        height: 200.h,
        child: OutlinedButton(
          onPressed: () {
            controller.handleReviewAddProvider();
          },
          style: OutlinedButton.styleFrom(
            side: const BorderSide(color: Color(0xFFFF8800), width: 1),
            backgroundColor: const Color(0xFFFF8800),
            primary: Colors.white,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(
                  50,
                ),
              ),
            ),
            elevation: 2,
            shadowColor: Colors.black,
          ),
          child: Text(
            "리뷰 등록",
            style: TextStyle(
              color: Colors.white,
              fontSize: 70.sp,
              fontFamily: 'Core_Gothic_D5',
            ),
          ),
        ),
      ),
    );
  }
}

class ReviewWriteContentShimmerWidget extends GetView<ReviewController> {
  const ReviewWriteContentShimmerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [],
      ),
    );
  }
}
