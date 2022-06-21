import 'package:get/get.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:delivery_service/app/controller/room/room_controller.dart';

class RoomUi extends GetView<RoomController> {
  RoomUi({Key? key}) : super(key: key);

  final roomController = Get.put(RoomController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: NestedScrollView(
        physics: const ClampingScrollPhysics(),
        controller: controller.scrollController.value,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            Obx(
              () => SliverAppBar(
                elevation: 0,
                expandedHeight: 200.h,
                collapsedHeight: 200.h,
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
                          color: const Color(0xFF333333),
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
                          "${roomController.roomInfos[0]['user'].toString()}님의 모임",
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
                  const Divider(
                    color: Color(0xFFECECEC),
                    thickness: 5,
                  ),
                  OrdererInformation(),
                  const Divider(
                    color: Color(0xFFECECEC),
                    thickness: 5,
                  ),
                  DeliveryFeeInformation(),
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

class StoreInformation extends StatelessWidget {
  StoreInformation({Key? key}) : super(key: key);

  final roomController = Get.put(RoomController());

  @override
  Widget build(BuildContext context) {
    return Container(
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
              roomController.roomInfos[0]['storeName'],
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
                  "${roomController.roomInfos[0]['starRate']}(${roomController.roomInfos[0]['reviewCount']})",
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
                  roomController.roomInfos[0]['deliveryTime'],
                  style: TextStyle(
                    color: const Color(0xFF333333),
                    fontSize: 50.sp,
                    fontFamily: 'Core_Gothic_D5',
                  ),
                ),
                const Spacer(),
                TextButton(
                  onPressed: () {},
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
    );
  }
}

class OrdererInformation extends StatelessWidget {
  OrdererInformation({Key? key}) : super(key: key);

  final roomController = Get.put(RoomController());

  @override
  Widget build(BuildContext context) {
    return Container(
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
                    roomController.roomInfos[0]['img'].toString(),
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
                      Row(
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
                          SizedBox(
                            width: 350.w,
                          ),
                          Text(
                            roomController.roomInfos[0]['user'],
                            style: TextStyle(
                              color: const Color(0xFF333333),
                              fontSize: 60.sp,
                              fontFamily: 'Core_Gothic_D6',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: 730.w,
                        height: 3.h,
                        color: const Color(0xFFD1D1D1),
                      ),
                      Row(
                        children: [
                          Text(
                            "주소",
                            style: TextStyle(
                              color: const Color(0xFF333333),
                              fontSize: 40.sp,
                              fontFamily: 'Core_Gothic_D5',
                            ),
                          ),
                          SizedBox(
                            width: 214.w,
                          ),
                          InkWell(
                            onTap: () {},
                            child: SizedBox(
                              child: Row(
                                children: [
                                  Text(
                                    roomController.roomInfos[0]['address'],
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
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "거래 횟수",
                            style: TextStyle(
                              color: const Color(0xFF333333),
                              fontSize: 40.sp,
                              fontFamily: 'Core_Gothic_D5',
                            ),
                          ),
                          SizedBox(
                            width: 489.w,
                          ),
                          Text(
                            "${roomController.roomInfos[0]['numberOfTransactions']}회",
                            style: TextStyle(
                              color: const Color(0xFFFF8800),
                              fontSize: 40.sp,
                              fontFamily: 'Core_Gothic_D5',
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "매너 점수",
                            style: TextStyle(
                              color: const Color(0xFF333333),
                              fontSize: 40.sp,
                              fontFamily: 'Core_Gothic_D5',
                            ),
                          ),
                          SizedBox(
                            width: 466.w,
                          ),
                          Text(
                            "${roomController.roomInfos[0]['mannerScore']}점",
                            style: TextStyle(
                              color: const Color(0xFFFF8800),
                              fontSize: 40.sp,
                              fontFamily: 'Core_Gothic_D5',
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DeliveryFeeInformation extends StatelessWidget {
  DeliveryFeeInformation({Key? key}) : super(key: key);

  final roomController = Get.put(RoomController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 100.w,
        top: 70.h,
        right: 100.w,
      ),
      child: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "배달비",
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "최초 배달비",
                  style: TextStyle(
                    color: const Color(0xFF333333),
                    fontSize: 60.sp,
                    fontFamily: 'Core_Gothic_D5',
                  ),
                ),
                SizedBox(
                  width: 730.w,
                ),
                Text(
                  "${roomController.roomInfos[0]['deliveryFee']}원",
                  style: TextStyle(
                    color: const Color(0xFF333333),
                    fontSize: 60.sp,
                    fontFamily: 'Core_Gothic_D5',
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 40.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "배달 할인",
                  style: TextStyle(
                    color: const Color(0xFF333333),
                    fontSize: 60.sp,
                    fontFamily: 'Core_Gothic_D5',
                  ),
                ),
                SizedBox(
                  width: 840.w,
                ),
                Text(
                  "-",
                  style: TextStyle(
                    color: const Color(0xFF333333),
                    fontSize: 60.sp,
                    fontFamily: 'Core_Gothic_D5',
                  ),
                ),
                SizedBox(
                  width: 30.w,
                ),
                Text(
                  "0원",
                  style: TextStyle(
                    color: const Color(0xFF333333),
                    fontSize: 60.sp,
                    fontFamily: 'Core_Gothic_D5',
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 40.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "인원 할인",
                  style: TextStyle(
                    color: const Color(0xFF333333),
                    fontSize: 60.sp,
                    fontFamily: 'Core_Gothic_D5',
                  ),
                ),
                SizedBox(
                  width: 840.w,
                ),
                Text(
                  "÷",
                  style: TextStyle(
                    color: const Color(0xFF333333),
                    fontSize: 60.sp,
                    fontFamily: 'Core_Gothic_D5',
                  ),
                ),
                SizedBox(
                  width: 30.w,
                ),
                Text(
                  "${roomController.roomInfos[0]['capacity']}명",
                  style: TextStyle(
                    color: const Color(0xFF333333),
                    fontSize: 60.sp,
                    fontFamily: 'Core_Gothic_D5',
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 45.h,
            ),
            Container(
              width: 1240.w,
              height: 4.h,
              color: const Color(0xFFAFAFAF),
            ),
            SizedBox(
              height: 45.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                SizedBox(
                  width: 794.w,
                ),
                Text(
                  "${roomController.roomInfos[0]['totalDeliveryFee']}원",
                  style: TextStyle(
                    color: const Color(0xFFFF8800),
                    fontSize: 70.sp,
                    fontFamily: 'Core_Gothic_D7',
                    fontWeight: FontWeight.bold,
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

class BottomOutlinedButtonWidget extends StatelessWidget {
  const BottomOutlinedButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 1440.w,
      height: 320.h,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 1440.w,
            height: 120.h,
            color: const Color(0xFFFF8800).withOpacity(0.2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "15,000원",
                  style: TextStyle(
                    color: const Color(0xFF5B5B5B),
                    fontSize: 45.sp,
                    fontFamily: 'Core_Gothic_D9',
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  "이상 더 주문하면",
                  style: TextStyle(
                    color: const Color(0xFF5B5B5B),
                    fontSize: 45.sp,
                    fontFamily: 'Core_Gothic_D9',
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  "배달할인 1,000원!",
                  style: TextStyle(
                    color: const Color(0xFF5B5B5B),
                    fontSize: 45.sp,
                    fontFamily: 'Core_Gothic_D9',
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          SizedBox(
            width: 1440.w,
            height: 200.h,
            child: InkWell(
              onTap: () {},
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
      ),
    );
  }
}
