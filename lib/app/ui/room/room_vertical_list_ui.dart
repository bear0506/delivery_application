import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import 'package:step_progress_indicator/step_progress_indicator.dart';

import 'package:delivery_service/app/controller/room/room_controller.dart';
import 'package:delivery_service/app/controller/store/store_controller.dart';

class RoomVerticalListUi extends GetView<RoomController> {
  RoomVerticalListUi({Key? key}) : super(key: key);

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
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "당신만 오면",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 80.sp,
                    fontFamily: 'Core_Gothic_D7',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  " 고!",
                  style: TextStyle(
                    color: const Color(0xFFFF7700),
                    fontSize: 80.sp,
                    fontFamily: 'Core_Gothic_D7',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                PopupMenuButton(
                  icon: Image.asset(
                    "assets/icons/category.png",
                    width: 60.w,
                    height: 58.h,
                  ),
                  itemBuilder: (context) => [
                    PopupMenuItem(
                      height: 500.h,
                      child: Obx(
                        () => Row(
                          children: [
                            Column(
                              children: [
                                SizedBox(
                                  width: 740.w,
                                  child: RadioListTile(
                                    title: Text(
                                      "인기순",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 40.sp,
                                        fontFamily: 'Core_Gothic_D5',
                                      ),
                                    ),
                                    value: Sort.popularity,
                                    groupValue: controller.sort.value,
                                    onChanged: (Sort? value) {
                                      controller.sort.value = value!;
                                      Get.back();
                                    },
                                    activeColor: const Color(0xFFFF8800),
                                  ),
                                ),
                                SizedBox(
                                  width: 740.w,
                                  child: RadioListTile(
                                    title: Text(
                                      "신규순",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 40.sp,
                                        fontFamily: 'Core_Gothic_D5',
                                      ),
                                    ),
                                    value: Sort.newOrder,
                                    groupValue: controller.sort.value,
                                    onChanged: (Sort? value) {
                                      controller.sort.value = value!;
                                      Get.back();
                                    },
                                    activeColor: const Color(0xFFFF8800),
                                  ),
                                ),
                                SizedBox(
                                  width: 740.w,
                                  child: RadioListTile(
                                    title: Text(
                                      "빠른시간순",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 40.sp,
                                        fontFamily: 'Core_Gothic_D5',
                                      ),
                                    ),
                                    value: Sort.quickTimeOrder,
                                    groupValue: controller.sort.value,
                                    onChanged: (Sort? value) {
                                      controller.sort.value = value!;
                                      Get.back();
                                    },
                                    activeColor: const Color(0xFFFF8800),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    PopupMenuItem(
                      height: 500.h,
                      child: Obx(
                        () => Row(
                          children: [
                            Column(
                              children: [
                                SizedBox(
                                  width: 740.w,
                                  child: RadioListTile(
                                    title: Text(
                                      "배달비↑",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 40.sp,
                                        fontFamily: 'Core_Gothic_D5',
                                      ),
                                    ),
                                    value: Sort.delieveryCostMuch,
                                    groupValue: controller.sort.value,
                                    onChanged: (Sort? value) {
                                      controller.sort.value = value!;
                                      Get.back();
                                    },
                                    activeColor: const Color(0xFFFF8800),
                                  ),
                                ),
                                SizedBox(
                                  width: 740.w,
                                  child: RadioListTile(
                                    title: Text(
                                      "배달비↓",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 40.sp,
                                        fontFamily: 'Core_Gothic_D5',
                                      ),
                                    ),
                                    value: Sort.delieveryCostLess,
                                    groupValue: controller.sort.value,
                                    onChanged: (Sort? value) {
                                      controller.sort.value = value!;
                                      Get.back();
                                    },
                                    activeColor: const Color(0xFFFF8800),
                                  ),
                                ),
                                SizedBox(
                                  width: 740.w,
                                  child: RadioListTile(
                                    title: Text(
                                      "인원순",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 40.sp,
                                        fontFamily: 'Core_Gothic_D5',
                                      ),
                                    ),
                                    value: Sort.numberOfPeople,
                                    groupValue: controller.sort.value,
                                    onChanged: (Sort? value) {
                                      controller.sort.value = value!;
                                      Get.back();
                                    },
                                    activeColor: const Color(0xFFFF8800),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          ListView.separated(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: controller.rooms.length,
            itemBuilder: (BuildContext context, index) =>
                Align(child: RoomCardWidget(roomInfo: controller.rooms[index])),
            separatorBuilder: (BuildContext context, int index) => Divider(
              thickness: 1,
              indent: 100.w,
              endIndent: 100.w,
            ),
          ),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class RoomCardWidget extends GetView<RoomController> {
  dynamic roomInfo;

  RoomCardWidget({required this.roomInfo, Key? key}) : super(key: key);

  final storeController = Get.put(StoreController());
  final roomController = Get.put(RoomController());

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed("/store=" + roomInfo.storeIdx.toString());
        storeController.handleStoreInitProvider();
        // roomController.handleRoomsInStoreProvider();
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20.h, horizontal: 0),
        height: 400.h,
        width: 1240.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color(0xFFF9F9F9),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 300.h,
              width: 300.w,
              child: Image.asset(
                // "assets/icons/c.png",
                roomInfo.storeIdx == 1
                    ? "assets/icons/c.png"
                    : (roomInfo.storeIdx == 2
                        ? "assets/icons/happyhouse.jpg"
                        : "assets/icons/dd.jpg"),
                fit: BoxFit.contain,
              ),
            ),
            Container(
              height: 300.h,
              width: 785.w,
              margin: EdgeInsets.only(
                left: 50.w,
              ),
              child: Column(
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      SizedBox(
                        width: 550.w,
                        child: Text(
                          roomInfo.storeName,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 55.sp,
                            fontFamily: 'Core_Gothic_D5',
                          ),
                        ),
                      ),
                      Container(
                        width: 210.w,
                        height: 70.h,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(36),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.grey,
                              spreadRadius: 0.01,
                              blurRadius: 1,
                              offset: Offset(0.3, 1.2),
                            ),
                          ],
                        ),
                        child: Container(
                          alignment: Alignment.center,
                          child: TweenAnimationBuilder<Duration>(
                            duration: const Duration(minutes: 3),
                            tween: Tween(
                              begin: const Duration(minutes: 3),
                              end: Duration.zero,
                            ),
                            builder: (BuildContext context, Duration value,
                                Widget? child) {
                              final minutes =
                                  value.inMinutes.toString().padLeft(2, '0');
                              final seconds = (value.inSeconds % 60)
                                  .toString()
                                  .padLeft(2, '0');
                              return Text(
                                '$minutes:$seconds',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 40.sp,
                                  fontFamily: 'Core_Gothic_D5',
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 70.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        roomInfo.memName,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 40.sp,
                          fontFamily: 'Core_Gothic_D4',
                        ),
                      ),
                      Text(
                        // roomInfo['distance'],
                        "123m",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 40.sp,
                          fontFamily: 'Core_Gothic_D3',
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 50.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        '배달비',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: const Color(0xFFFF8800),
                          fontSize: 40.sp,
                          fontFamily: 'Core_Gothic_D5',
                        ),
                      ),
                      SizedBox(
                        width: 20.w,
                      ),
                      Text(
                        NumberFormat.currency(locale: "ko_KR", symbol: "")
                                .format(roomInfo.deliveryFee) +
                            "원",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 40.sp,
                          fontFamily: 'Core_Gothic_D3',
                        ),
                      ),
                      const Spacer(),
                      Container(
                        width: 280.w,
                        height: 50.h,
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFB300),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(25),
                          ),
                          border: Border.all(
                            color: const Color(0xFFFFB300),
                          ),
                        ),
                        child: StepProgressIndicator(
                          padding: 1,
                          totalSteps:
                              roomInfo.maximumNum > 0 ? roomInfo.maximumNum : 2,
                          currentStep: roomInfo.currentNum,
                          size: 40.h,
                          selectedColor: const Color(0xFFFF4E00),
                          unselectedColor: const Color(0xFFFFFFFF),
                          roundedEdges: const Radius.circular(10),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
