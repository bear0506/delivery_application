import 'dart:convert';

import 'package:delivery_service/app/controller/room/room_controller.dart';
import 'package:get/get.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:delivery_service/app/controller/order/order_controller.dart';
import 'package:delivery_service/app/controller/address/address_controller.dart';
import 'package:delivery_service/app/data/model/order/order_model.dart';
import 'package:intl/intl.dart';

class OrderUi extends GetView<OrderController> {
  const OrderUi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: Colors.white,
        body: NestedScrollView(
          physics: const ClampingScrollPhysics(),
          controller: controller.scrollController.value,
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                elevation: 0,
                // expandedHeight: 200.h,
                // collapsedHeight: 200.h,
                automaticallyImplyLeading: false,
                titleSpacing: 0,
                backgroundColor: Colors.amber,
                pinned: controller.temp.value,
                title: Padding(
                  padding: EdgeInsets.only(
                    left: 50.w,
                    top: 50.h,
                  ),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: Image.asset(
                          "assets/icons/x.png",
                          color: const Color(0xFF333333),
                          width: 50.w,
                          height: 50.h,
                        ),
                        onPressed: () => Get.back(),
                      ),
                      SizedBox(
                        width: 20.w,
                      ),
                      Expanded(
                        child: Text(
                          "주문하기",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: const Color(0xFF333333),
                            fontSize: 60.sp,
                            fontFamily: 'Core_Gothic_D5',
                          ),
                        ),
                      ),
                    ],
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
                    SetAddressWidget(),
                    Container(
                      color: Color(0xFFECECEC),
                      height: 20.h,
                    ),
                    CartListWidget(),
                    Container(
                      color: Color(0xFFECECEC),
                      height: 20.h,
                    ),
                    // TotalPrice(),
                    CartPriceWidget(),
                    Container(
                      color: Color(0xFFECECEC),
                      height: 20.h,
                    ),
                    Notice(),
                  ],
                ),
              ),
            ),
          ),
        ),
        bottomNavigationBar: BottomOutlinedButtonWidget(),
      ),
    );
  }
}

class SetAddressWidget extends GetView<OrderController> {
  const SetAddressWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 100.w,
          vertical: 60.h,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "배달 주소",
              style: TextStyle(
                color: const Color(0xFFB8B8B8),
                fontSize: 50.sp,
                fontFamily: 'Core_Gothic_D4',
              ),
            ),
            SizedBox(
              height: 45.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Text(
                    Get.put(AddressController()).currentAddress.value.address +
                        ", " +
                        Get.put(AddressController())
                            .currentAddress
                            .value
                            .detail,
                    style: TextStyle(
                      color: const Color(0xFF333333),
                      fontSize: 60.sp,
                      fontFamily: 'Core_Gothic_D5',
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                SizedBox(width: 20.w),
                TextButton(
                  onPressed: () {
                    Get.toNamed("/address");
                  },
                  style: TextButton.styleFrom(
                    splashFactory: NoSplash.splashFactory,
                    minimumSize: Size.zero,
                    padding: EdgeInsets.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  child: Text(
                    "변경",
                    style: TextStyle(
                      color: const Color(0xFFFF8800),
                      fontSize: 50.sp,
                      fontFamily: 'Core_Gothic_D5',
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CartListWidget extends GetView<OrderController> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        constraints: const BoxConstraints(
          maxHeight: double.infinity,
        ),
        padding: EdgeInsets.only(left: 100.w, right: 100.w, top: 30.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            controller.cartMenus.length > 0
                ? ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: controller.cartMenus.length,
                    itemBuilder: (context, index) => Container(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                jsonDecode(
                                    controller.cartMenus[index].menu)['name'],
                                style: TextStyle(
                                  color: const Color(0xFF333333),
                                  fontSize: 60.sp,
                                  fontFamily: 'Core_Gothic_D5',
                                ),
                              ),
                              SizedBox(
                                width: 45.w,
                                height: 45.h,
                                child: IconButton(
                                  constraints: BoxConstraints(),
                                  padding: EdgeInsets.zero,
                                  splashColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onPressed: () {
                                    controller.handleOrderDetailDeleteProvider(
                                      controller.cartMenus[index].orderIdx,
                                      controller.cartMenus[index].idx,
                                    );
                                  },
                                  icon: Image.asset(
                                    "assets/icons/x2.png",
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 25.h),
                          ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount:
                                jsonDecode(controller.cartMenus[index].menu)[
                                        'menu_option']
                                    .length,
                            itemBuilder: (context, index2) => Container(
                              child: Padding(
                                padding: EdgeInsets.only(left: 20.w),
                                child: Container(
                                  margin: EdgeInsets.symmetric(vertical: 5.h),
                                  child: Text(
                                    "- " +
                                        jsonDecode(controller.cartMenus[index]
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
                                NumberFormat.currency(
                                            locale: "ko_KR", symbol: "")
                                        .format(
                                            controller.cartMenus[index].price) +
                                    "원",
                                style: TextStyle(
                                  color: const Color(0xFF333333),
                                  fontSize: 60.sp,
                                  fontFamily: 'Core_Gothic_D5',
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: 80.w,
                                    height: 80.h,
                                    child: IconButton(
                                      padding: EdgeInsets.zero,
                                      splashColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onPressed: () {
                                        if (controller.cartMenus[index].count >
                                            1) {
                                          controller
                                              .handleOrderDetailCountMinusProvider(
                                                  controller.cartMenus[index]
                                                      .orderIdx,
                                                  controller
                                                      .cartMenus[index].idx);
                                        }
                                      },
                                      icon: Image.asset(
                                          "assets/icons/minus1.png"),
                                    ),
                                  ),
                                  Container(
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 60.w),
                                    child: Text(
                                      controller.cartMenus[index].count
                                          .toString(),
                                      style: TextStyle(
                                        color: const Color(0xFF333333),
                                        fontSize: 60.sp,
                                        fontFamily: 'Core_Gothic_D5',
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 80.w,
                                    height: 80.h,
                                    child: IconButton(
                                      padding: EdgeInsets.zero,
                                      splashColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onPressed: () {
                                        controller
                                            .handleOrderDetailCountPlusProvider(
                                                controller
                                                    .cartMenus[index].orderIdx,
                                                controller
                                                    .cartMenus[index].idx);
                                      },
                                      icon:
                                          Image.asset("assets/icons/plus1.png"),
                                    ),
                                  ),
                                ],
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
                  )
                : Column(
                    children: [
                      SizedBox(height: 50.h),
                      Text(
                        "텅",
                        style: TextStyle(
                          color: const Color(0xFF333333),
                          fontSize: 100.sp,
                          fontFamily: 'Core_Gothic_D5',
                        ),
                      ),
                    ],
                  ),
            Container(
              margin: EdgeInsets.only(top: 60.h),
              color: Color(0xFFECECEC),
              height: 2.h,
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 30.h),
              child: TextButton(
                onPressed: () {
                  // insertItem();
                  Get.back();
                },
                style: TextButton.styleFrom(
                  splashFactory: NoSplash.splashFactory,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                child: Text(
                  "+ 메뉴 추가하기",
                  style: TextStyle(
                    color: const Color(0xFFFF8800),
                    fontSize: 50.sp,
                    fontFamily: 'Core_Gothic_D5',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CartPriceWidget extends GetView<OrderController> {
  @override
  Widget build(Object context) {
    return Obx(
      () => Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 100.w,
          vertical: 60.h,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "주문금액",
                  style: TextStyle(
                    color: const Color(0xFF333333),
                    fontSize: 60.sp,
                    fontFamily: 'Core_Gothic_D5',
                  ),
                ),
                Text(
                  NumberFormat.currency(locale: "ko_KR", symbol: "")
                          .format(controller.cartOrder.value.price) +
                      "원",
                  style: TextStyle(
                    color: const Color(0xFF333333),
                    fontSize: 60.sp,
                    fontFamily: 'Core_Gothic_D5',
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
                Text(
                  "배달비",
                  style: TextStyle(
                    color: const Color(0xFF333333),
                    fontSize: 60.sp,
                    fontFamily: 'Core_Gothic_D5',
                  ),
                ),
                Text(
                  NumberFormat.currency(locale: "ko_KR", symbol: "")
                          .format(controller.cartOrder.value.deliveryFee) +
                      "원",
                  style: TextStyle(
                    color: const Color(0xFF333333),
                    fontSize: 60.sp,
                    fontFamily: 'Core_Gothic_D5',
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            const Divider(
              color: Color(0xFFECECEC),
              thickness: 1,
            ),
            SizedBox(
              height: 20.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "총 금액",
                  style: TextStyle(
                    color: const Color(0xFF333333),
                    fontSize: 60.sp,
                    fontFamily: 'Core_Gothic_D6',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  NumberFormat.currency(locale: "ko_KR", symbol: "").format(
                          controller.cartOrder.value.price +
                              controller.cartOrder.value.deliveryFee) +
                      "원",
                  style: TextStyle(
                    color: const Color(0xFF333333),
                    fontSize: 60.sp,
                    fontFamily: 'Core_Gothic_D6',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class Notice extends StatelessWidget {
  const Notice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 60.h,
        left: 100.w,
        right: 100.w,
      ),
      child: Text(
        "배달띱은 통신판매중개자로서 통신판매의 당사자가 아니며, 판매자가 등록\n한 상품 정보, 상품의 품질 및 거래에 대해서 일체의 책임을 지지 않습니다.\n회원은 주문 내용을 확인하였고, 결제에 동의합니다.",
        style: TextStyle(
          color: const Color(0xFFB8B8B8),
          fontSize: 40.sp,
          fontFamily: 'Core_Gothic_D4',
        ),
      ),
    );
  }
}

class BottomOutlinedButtonWidget extends GetView<OrderController> {
  BottomOutlinedButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.cartMenus.length > 0
          ? Padding(
              padding: EdgeInsets.only(
                bottom: 150.h,
                left: 100.w,
                right: 100.w,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 700.w,
                    height: 200.h,
                    child: OutlinedButton(
                      onPressed: () {
                        Get.put(RoomController()).selectedTime.value =
                            TimeOfDay.now();
                        // Get.put(RoomController()).selectedTime2.value =
                        //     DateTime.now();
                        Get.toNamed(
                            '/order=${Get.parameters["orderIdx"]}/roomSetting');
                      },
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(
                            color: Color(0xFFFF8800), width: 1),
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
                        "방 만들기",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 70.sp,
                          fontFamily: 'Core_Gothic_D5',
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 490.w,
                    height: 200.h,
                    child: OutlinedButton(
                      onPressed: () => Get.toNamed(
                          '/store=${Get.parameters["orderIdx"]}/orderResult'),
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(
                            color: Color(0xFFFF8800), width: 1),
                        backgroundColor: Colors.white,
                        primary: const Color(0xFFFF8800),
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
                        "바로 주문",
                        style: TextStyle(
                          color: const Color(0xFFFF8800),
                          fontSize: 70.sp,
                          fontFamily: 'Core_Gothic_D5',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          : SizedBox(),
    );
  }
}
