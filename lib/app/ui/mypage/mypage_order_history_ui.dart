import 'package:delivery_service/app/controller/mypage/mypage_controller.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'package:shimmer/shimmer.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:delivery_service/app/controller/mypage/mypage_controller.dart';

class MyPageOrderHistoryUi extends GetView<MyPageController> {
  const MyPageOrderHistoryUi({Key? key}) : super(key: key);

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
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: controller.isLoaderVisible.value == false
                      ? const OrderHistoryShimmerWidget()
                      : const OrderHistoryWidget(),
                ),
              ),
            ),
          ),
        ),
      );
}

class OrderHistoryWidget extends GetView<MyPageController> {
  const OrderHistoryWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Obx(
        () => controller.orders.isEmpty
            ? const OrderHistoryContentEmptyWidget()
            : const OrderHistoryContentWidget(),
      );
}

class OrderHistoryContentEmptyWidget extends StatelessWidget {
  const OrderHistoryContentEmptyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.all(20),
        width: Get.width,
        height: Get.height / 2 + 106,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.mode_comment_outlined,
              color: Colors.grey.shade300,
              size: 56,
            ),
            const SizedBox(height: 30),
            Text(
              "내역이 없습니다.",
              style: TextStyle(
                color: Colors.grey.shade300,
                fontSize: 26,
              ),
            )
          ],
        ),
      );
}

class OrderHistoryContentWidget extends GetView<MyPageController> {
  const OrderHistoryContentWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Obx(
        () => ListView.separated(
          shrinkWrap: true,
          itemCount: controller.orders.length,
          itemBuilder: (BuildContext context, int index) => Column(
            children: [
              InkWell(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Stack(
                      children: [
                        Image.asset(
                          "assets/icons/realc.png",
                          width: 500.w,
                          height: 500.h,
                        ),
                        Positioned(
                          top: 30.h,
                          right: 30.w,
                          child: Image.asset(
                            "assets/icons/heart.png",
                            width: 60.w,
                            height: 60.h,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 50.w,
                    ),
                    Expanded(
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.start,
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  controller.orders[index].storeName,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: const Color(0xFF333333),
                                    fontSize: 80.sp,
                                    fontFamily: 'Core_Gothic_D6',
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height: 30.h,
                                ),
                                Text(
                                  NumberFormat.currency(
                                              locale: "ko_KR", symbol: "")
                                          .format(
                                              controller.orders[index].price) +
                                      "원",
                                  style: TextStyle(
                                    color: const Color(0xFF333333),
                                    fontSize: 70.sp,
                                    fontFamily: 'Core_Gothic_D5',
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 90.h,
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  "${controller.orders[index].orderCount}명",
                                  style: TextStyle(
                                    color: const Color(0xFFFF8800),
                                    fontSize: 60.sp,
                                    fontFamily: 'Core_Gothic_D5',
                                  ),
                                ),
                                SizedBox(
                                  height: 30.h,
                                ),
                                Text(
                                  DateFormat("yyyy-MM-dd")
                                      .format(controller.orders[index].orderAt)
                                      .toString(),
                                  style: TextStyle(
                                    color: const Color(0xFF9B9B9B),
                                    fontSize: 50.sp,
                                    fontFamily: 'Core_Gothic_D5',
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                onTap: () {
                  Get.toNamed(
                      '/mypage/order/history/detail=${controller.orders[index].idx}');
                  controller.handleOrderHistoryProvider();
                },
              ),
            ],
          ),
          separatorBuilder: (BuildContext context, int index) => Padding(
            padding: EdgeInsets.symmetric(
              vertical: 50.h,
              horizontal: 10.w,
            ),
            child: const Divider(
              color: Color(0xFFECECEC),
              thickness: 1,
            ),
          ),
        ),
      );
}

class OrderHistoryShimmerWidget extends GetView<MyPageController> {
  const OrderHistoryShimmerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => ListView.separated(
        shrinkWrap: true,
        itemCount: controller.orders.length,
        itemBuilder: (BuildContext _, int index) => Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Shimmer.fromColors(
                  baseColor: Colors.grey.shade300,
                  highlightColor: Colors.grey.shade100,
                  child: Container(
                    width: 500.w,
                    height: 500.h,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 50.w,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Shimmer.fromColors(
                              baseColor: Colors.grey.shade300,
                              highlightColor: Colors.grey.shade100,
                              child: Container(
                                width: 538.w,
                                height: 111.h,
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
                                width: 285.w,
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
                      ],
                    ),
                    SizedBox(
                      height: 90.h,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 467.w,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Shimmer.fromColors(
                              baseColor: Colors.grey.shade300,
                              highlightColor: Colors.grey.shade100,
                              child: Container(
                                width: 90.w,
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
                                width: 273.w,
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
                        )
                      ],
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
        separatorBuilder: (BuildContext context, int index) => Padding(
          padding: EdgeInsets.symmetric(
            vertical: 50.h,
            horizontal: 10.w,
          ),
          child: const Divider(
            color: Color(0xFFECECEC),
            thickness: 1,
          ),
        ),
      );
}
