import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:delivery_service/app/controller/review/review_controller.dart';

class ReviewUi extends GetView<ReviewController> {
  const ReviewUi({Key? key}) : super(key: key);

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
            "리뷰",
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
              child: ReviewContentWidget(),
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

class ReviewContentWidget extends GetView<ReviewController> {
  ReviewContentWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Obx(
        () => SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 100.w,
                  vertical: 80.h,
                ),
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "4.5",
                      style: TextStyle(
                        color: const Color(0xFF333333),
                        fontSize: 100.sp,
                        fontFamily: 'Core_Gothic_D6',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 100.w),
                    SizedBox(
                      width: 600.w,
                      height: 100.h,
                      child: ListView.separated(
                        physics: const ClampingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: 5,
                        itemBuilder: (context, index) => Container(
                          child: Image.asset(
                            "assets/icons/star_full.png",
                            width: 104.w,
                          ),
                        ),
                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(
                            width: 10.w,
                          );
                        },
                      ),
                    ),
                    Expanded(
                      child: Text(
                        "159개",
                        textAlign: TextAlign.end,
                        style: TextStyle(
                          color: const Color(0xFF333333),
                          fontSize: 80.sp,
                          fontFamily: 'Core_Gothic_D5',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                color: Color(0xFFECECEC),
                height: 4.h,
              ),
              SizedBox(height: 50.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      controller.handleChangeSort(Sort.latest);
                    },
                    style: TextButton.styleFrom(
                        // splashFactory: NoSplash.splashFactory,
                        ),
                    child: Text(
                      "최신순",
                      style: TextStyle(
                        color: controller.sort.value == Sort.latest
                            ? Color(0xFF333333)
                            : Color(0xFFB8B8B8),
                        fontSize: 55.sp,
                        fontFamily: 'Core_Gothic_D5',
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      controller.handleChangeSort(Sort.higher);
                    },
                    style: TextButton.styleFrom(
                        // splashFactory: NoSplash.splashFactory,
                        ),
                    child: Text(
                      "별점 높은순",
                      style: TextStyle(
                        color: controller.sort.value == Sort.higher
                            ? Color(0xFF333333)
                            : Color(0xFFB8B8B8),
                        fontSize: 55.sp,
                        fontFamily: 'Core_Gothic_D5',
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      controller.handleChangeSort(Sort.lower);
                    },
                    style: TextButton.styleFrom(
                        // splashFactory: NoSplash.splashFactory,
                        ),
                    child: Text(
                      "별점 낮은순",
                      style: TextStyle(
                        color: controller.sort.value == Sort.lower
                            ? Color(0xFF333333)
                            : Color(0xFFB8B8B8),
                        fontSize: 55.sp,
                        fontFamily: 'Core_Gothic_D5',
                      ),
                    ),
                  ),
                  SizedBox(width: 50.w),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "포토 리뷰만 보기",
                    style: TextStyle(
                      color: Color(0xFF333333),
                      fontSize: 55.sp,
                      fontFamily: 'Core_Gothic_D5',
                    ),
                  ),
                  SizedBox(width: 20.w),
                  Switch(
                    value: controller.photoRiviewCheck.value,
                    onChanged: (value) {
                      controller.photoRiviewCheck.value =
                          !controller.photoRiviewCheck.value;
                    },
                    activeTrackColor: const Color(0xFFFF8800),
                    activeColor: Colors.white,
                  ),
                  SizedBox(width: 50.w),
                ],
              )
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
