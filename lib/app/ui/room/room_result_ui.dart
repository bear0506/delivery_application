import 'package:delivery_service/app/controller/store/store_controller.dart';
import 'package:get/get.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:delivery_service/app/controller/room/room_controller.dart';
import 'package:intl/intl.dart';

class RoomResultUi extends GetView<RoomController> {
  const RoomResultUi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: NestedScrollView(
        physics: const ClampingScrollPhysics(),
        controller: controller.scrollController2.value,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            Obx(
              () => SliverAppBar(
                elevation: 0,
                automaticallyImplyLeading: false,
                titleSpacing: 0,
                backgroundColor: Colors.white,
                pinned: controller.temptemp.value,
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
                          "assets/icons/x.png",
                          color: const Color(0xFF333333),
                          width: 60.w,
                          height: 60.h,
                        ),
                        // onPressed: () => Get.toNamed('/main'),
                        onPressed: () => Get.offAllNamed('/main'),
                      ),
                      SizedBox(
                        width: 20.w,
                      ),
                      Expanded(
                        child: Text(
                          "주문완료",
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
                  NoticeMent(),
                  // OrderList(),
                  OrderContentWidget(),
                  RoomInfoWidget(),
                  Container(
                    height: 20.h,
                    color: Color(0xFFECECEC),
                  ),
                  RoomTimeWidget(),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: const BottomOutlinedButtonWidget(),
    );
  }
}

class NoticeMent extends StatelessWidget {
  const NoticeMent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 100.w,
        top: 60.h,
      ),
      width: 1440.w,
      height: 240.h,
      child: Text(
        "방만들기가 완료되었습니다.",
        textAlign: TextAlign.left,
        style: TextStyle(
          color: const Color(0xFF333333),
          fontSize: 60.sp,
          fontFamily: 'Core_Gothic_D7',
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class OrderContentWidget extends GetView<RoomController> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        padding: EdgeInsets.symmetric(
          horizontal: 100.w,
        ),
        color: const Color(0xFFF2F2F2),
        width: 1440.w,
        height: 420.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  Get.put(StoreController()).store.value.name,
                  style: TextStyle(
                    color: const Color(0xFF333333),
                    fontSize: 60.sp,
                    fontFamily: 'Core_Gothic_D5',
                  ),
                ),
                SizedBox(
                  height: 60.h,
                ),
                Text(
                  "배달 주소",
                  style: TextStyle(
                    color: const Color(0xFF333333),
                    fontSize: 50.sp,
                    fontFamily: 'Core_Gothic_D5',
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                SizedBox(
                  width: 900.w,
                  child: Text(
                    controller.roomResult.value.address +
                        ", " +
                        controller.roomResult.value.detail,
                    maxLines: 2,
                    style: TextStyle(
                      color: const Color(0xFF333333),
                      overflow: TextOverflow.ellipsis,
                      fontSize: 45.sp,
                      fontFamily: 'Core_Gothic_D5',
                    ),
                  ),
                ),
              ],
            ),
            Image.asset(
              "assets/icons/c.png",
              width: 300.w,
              height: 300.h,
            ),
          ],
        ),
      ),
    );
  }
}

class RoomInfoWidget extends GetView<RoomController> {
  const RoomInfoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 1440.w,
      height: 302.h,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 100.w,
          vertical: 60.h,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "목표 인원",
              style: TextStyle(
                color: const Color(0xFFB8B8B8),
                fontSize: 50.sp,
                fontFamily: 'Core_Gothic_D4',
              ),
            ),
            Text(
              controller.roomResult.value.maximumNum.toString(),
              style: TextStyle(
                color: const Color(0xFF333333),
                fontSize: 60.sp,
                fontFamily: 'Core_Gothic_D5',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RoomTimeWidget extends GetView<RoomController> {
  const RoomTimeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SizedBox(
        width: 1440.w,
        height: 300.h,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 100.w,
            vertical: 60.h,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "주문 시간",
                style: TextStyle(
                  color: const Color(0xFFB8B8B8),
                  fontSize: 50.sp,
                  fontFamily: 'Core_Gothic_D4',
                ),
              ),
              Text(
                DateFormat('HH시 mm분').format(
                    DateTime.parse(controller.roomResult.value.timeLimit)),
                style: TextStyle(
                  color: const Color(0xFF333333),
                  fontSize: 60.sp,
                  fontFamily: 'Core_Gothic_D5',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BottomOutlinedButtonWidget extends StatelessWidget {
  const BottomOutlinedButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
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
            width: 490.w,
            height: 200.h,
            child: OutlinedButton(
              onPressed: () => Get.offAllNamed('/main'),
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
                "홈으로",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 70.sp,
                  fontFamily: 'Core_Gothic_D5',
                ),
              ),
            ),
          ),
          SizedBox(
            width: 700.w,
            height: 200.h,
            child: OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Color(0xFFFF8800), width: 1),
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
                "모임 확인",
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
    );
  }
}
