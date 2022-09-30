import 'dart:convert';

import 'package:delivery_service/app/controller/mypage/mypage_controller.dart';
import 'package:delivery_service/app/controller/store/store_controller.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'package:shimmer/shimmer.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:delivery_service/app/controller/mypage/mypage_order_history_controller.dart';

class MyPageOrderHistoryDetailUi extends GetView<MyPageController> {
  const MyPageOrderHistoryDetailUi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Obx(
        () => Scaffold(
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
              "주문내역",
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
                child: controller.orderHistoryDetailLoader.value == false
                    ? const OrderHistoryDetailShimmerWidget()
                    : OrderHistoryDetailWidget(),
              ),
            ),
          ),
        ),
      );
}

class OrderHistoryDetailWidget extends GetView<MyPageController> {
  OrderHistoryDetailWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Obx(
        () => SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                "assets/icons/ch2.png",
                fit: BoxFit.fill,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 70.h,
                  horizontal: 100.w,
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          controller.orderHistory.value.storeName,
                          style: TextStyle(
                            color: const Color(0xFF333333),
                            fontSize: 60.sp,
                            fontFamily: 'Core_Gothic_D6',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          children: List.generate(
                            controller.orderHistory.value.orderCount,
                            (index) => Padding(
                              padding: EdgeInsets.only(left: 5.w),
                              child: Image.asset(
                                "assets/icons/person.png",
                                color: Color(0xFFFF7700),
                                width: 80.w,
                                height: 80.h,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 50.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              "assets/icons/favorite.png",
                              width: 54.48.w,
                              height: 51.97.h,
                            ),
                            SizedBox(
                              width: 20.w,
                            ),
                            Text(
                              "4.5",
                              style: TextStyle(
                                color: const Color(0xFF333333),
                                fontSize: 50.sp,
                                fontFamily: 'Core_Gothic_D5',
                              ),
                            ),
                            Text(
                              "(156)",
                              style: TextStyle(
                                color: const Color(0xFF333333),
                                fontSize: 50.sp,
                                fontFamily: 'Core_Gothic_D5',
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              DateFormat('yyyy-MM-dd HH:mm')
                                  .format(controller.order.value.orderAt),
                              style: TextStyle(
                                color: const Color(0xFF9B9B9B),
                                fontSize: 50.sp,
                                fontFamily: 'Core_Gothic_D5',
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                color: Color(0xFFECECEC),
                height: 4.h,
              ),
              Container(
                height: 780.h,
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        left: 100.w,
                        top: 70.h,
                        right: 100.w,
                        bottom: 30.h,
                      ),
                      child: Text(
                        "주문자",
                        style: TextStyle(
                          color: const Color(0xFF333333),
                          fontSize: 70.sp,
                          fontFamily: 'Core_Gothic_D6',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        bottom: 70.h,
                      ),
                      child: Container(
                        width: 1440.w,
                        height: 500.h,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage(
                                "assets/icons/ordererBackground.png"), // 배경 이미지
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              width: 400.w,
                              height: 400.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                    image: NetworkImage(
                                        controller.orderHistory.value.memPhoto),
                                    fit: BoxFit.cover),
                              ),
                            ),
                            Container(
                              width: 10.w,
                              height: 400.h,
                              color: const Color(0xFFFF8800),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(
                                  width: 730.w,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "ID",
                                        style: TextStyle(
                                          color: const Color(0xFF333333),
                                          fontSize: 60.sp,
                                          fontFamily: 'Core_Gothic_D6',
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        controller.orderHistory.value.memName,
                                        style: TextStyle(
                                          color: const Color(0xFF333333),
                                          fontSize: 60.sp,
                                          fontFamily: 'Core_Gothic_D6',
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: 730.w,
                                  height: 3.h,
                                  color: const Color(0xFFD1D1D1),
                                ),
                                SizedBox(
                                  width: 730.w,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "주소",
                                        style: TextStyle(
                                          color: const Color(0xFF333333),
                                          fontSize: 40.sp,
                                          fontFamily: 'Core_Gothic_D5',
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {},
                                        child: Row(
                                          children: [
                                            SizedBox(
                                              width: 500.w,
                                              child: Text(
                                                controller.orderHistory.value
                                                        .address +
                                                    ", " +
                                                    controller.orderHistory
                                                        .value.detail,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                  color:
                                                      const Color(0xFF333333),
                                                  fontSize: 40.sp,
                                                  fontFamily: 'Core_Gothic_D5',
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 20.w,
                                            ),
                                            Image.asset(
                                              "assets/icons/details.png",
                                              width: 15.w,
                                              height: 30.h,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 730.w,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "거래 횟수",
                                        style: TextStyle(
                                          color: const Color(0xFF333333),
                                          fontSize: 40.sp,
                                          fontFamily: 'Core_Gothic_D5',
                                        ),
                                      ),
                                      Text(
                                        "15회",
                                        style: TextStyle(
                                          color: const Color(0xFFFF8800),
                                          fontSize: 40.sp,
                                          fontFamily: 'Core_Gothic_D5',
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 730.w,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "매너 점수",
                                        style: TextStyle(
                                          color: const Color(0xFF333333),
                                          fontSize: 40.sp,
                                          fontFamily: 'Core_Gothic_D5',
                                        ),
                                      ),
                                      Text(
                                        "100점",
                                        style: TextStyle(
                                          color: const Color(0xFFFF8800),
                                          fontSize: 40.sp,
                                          fontFamily: 'Core_Gothic_D5',
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                color: const Color(0xFFECECEC),
                thickness: 4.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 70.h,
                  horizontal: 100.w,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "주문내역",
                      style: TextStyle(
                        color: const Color(0xFF333333),
                        fontSize: 70.sp,
                        fontFamily: 'Core_Gothic_D6',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 50.h,
                    ),
                    ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount:
                          controller.orderHistory.value.orderDetails.length,
                      itemBuilder: (BuildContext context, int index) => Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            jsonDecode(controller.orderHistory.value
                                .orderDetails[index].menu)["name"],
                            style: TextStyle(
                              color: const Color(0xFF333333),
                              fontSize: 60.sp,
                              fontFamily: 'Core_Gothic_D5',
                            ),
                          ),
                          SizedBox(height: 25.h),
                          ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: jsonDecode(controller.orderHistory.value
                                    .orderDetails[index].menu)['menu_option']
                                .length,
                            itemBuilder: (context, index2) => Container(
                              child: Padding(
                                padding: EdgeInsets.only(left: 20.w),
                                child: Container(
                                  margin: EdgeInsets.symmetric(vertical: 5.h),
                                  child: Text(
                                    "- " +
                                        jsonDecode(controller
                                            .orderHistory
                                            .value
                                            .orderDetails[index]
                                            .menu)['menu_option'][index2],
                                    style: TextStyle(
                                      color: const Color(0xFFB8B8B8),
                                      fontSize: 45.sp,
                                      fontFamily: 'Core_Gothic_D4',
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 30.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "${NumberFormat.currency(locale: "ko_KR", symbol: "").format(controller.orderHistory.value.orderDetails[index].price)}원",
                                style: TextStyle(
                                  color: const Color(0xFF333333),
                                  fontSize: 60.sp,
                                  fontFamily: 'Core_Gothic_D5',
                                ),
                              ),
                              Text(
                                "${controller.orderHistory.value.orderDetails[index].count}개",
                                style: TextStyle(
                                  color: const Color(0xFF333333),
                                  fontSize: 60.sp,
                                  fontFamily: 'Core_Gothic_D5',
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      separatorBuilder: (BuildContext context, int index) =>
                          Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 60.h,
                        ),
                        child: Container(
                          color: Color(0xFFB8B8B8),
                          height: 1.h,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 60.h,
                      ),
                      child: Container(
                        color: Color(0xFFB8B8B8),
                        height: 2.h,
                      ),
                    ),
                    Text(
                      "배달비",
                      style: TextStyle(
                        color: const Color(0xFF333333),
                        fontSize: 60.sp,
                        fontFamily: 'Core_Gothic_D5',
                      ),
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "${NumberFormat.currency(locale: "ko_KR", symbol: "").format(controller.orderHistory.value.deliveryFee)}원 / ${controller.orderHistory.value.orderCount}명",
                          style: TextStyle(
                            color: const Color(0xFFB8B8B8),
                            fontSize: 45.sp,
                            fontFamily: 'Core_Gothic_D4',
                          ),
                        ),
                        Text(
                          "${NumberFormat.currency(locale: "ko_KR", symbol: "").format(controller.orderHistory.value.deliveryFee / controller.orderHistory.value.orderCount)}원",
                          style: TextStyle(
                            color: const Color(0xFF333333),
                            fontSize: 60.sp,
                            fontFamily: 'Core_Gothic_D5',
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 60.h,
                      ),
                      child: Container(
                        color: Color(0xFFAFAFAF),
                        height: 4.h,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "최종금액",
                          style: TextStyle(
                            color: const Color(0xFF333333),
                            fontSize: 70.sp,
                            fontFamily: 'Core_Gothic_D7',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          NumberFormat.currency(locale: "ko_KR", symbol: "")
                                  .format(controller.orderHistory.value.price +
                                      (controller
                                              .orderHistory.value.deliveryFee /
                                          controller
                                              .orderHistory.value.orderCount)) +
                              "원",
                          style: TextStyle(
                            color: const Color(0xFFFF8800),
                            fontSize: 70.sp,
                            fontFamily: 'Core_Gothic_D7',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 70.h,
                    ),
                    Text(
                      "신한카드 ****123* 결제",
                      style: TextStyle(
                        color: const Color(0xFF9B9B9B),
                        fontSize: 50.sp,
                        fontFamily: 'Core_Gothic_D5',
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 150.h,
                  left: 100.w,
                  right: 100.w,
                ),
                child: SizedBox(
                  width: 1240.w,
                  height: 200.h,
                  child: OutlinedButton(
                    onPressed: () => {
                      Get.toNamed(
                          "/store=${controller.orderHistory.value.storeIdx}"),
                      Get.put(StoreController()).handleStoreInitProvider()
                    },
                    style: OutlinedButton.styleFrom(
                      side:
                          const BorderSide(color: Color(0xFFFF8800), width: 1),
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
                      "재주문하기",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 70.sp,
                        fontFamily: 'Core_Gothic_D5',
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 100.h,
                  horizontal: 100.w,
                ),
                child: SizedBox(
                  width: 1240.w,
                  height: 200.h,
                  child: OutlinedButton(
                    onPressed: () => {
                      Get.toNamed(
                          "/store=${controller.orderHistory.value.storeIdx}/review/write")
                      // Get.toNamed(
                      //     '/mypage/order/history/detail=${controller.orderHistory[number]["number"]}/reviewWrite=${controller.storeIdx}');
                    },
                    style: OutlinedButton.styleFrom(
                      side:
                          const BorderSide(color: Color(0xFFFF8800), width: 1),
                      backgroundColor: Colors.white,
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
                      "리뷰쓰기",
                      style: TextStyle(
                        color: const Color(0xFFFF8800),
                        fontSize: 70.sp,
                        fontFamily: 'Core_Gothic_D5',
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

class OrderHistoryDetailShimmerWidget
    extends GetView<MyPageOrderHistoryController> {
  const OrderHistoryDetailShimmerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Shimmer.fromColors(
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.grey.shade100,
              child: Container(
                width: 1440.w,
                height: 700.h,
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 70.h,
                horizontal: 100.w,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Shimmer.fromColors(
                        baseColor: Colors.grey.shade300,
                        highlightColor: Colors.grey.shade100,
                        child: Container(
                          width: 403.w,
                          height: 83.h,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(
                              Radius.circular(15),
                            ),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Shimmer.fromColors(
                            baseColor: Colors.grey.shade300,
                            highlightColor: Colors.grey.shade100,
                            child: Container(
                              width: 80.w,
                              height: 80.h,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(15),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 20.w,
                          ),
                          Shimmer.fromColors(
                            baseColor: Colors.grey.shade300,
                            highlightColor: Colors.grey.shade100,
                            child: Container(
                              width: 80.w,
                              height: 80.h,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(15),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 20.w,
                          ),
                          Shimmer.fromColors(
                            baseColor: Colors.grey.shade300,
                            highlightColor: Colors.grey.shade100,
                            child: Container(
                              width: 80.w,
                              height: 80.h,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(15),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 20.w,
                          ),
                          Shimmer.fromColors(
                            baseColor: Colors.grey.shade300,
                            highlightColor: Colors.grey.shade100,
                            child: Container(
                              width: 80.w,
                              height: 80.h,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(15),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Shimmer.fromColors(
                            baseColor: Colors.grey.shade300,
                            highlightColor: Colors.grey.shade100,
                            child: Container(
                              width: 54.48.w,
                              height: 51.97.h,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(15),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 20.w,
                          ),
                          Shimmer.fromColors(
                            baseColor: Colors.grey.shade300,
                            highlightColor: Colors.grey.shade100,
                            child: Container(
                              width: 193.w,
                              height: 69.h,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(15),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Shimmer.fromColors(
                            baseColor: Colors.grey.shade300,
                            highlightColor: Colors.grey.shade100,
                            child: Container(
                              width: 444.w,
                              height: 69.h,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(15),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Divider(
              color: const Color(0xFFECECEC),
              thickness: 4.h,
            ),
            Container(
              height: 780.h,
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: 100.w,
                      top: 70.h,
                      right: 100.w,
                      bottom: 30.h,
                    ),
                    child: Shimmer.fromColors(
                      baseColor: Colors.grey.shade300,
                      highlightColor: Colors.grey.shade100,
                      child: Container(
                        width: 193.w,
                        height: 97.h,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      bottom: 70.h,
                    ),
                    child: Shimmer.fromColors(
                      baseColor: Colors.grey.shade300,
                      highlightColor: Colors.grey.shade100,
                      child: Container(
                        width: 1440.w,
                        height: 500.h,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Shimmer.fromColors(
                              baseColor: Colors.grey.shade300,
                              highlightColor: Colors.grey.shade100,
                              child: Container(
                                width: 400.w,
                                height: 400.h,
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(15),
                                  ),
                                ),
                              ),
                            ),
                            Shimmer.fromColors(
                              baseColor: Colors.grey.shade300,
                              highlightColor: Colors.grey.shade100,
                              child: Container(
                                width: 10.w,
                                height: 400.h,
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(15),
                                  ),
                                ),
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(
                                  width: 730.w,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Shimmer.fromColors(
                                        baseColor: Colors.grey.shade300,
                                        highlightColor: Colors.grey.shade100,
                                        child: Container(
                                          width: 56.w,
                                          height: 83.h,
                                          decoration: const BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(15),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Shimmer.fromColors(
                                        baseColor: Colors.grey.shade300,
                                        highlightColor: Colors.grey.shade100,
                                        child: Container(
                                          width: 324.w,
                                          height: 83.h,
                                          decoration: const BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(15),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: 730.w,
                                  height: 3.h,
                                  color: const Color(0xFFD1D1D1),
                                ),
                                SizedBox(
                                  width: 730.w,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Shimmer.fromColors(
                                        baseColor: Colors.grey.shade300,
                                        highlightColor: Colors.grey.shade100,
                                        child: Container(
                                          width: 74.w,
                                          height: 56.h,
                                          decoration: const BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(15),
                                            ),
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {},
                                        child: Row(
                                          children: [
                                            Shimmer.fromColors(
                                              baseColor: Colors.grey.shade300,
                                              highlightColor:
                                                  Colors.grey.shade100,
                                              child: Container(
                                                width: 533.w,
                                                height: 56.h,
                                                decoration: const BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.all(
                                                    Radius.circular(15),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 730.w,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Shimmer.fromColors(
                                        baseColor: Colors.grey.shade300,
                                        highlightColor: Colors.grey.shade100,
                                        child: Container(
                                          width: 158.w,
                                          height: 56.h,
                                          decoration: const BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(15),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Shimmer.fromColors(
                                        baseColor: Colors.grey.shade300,
                                        highlightColor: Colors.grey.shade100,
                                        child: Container(
                                          width: 83.w,
                                          height: 56.h,
                                          decoration: const BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(15),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 730.w,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Shimmer.fromColors(
                                        baseColor: Colors.grey.shade300,
                                        highlightColor: Colors.grey.shade100,
                                        child: Container(
                                          width: 158.w,
                                          height: 56.h,
                                          decoration: const BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(15),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Shimmer.fromColors(
                                        baseColor: Colors.grey.shade300,
                                        highlightColor: Colors.grey.shade100,
                                        child: Container(
                                          width: 106.w,
                                          height: 56.h,
                                          decoration: const BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(15),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              color: const Color(0xFFECECEC),
              thickness: 4.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 70.h,
                horizontal: 100.w,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Shimmer.fromColors(
                    baseColor: Colors.grey.shade300,
                    highlightColor: Colors.grey.shade100,
                    child: Container(
                      width: 258.w,
                      height: 97.h,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50.h,
                  ),
                  Obx(
                    () => ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: controller.orderMenuHistory.length,
                      itemBuilder: (BuildContext context, int index) => Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Shimmer.fromColors(
                            baseColor: Colors.grey.shade300,
                            highlightColor: Colors.grey.shade100,
                            child: Container(
                              width: 565.w,
                              height: 83.h,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(15),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 30.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Shimmer.fromColors(
                                baseColor: Colors.grey.shade300,
                                highlightColor: Colors.grey.shade100,
                                child: Container(
                                  width: 244.w,
                                  height: 83.h,
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(15),
                                    ),
                                  ),
                                ),
                              ),
                              Shimmer.fromColors(
                                baseColor: Colors.grey.shade300,
                                highlightColor: Colors.grey.shade100,
                                child: Container(
                                  width: 106.w,
                                  height: 83.h,
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(15),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      separatorBuilder: (BuildContext context, int index) =>
                          Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 60.h,
                        ),
                        child: const Divider(
                          color: Color(0xFFB8B8B8),
                          thickness: 1,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 60.h,
                    ),
                    child: const Divider(
                      color: Color(0xFFB8B8B8),
                      thickness: 1,
                    ),
                  ),
                  Shimmer.fromColors(
                    baseColor: Colors.grey.shade300,
                    highlightColor: Colors.grey.shade100,
                    child: Container(
                      width: 166.w,
                      height: 83.h,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Shimmer.fromColors(
                    baseColor: Colors.grey.shade300,
                    highlightColor: Colors.grey.shade100,
                    child: Container(
                      width: 158.w,
                      height: 83.h,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 60.h,
                    ),
                    child: Divider(
                      color: const Color(0xFFAFAFAF),
                      thickness: 8.h,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Shimmer.fromColors(
                        baseColor: Colors.grey.shade300,
                        highlightColor: Colors.grey.shade100,
                        child: Container(
                          width: 258.w,
                          height: 97.h,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(
                              Radius.circular(15),
                            ),
                          ),
                        ),
                      ),
                      Shimmer.fromColors(
                        baseColor: Colors.grey.shade300,
                        highlightColor: Colors.grey.shade100,
                        child: Container(
                          width: 292.w,
                          height: 97.h,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(
                              Radius.circular(15),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 70.h,
                  ),
                  Shimmer.fromColors(
                    baseColor: Colors.grey.shade300,
                    highlightColor: Colors.grey.shade100,
                    child: Container(
                      width: 529.w,
                      height: 69.h,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 150.h,
                left: 100.w,
                right: 100.w,
              ),
              child: Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade100,
                child: Container(
                  width: 1240.w,
                  height: 200.h,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(50),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 100.h,
                horizontal: 100.w,
              ),
              child: Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade100,
                child: Container(
                  width: 1240.w,
                  height: 200.h,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(50),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
}
