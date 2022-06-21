import 'package:get/get.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:delivery_service/app/controller/store/store_controller.dart';

class StoreListUi extends GetView<StoreController> {
  StoreListUi({Key? key}) : super(key: key);

  final storeController = Get.put(StoreController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(337.h),
        child: MyAppBar(storeController: storeController),
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
            controller: storeController.tabController2.value,
            children: storeController.myTabsData.map(
              (dynamic data) {
                final String img = data["img"].value.toString();
                final String storeName = data["storeName"].value.toString();
                final String time = data["time"].value.toString();
                final String starScore = data["starScore"].value.toString();
                final String reviewNumber =
                    data["reviewNumber"].value.toString();
                final String price = data["price"].value.toString();

                return SingleChildScrollView(
                  child: ListView.separated(
                    padding: EdgeInsets.symmetric(
                      vertical: 50.h,
                      horizontal: 100.w,
                    ),
                    shrinkWrap: true,
                    controller: storeController.scrollController3.value,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        width: 1240.w,
                        height: 600.h,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage(img), // 배경 이미지
                          ),
                          borderRadius: const BorderRadius.all(
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
                                    "assets/icons/heart.png",
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
                                          storeName,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 60.sp,
                                            fontFamily: 'Core_Gothic_D5',
                                          ),
                                        ),
                                        const Spacer(),
                                        Text(
                                          time,
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
                                      textBaseline: TextBaseline.ideographic,
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
                                          starScore,
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
                                          reviewNumber,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 40.sp,
                                            fontFamily: 'Core_Gothic_D5',
                                          ),
                                        ),
                                        const Spacer(),
                                        Text(
                                          "배달비 $price",
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
                    itemCount: storeController.myTabsData.length,
                  ),
                );
              },
            ).toList(),
          ),
        ),
      ),
    );
  }
}

class MyAppBar extends GetView<StoreController> {
  const MyAppBar({
    Key? key,
    required this.storeController,
  }) : super(key: key);

  final StoreController storeController;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Obx(
        () => AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: Padding(
            padding: EdgeInsets.only(
              left: 60.w,
              top: 10.h,
            ),
            child: IconButton(
              icon: Image.asset(
                "assets/icons/back.png",
                color: const Color(0xFF333333),
                width: 80.w,
                height: 60.h,
                alignment: Alignment.center,
              ),
              onPressed: () => Get.back(),
            ),
          ),
          leadingWidth: 240.w,
          title: Text(
            "전체",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 60.sp,
              fontFamily: 'Core_Gothic_D6',
              fontWeight: FontWeight.w600,
            ),
          ),
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
                                      groupValue: storeController.sort.value,
                                      onChanged: (Sort? value) {
                                        storeController.sort.value = value!;
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
                                      groupValue: storeController.sort.value,
                                      onChanged: (Sort? value) {
                                        storeController.sort.value = value!;
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
                                      groupValue: storeController.sort.value,
                                      onChanged: (Sort? value) {
                                        storeController.sort.value = value!;
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
                                      groupValue: storeController.sort.value,
                                      onChanged: (Sort? value) {
                                        storeController.sort.value = value!;
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
                                      groupValue: storeController.sort.value,
                                      onChanged: (Sort? value) {
                                        storeController.sort.value = value!;
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
                                      groupValue: storeController.sort.value,
                                      onChanged: (Sort? value) {
                                        storeController.sort.value = value!;
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
            preferredSize: Size.fromHeight(140.h),
            child: Container(
              color: Colors.grey[200],
              child: TabBar(
                isScrollable: true,
                unselectedLabelColor: const Color(0xFFB8B8B8),
                labelPadding: EdgeInsets.only(
                  left: 100.w,
                  top: 15.h,
                  right: 100.w,
                ),
                labelColor: const Color(0xFF333333),
                labelStyle: TextStyle(
                  height: 5.h,
                  color: Colors.black,
                  fontSize: 55.sp,
                  fontFamily: 'Core_Gothic_D5',
                ),
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorPadding: EdgeInsets.only(
                  left: 30.w,
                  top: 15.h,
                  right: 30.w,
                ),
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
                controller: storeController.tabController2.value,
                tabs: storeController.myTabs,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
