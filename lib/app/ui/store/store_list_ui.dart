import 'dart:convert';

import 'package:get/get.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:delivery_service/app/controller/store/store_controller.dart';
import 'package:delivery_service/app/controller/room/room_controller.dart';
import 'package:intl/intl.dart';

class StoreListUi extends GetView<StoreController> {
  StoreListUi({Key? key}) : super(key: key);

  final RoomController roomController = Get.put(RoomController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SafeArea(
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize:
                Size.fromHeight(MediaQuery.of(context).padding.top + 250.h),
            child: MyAppBar(),
          ),
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
              child: TabBarView(
                controller: controller.storeListUITabController.value,
                children: controller.categories.map(
                  (dynamic data) {
                    return SingleChildScrollView(
                      child: ListView.separated(
                        padding: EdgeInsets.symmetric(
                          vertical: 50.h,
                          horizontal: 100.w,
                        ),
                        shrinkWrap: true,
                        controller: controller.scrollController3.value,
                        itemBuilder: (BuildContext context, int index) {
                          return InkWell(
                            onTap: () {
                              Get.toNamed("/store=" +
                                  data.stores[index].idx.toString());
                              controller.handleStoreInitProvider();
                            },
                            child: Container(
                              width: 1240.w,
                              height: 600.h,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: AssetImage(
                                      "assets/icons/meat_store.png"), // 배경 이미지
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                      vertical: 30.h,
                                      horizontal: 30.w,
                                    ),
                                    child: Row(
                                      children: [
                                        const Spacer(),
                                        Image.asset(
                                          data.stores[index].favorite
                                              ? "assets/icons/heart_active.png"
                                              : "assets/icons/heart.png",
                                          width: 60.w,
                                          height: 60.h,
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Spacer(),
                                  Container(
                                    width: 1240.w,
                                    height: 5.h,
                                    decoration: const BoxDecoration(
                                      color: Color(0xFFFF8800),
                                    ),
                                  ),
                                  Container(
                                    width: 1240.w,
                                    height: 230.h,
                                    decoration: BoxDecoration(
                                      color: Colors.black.withOpacity(0.6),
                                      borderRadius: const BorderRadius.only(
                                        bottomLeft: Radius.circular(10),
                                        bottomRight: Radius.circular(10),
                                      ),
                                    ),
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                            vertical: 30.h,
                                            horizontal: 40.w,
                                          ),
                                          child: Row(
                                            children: [
                                              Text(
                                                data.stores[index].name,
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 60.sp,
                                                  fontFamily: 'Core_Gothic_D5',
                                                ),
                                              ),
                                              const Spacer(),
                                              Text(
                                                data.stores[index].deliveryTime
                                                        .replaceAll(
                                                            "~", " ~ ") +
                                                    "분",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 40.sp,
                                                  fontFamily: 'Core_Gothic_D5',
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                            vertical: 10.h,
                                            horizontal: 40.w,
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.baseline,
                                            textBaseline:
                                                TextBaseline.ideographic,
                                            children: [
                                              Image.asset(
                                                "assets/icons/favorite2.png",
                                                width: 41.w,
                                                height: 41.h,
                                              ),
                                              SizedBox(
                                                width: 20.w,
                                              ),
                                              Text(
                                                "4.8",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 40.sp,
                                                  fontFamily: 'Core_Gothic_D5',
                                                ),
                                              ),
                                              SizedBox(
                                                width: 10.w,
                                              ),
                                              Text(
                                                "(15)",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 40.sp,
                                                  fontFamily: 'Core_Gothic_D5',
                                                ),
                                              ),
                                              const Spacer(),
                                              Text(
                                                "배달비 " +
                                                    NumberFormat(
                                                            '###,###,###,###')
                                                        .format(json
                                                            .decode(data
                                                                .stores[index]
                                                                .deliveryFee)
                                                            .values
                                                            .toList()
                                                            .first)
                                                        .replaceAll(" ", "") +
                                                    "원 ~",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 40.sp,
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
                            ),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) =>
                            Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 50.h,
                          ),
                          child: const Divider(
                            color: Color(0xFFECECEC),
                            thickness: 2,
                          ),
                        ),
                        itemCount: data.stores.length,
                      ),
                    );
                  },
                ).toList(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class MyAppBar extends GetView<StoreController> {
  MyAppBar({Key? key}) : super(key: key);

  // final StoreController _storeController = Get.put(StoreController());
  final RoomController roomController = Get.put(RoomController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => AppBar(
        toolbarHeight: MediaQuery.of(context).padding.top + 250.h,
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          padding: EdgeInsets.only(left: 20.w),
          icon: Image.asset(
            "assets/icons/back.png",
            color: const Color(0xFF333333),
            width: 80.w,
            height: 60.h,
            alignment: Alignment.center,
          ),
          onPressed: () => Get.back(),
        ),
        leadingWidth: 240.w,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              controller.categoryTabName.value,
              textAlign: TextAlign.center,
              style: TextStyle(
                // backgroundColor: Colors.pink,
                color: Colors.black,
                fontSize: 60.sp,
                fontFamily: 'Core_Gothic_D6',
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        titleSpacing: 0,
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(
              top: 10.h,
              right: 60.w,
            ),
            child: Row(
              children: [
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
                                    groupValue: roomController.sort.value,
                                    onChanged: (Sort? value) {
                                      roomController.sort.value = value!;
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
                                    groupValue: roomController.sort.value,
                                    onChanged: (Sort? value) {
                                      roomController.sort.value = value!;
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
                                    groupValue: roomController.sort.value,
                                    onChanged: (Sort? value) {
                                      roomController.sort.value = value!;
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
                                    groupValue: roomController.sort.value,
                                    onChanged: (Sort? value) {
                                      roomController.sort.value = value!;
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
                                    groupValue: roomController.sort.value,
                                    onChanged: (Sort? value) {
                                      roomController.sort.value = value!;
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
                                    groupValue: roomController.sort.value,
                                    onChanged: (Sort? value) {
                                      roomController.sort.value = value!;
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
                IconButton(
                  icon: Image.asset(
                    "assets/icons/search2.png",
                    color: const Color(0xFF333333),
                    width: 77.w,
                    height: 77.h,
                    alignment: Alignment.center,
                  ),
                  onPressed: () => Get.back(),
                ),
              ],
            ),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(137.h),
          child: Container(
            height: 137.h,
            color: Colors.grey[200],
            child: TabBar(
              padding: EdgeInsets.only(top: 10.h, left: 50.w, right: 50.w),
              unselectedLabelColor: const Color(0xFFB8B8B8),
              labelPadding: EdgeInsets.symmetric(horizontal: 50.w),
              controller: controller.storeListUITabController.value,
              labelColor: Colors.black,
              indicator: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(5),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    spreadRadius: 0.2,
                    blurRadius: 1,
                    offset: Offset(0.3, 0.3),
                  ),
                ],
              ),
              isScrollable: true,
              tabs: controller.categories
                  .map(
                    (e) => Center(
                      child: Text(
                        e.name,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 55.sp,
                          fontFamily: 'Core_Gothic_D5',
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }
}
