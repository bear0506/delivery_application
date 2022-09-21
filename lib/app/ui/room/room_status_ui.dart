import 'dart:convert';

import 'package:delivery_service/app/controller/order/order_controller.dart';
import 'package:get/get.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:delivery_service/app/controller/room/room_controller.dart';
import 'package:intl/intl.dart';

class RoomStatusUi extends GetView<RoomController> {
  RoomStatusUi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: NestedScrollView(
        physics: const ClampingScrollPhysics(),
        controller: controller.roomStatusScrollController.value,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            Obx(
              () => SliverAppBar(
                elevation: 0,
                automaticallyImplyLeading: false,
                titleSpacing: 0,
                backgroundColor: Colors.white,
                pinned: true,
                title: Padding(
                  padding: EdgeInsets.only(
                    left: 50.w,
                    top: 50.h,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: Image.asset(
                          "assets/icons/back2.png",
                          // color: const Color(0xFF333333),
                          width: 80.w,
                          height: 60.h,
                        ),
                        onPressed: () => Get.back(),
                      ),
                      SizedBox(
                        width: 20.w,
                      ),
                      Expanded(
                        child: Text(
                          "${controller.room.value.memName}님의 모임",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: const Color(0xFF333333),
                            fontSize: 60.sp,
                            fontFamily: 'Core_Gothic_D6',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ];
        },
        body: Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.fromSwatch(
              accentColor: Colors.transparent,
            ),
          ),
          child: NotificationListener<OverscrollIndicatorNotification>(
            onNotification: (OverscrollIndicatorNotification? overscroll) {
              overscroll!.disallowIndicator();
              return true;
            },
            child: SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              child: Column(
                children: [
                  TimeInformation(),
                  StoreInformation(),
                  Container(
                    height: 5.h,
                    color: Color(0XFFECECEC),
                  ),
                  OrdererInformation(),
                  Container(
                    height: 5.h,
                    color: Color(0XFFECECEC),
                  ),
                  OrderListWidget(),
                  Container(
                    height: 5.h,
                    color: Color(0XFFECECEC),
                  ),
                  // ChattingWidget(),
                ],
              ),
            ),
          ),
        ),
      ),
      // bottomNavigationBar: const BottomOutlinedButtonWidget(),
    );
  }
}

class TimeInformation extends StatelessWidget {
  const TimeInformation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1440.w,
      height: 700.h,
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage("assets/icons/chicken_store.png"), // 배경 이미지
        ),
      ),
    );
  }
}

class StoreInformation extends GetView<RoomController> {
  StoreInformation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        height: 480.h,
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 70.h,
            horizontal: 100.w,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                controller.room.value.storeName,
                style: TextStyle(
                  color: const Color(0xFF333333),
                  fontSize: 60.sp,
                  fontFamily: 'Core_Gothic_D6',
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.ideographic,
                children: [
                  Image.asset(
                    "assets/icons/favorite2.png",
                    width: 41.w,
                    height: 50.h,
                  ),
                  Text(
                    "4.5(159)",
                    style: TextStyle(
                      color: const Color(0xFF333333),
                      fontSize: 50.sp,
                      fontFamily: 'Core_Gothic_D5',
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "배달시간",
                    style: TextStyle(
                      color: const Color(0xFFFF8800),
                      fontSize: 50.sp,
                      fontFamily: 'Core_Gothic_D5',
                    ),
                  ),
                  SizedBox(
                    width: 50.w,
                  ),
                  Text(
                    controller.room.value.deliveryTime.replaceAll("~", " ~ ") +
                        "분",
                    style: TextStyle(
                      color: const Color(0xFF333333),
                      fontSize: 50.sp,
                      fontFamily: 'Core_Gothic_D5',
                    ),
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () {
                      Get.toNamed("/store=" +
                          controller.room.value.storeIdx.toString());
                    },
                    style: TextButton.styleFrom(
                      splashFactory: NoSplash.splashFactory,
                    ),
                    child: Text(
                      "가게 둘러보기",
                      style: TextStyle(
                        color: const Color(0xFFFF8800),
                        fontSize: 40.sp,
                        fontFamily: 'Core_Gothic_D5',
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OrdererInformation extends GetView<RoomController> {
  OrdererInformation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
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
                    Image.asset(
                      "assets/icons/orderer.png",
                      width: 400.w,
                      height: 400.h,
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                controller.room.value.memName,
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                    Text(
                                      controller.room.value.address,
                                      style: TextStyle(
                                        color: const Color(0xFF333333),
                                        fontSize: 40.sp,
                                        fontFamily: 'Core_Gothic_D5',
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
    );
  }
}

class OrderListWidget extends GetView<RoomController> {
  OrderListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Padding(
        padding: EdgeInsets.only(
          top: 70.h,
          left: 100.w,
          right: 100.w,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
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
              ],
            ),
            SizedBox(
              height: 50.h,
            ),
            ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: controller.order.value.orderDetails.length,
              itemBuilder: (context, index) => Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      jsonDecode(controller
                          .order.value.orderDetails[index].menu)['name'],
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
                      itemCount: jsonDecode(controller.order.value
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
                                      .order
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
                    SizedBox(height: 30.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          NumberFormat.currency(locale: "ko_KR", symbol: "")
                                  .format(controller
                                      .order.value.orderDetails[index].price) +
                              "원",
                          style: TextStyle(
                            color: const Color(0xFF333333),
                            fontSize: 60.sp,
                            fontFamily: 'Core_Gothic_D5',
                          ),
                        ),
                        Text(
                          controller.order.value.orderDetails[index].count
                                  .toString() +
                              " 개",
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
              ),
              separatorBuilder: (BuildContext context, int index) {
                return Container(
                  margin: EdgeInsets.symmetric(vertical: 60.h),
                  color: Color(0xFFECECEC),
                  height: 2.h,
                );
              },
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 60.h),
              color: Color(0xFFECECEC),
              height: 2.h,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "배달비",
                      style: TextStyle(
                        color: const Color(0xFF333333),
                        fontSize: 60.sp,
                        fontFamily: 'Core_Gothic_D5',
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 35.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "2,000원 / 4명",
                      style: TextStyle(
                        color: const Color(0xFFB8B8B8),
                        fontSize: 45.sp,
                        fontFamily: 'Core_Gothic_D4',
                      ),
                    ),
                    Text(
                      "2,000원",
                      style: TextStyle(
                        color: const Color(0xFF333333),
                        fontSize: 60.sp,
                        fontFamily: 'Core_Gothic_D5',
                      ),
                    ),
                  ],
                )
              ],
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 60.h),
              color: Color(0xFFECECEC),
              height: 5.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "예상금액",
                  style: TextStyle(
                    color: const Color(0xFF333333),
                    fontSize: 70.sp,
                    fontFamily: 'Core_Gothic_D6',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  NumberFormat.currency(locale: "ko_KR", symbol: "")
                          .format(controller.order.value.price) +
                      "원",
                  style: TextStyle(
                    color: const Color(0xFFFF8800),
                    fontSize: 70.sp,
                    fontFamily: 'Core_Gothic_D6',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 50.h),
          ],
        ),
      ),
    );
  }
}

class ChattingWidget extends GetView<RoomController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0XFFF1F1F1),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            itemCount: 4,
            itemBuilder: (context, index2) => Container(
              margin: EdgeInsets.symmetric(vertical: 20.h),
              padding: EdgeInsets.symmetric(horizontal: 100.w),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Container(
                        width: 250.w,
                        height: 250.h,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: Image.asset(
                          "assets/icons/noze.png",
                          fit: BoxFit.contain,
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Text(
                        "♡zi존성민♡",
                        style: TextStyle(
                          color: const Color(0xFF333333),
                          fontSize: 40.sp,
                          fontFamily: 'Core_Gothic_D5',
                          // fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 60.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        width: 600.w,
                        height: 170.h,
                        decoration: BoxDecoration(
                          color: Color(0XFFFFFFFF),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(5),
                            topRight: Radius.circular(5),
                            bottomRight: Radius.circular(5),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            "안녕하세요!",
                            style: TextStyle(
                              color: const Color(0xFF333333),
                              fontSize: 50.sp,
                              fontFamily: 'Core_Gothic_D5',
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Text(
                        "21:20",
                        style: TextStyle(
                          color: const Color(0xFF808080),
                          fontSize: 30.sp,
                          fontFamily: 'Core_Gothic_D5',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 20.h),
            padding: EdgeInsets.symmetric(horizontal: 100.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      width: 600.w,
                      height: 170.h,
                      decoration: BoxDecoration(
                        color: Color(0XFFFFFFFF),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(5),
                          topRight: Radius.circular(5),
                          bottomLeft: Radius.circular(5),
                        ),
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      "21:20",
                      style: TextStyle(
                        color: const Color(0xFF808080),
                        fontSize: 30.sp,
                        fontFamily: 'Core_Gothic_D5',
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 60.w),
                Column(
                  children: [
                    Container(
                      width: 250.w,
                      height: 250.h,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Image.asset(
                        "assets/icons/noze.png",
                        fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      "♡zi존성민♡",
                      style: TextStyle(
                        color: const Color(0xFF333333),
                        fontSize: 40.sp,
                        fontFamily: 'Core_Gothic_D5',
                        // fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BottomOutlinedButtonWidget extends StatelessWidget {
  const BottomOutlinedButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 1440.w,
          height: 200.h,
          child: InkWell(
            onTap: () {
              if (Get.put(OrderController()).cartItemCount.value == 0) {
                Get.dialog(
                  AlertDialog(
                    content: SizedBox(
                      width: 1000.w,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            width: 880.w,
                            child: Text(
                              "메뉴를 먼저 장바구니에 담고 모임에 참가해주세요!",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 60.sp,
                                fontFamily: 'Core_Gothic_D5',
                              ),
                            ),
                          ),
                          SizedBox(height: 80.h),
                          Container(
                            width: 880.w,
                            height: 2.h,
                            color: Color(0XFFB8B8B8),
                          ),
                        ],
                      ),
                    ),
                    contentPadding:
                        EdgeInsets.only(left: 60.w, right: 60.w, top: 80.h),
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
                        onPressed: () => Get.back(),
                      ),
                    ],
                    actionsAlignment: MainAxisAlignment.center,
                    actionsPadding: EdgeInsets.zero,
                  ),
                );
              } else if (Get.put(RoomController()).room.value.storeIdx !=
                  Get.put(OrderController()).cartOrder.value.idx) {
                Get.dialog(
                  AlertDialog(
                    content: SizedBox(
                      width: 1000.w,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            width: 880.w,
                            child: Text(
                              "같은 가게의 메뉴를 장바구니에 담아주세요!",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 60.sp,
                                fontFamily: 'Core_Gothic_D5',
                              ),
                            ),
                          ),
                          SizedBox(height: 80.h),
                          Container(
                            width: 880.w,
                            height: 2.h,
                            color: Color(0XFFB8B8B8),
                          ),
                        ],
                      ),
                    ),
                    contentPadding:
                        EdgeInsets.only(left: 60.w, right: 60.w, top: 80.h),
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
                        onPressed: () => Get.back(),
                      ),
                    ],
                    actionsAlignment: MainAxisAlignment.center,
                    actionsPadding: EdgeInsets.zero,
                  ),
                );
              }
            },
            child: Container(
              padding: EdgeInsets.only(
                top: 52.h,
              ),
              color: const Color(0xFFFF8800),
              child: Text(
                "모임 참가하기",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 70.sp,
                  fontFamily: 'Core_Gothic_D5',
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
