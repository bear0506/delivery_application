import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:delivery_service/app/controller/review/review_controller.dart';
import 'package:intl/intl.dart';

class ReviewUi extends GetView<ReviewController> {
  const ReviewUi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GestureDetector(
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
              // "리뷰" + controller.reviewBool.toString(),
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
                  // child: ReviewContentWidget(),
                  child: controller.isLoaderVisible.value == true
                      ? ReviewWriteContentShimmerWidget()
                      : ReviewContentWidget()),
            ),
          ),
          // bottomNavigationBar: const BottomOutlinedButtonWidget(),
        ),
      ),
    );
  }
}

class ReviewContentWidget extends GetView<ReviewController> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
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
                  "${controller.reviewScoreAverage.toStringAsFixed(1)}",
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
                        index < controller.reviewScoreAverage.toInt()
                            ? "assets/icons/star_full.png"
                            : (controller.reviewScoreAverage.value -
                                        controller.reviewScoreAverage.floor() >=
                                    0.5
                                ? "assets/icons/star_half.png"
                                : "assets/icons/star.png"),
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
                    "${controller.reviews.length}개",
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
                value: controller.photoReviewCheck.value,
                onChanged: (value) {
                  controller.photoReviewCheck.value =
                      !controller.photoReviewCheck.value;
                },
                activeTrackColor: const Color(0xFFFF8800),
                activeColor: Colors.white,
              ),
              SizedBox(width: 50.w),
            ],
          ),
          Expanded(
            child: Container(
              color: Color(0xFFFAFAFA),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 100.w,
                  vertical: 80.h,
                ),
                child: ListView.separated(
                  itemCount: controller.reviews.length,
                  itemBuilder: (context, index) => Obx(
                    () => controller.photoReviewCheck.value
                        ? (controller.reviews[index].photos.length > 0
                            ? ReviewCardWidget(index)
                            : Container())
                        : ReviewCardWidget(index),
                  ),
                  separatorBuilder: (BuildContext context, int index) {
                    return controller.photoReviewCheck.value
                        ? (controller.reviews[index].photos.length > 0
                            ? Container(
                                margin: EdgeInsets.symmetric(vertical: 50.h),
                                color: Color(0xFFECECEC),
                                height: 5.h,
                              )
                            : Container())
                        : Container(
                            margin: EdgeInsets.symmetric(vertical: 50.h),
                            color: Color(0xFFECECEC),
                            height: 5.h,
                          );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ReviewCardWidget extends GetView<ReviewController> {
  const ReviewCardWidget(this.index, {Key? key}) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
          color: Color(0xFFFAFAFA),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                controller.reviews[index].memName,
                style: TextStyle(
                  color: const Color(0xFF333333),
                  fontSize: 50.sp,
                  fontFamily: 'Core_Gothic_D5',
                ),
              ),
              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 315.w,
                    height: 52.h,
                    child: ListView.separated(
                      physics: const ClampingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: 5,
                      itemBuilder: (context, starIndex) => Container(
                        child: Image.asset(
                          starIndex < controller.reviews[index].score.toInt()
                              ? "assets/icons/star_full.png"
                              : "assets/icons/star.png",
                          width: 54.w,
                        ),
                      ),
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(
                          width: 10.w,
                        );
                      },
                    ),
                  ),
                  SizedBox(width: 30.w),
                  Text(
                    DateFormat('yyyy.MM.dd')
                        .format(controller.reviews[index].createdAt),
                    style: TextStyle(
                      color: const Color(0xFF333333),
                      fontSize: 40.sp,
                      fontFamily: 'Core_Gothic_D5',
                    ),
                  ),
                ],
              ),
              SizedBox(height: 50.h),
              controller.reviews[index].photos.length > 0
                  ? (!controller.reviewBool[index]
                      ? Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              children: [
                                Container(
                                  width: 350.w,
                                  height: 350.h,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    image: DecorationImage(
                                        image: NetworkImage(controller
                                            .reviews[index].photos[0]),
                                        fit: BoxFit.cover),
                                  ),
                                ),
                                controller.reviews[index].photos.length > 1
                                    ? InkWell(
                                        onTap: () {
                                          controller.reviewBool[index] =
                                              !controller.reviewBool[index];
                                        },
                                        child: Container(
                                          width: 350.w,
                                          height: 350.h,
                                          decoration: BoxDecoration(
                                            color: Color(0x50473817),
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          child: Center(
                                            child: Text(
                                              "+${controller.reviews[index].photos.length - 1}",
                                              style: TextStyle(
                                                color: const Color(0xFFFFFFFF),
                                                fontSize: 100.sp,
                                                fontFamily: 'Core_Gothic_D5',
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                    : Container(),
                              ],
                            ),
                            SizedBox(width: 50.w),
                            Expanded(
                              child: Text(
                                controller.reviews[index].comment,
                                style: TextStyle(
                                  color: const Color(0xFF333333),
                                  fontSize: 50.sp,
                                  fontFamily: 'Core_Gothic_D5',
                                ),
                              ),
                            )
                          ],
                        )
                      : Column(
                          children: [
                            SizedBox(
                              height: 350.h,
                              child: ListView.builder(
                                physics: const ClampingScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                itemCount:
                                    controller.reviews[index].photos.length,
                                itemBuilder: (context, photoIndex) => Container(
                                  child: InkWell(
                                    onTap: () {
                                      controller.reviewBool[index] =
                                          !controller.reviewBool[index];
                                    },
                                    child: Container(
                                      margin: EdgeInsets.only(right: 50.w),
                                      width: 350.w,
                                      height: 350.h,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        image: DecorationImage(
                                          image: NetworkImage(controller
                                              .reviews[index]
                                              .photos[photoIndex]),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 50.h),
                            Text(
                              controller.reviews[index].comment,
                              style: TextStyle(
                                color: const Color(0xFF333333),
                                fontSize: 50.sp,
                                fontFamily: 'Core_Gothic_D5',
                              ),
                            ),
                          ],
                        ))
                  : Text(
                      controller.reviews[index].comment,
                      style: TextStyle(
                        color: const Color(0xFF333333),
                        fontSize: 50.sp,
                        fontFamily: 'Core_Gothic_D5',
                      ),
                    ),
              SizedBox(height: 50.h),
              Wrap(
                spacing: 50.h,
                runSpacing: 10.w,
                children: List.generate(
                  controller.reviews[index].menus.length,
                  (index2) => Text(
                    controller.reviews[index].menus[index2],
                    style: TextStyle(
                      color: const Color(0xFF797979),
                      fontSize: 40.sp,
                      fontFamily: 'Core_Gothic_D6',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
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
