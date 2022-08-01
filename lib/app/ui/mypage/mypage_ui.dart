import 'package:delivery_service/app/controller/main/main_controller.dart';
import 'package:get/get.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:carousel_slider/carousel_slider.dart';

import 'package:delivery_service/app/controller/mypage/mypage_controller.dart';

class MyPageUi extends GetView<MyPageController> {
  MyPageUi({Key? key}) : super(key: key);

  @override
  final MyPageController controller = Get.find();

  @override
  Widget build(BuildContext context) => Obx(
        () => Scaffold(
          resizeToAvoidBottomInset: controller.temp.value,
          backgroundColor: Colors.white,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(200.h),
            child: Padding(
              padding: EdgeInsets.only(top: 20.h),
              child: AppBar(
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
                  "마이페이지",
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
            ),
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
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    MypageProfileWidget(),
                    Container(color: Color(0xFFECECEC), height: 20.h),
                    SetAddress(),
                    Container(color: Color(0xFFECECEC), height: 20.h),
                    MyPageOrderHistoryWidget(),
                    Container(color: Color(0xFFECECEC), height: 20.h),
                    MyPageFavoritesWidget(),
                    Container(color: Color(0xFFECECEC), height: 20.h),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
}

class MypageProfileWidget extends GetView<MyPageController> {
  MypageProfileWidget({Key? key}) : super(key: key);

  final MainController mainController = Get.put(MainController());

  @override
  Widget build(BuildContext context) => Obx(
        () => SizedBox(
          width: 1440.w,
          height: 500.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(width: 100.w),
              Container(
                width: 400.w,
                height: 400.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: NetworkImage(
                          mainController.currentMember.value.photo),
                      fit: BoxFit.cover),
                ),
              ),
              SizedBox(width: 70.w),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          mainController.currentMember.value.nickname,
                          style: TextStyle(
                            color: const Color(0xFF333333),
                            fontSize: 80.sp,
                            fontFamily: 'Core_Gothic_D5',
                          ),
                        ),
                        TextButton(
                          onPressed: () => Get.toNamed('/mypage/user/update'),
                          style: TextButton.styleFrom(
                            minimumSize: Size.zero,
                            padding: EdgeInsets.zero,
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            // splashFactory: NoSplash.splashFactory,
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
                    SizedBox(height: 20.h),
                    Text(
                      mainController.currentMember.value.name,
                      style: TextStyle(
                        color: const Color(0xFF9B9B9B),
                        fontSize: 50.sp,
                        fontFamily: 'Core_Gothic_D5',
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      (mainController.currentMember.value.phone)
                          .replaceAllMapped(RegExp(r'(\d{3})(\d{3,4})(\d{4})'),
                              (m) => '${m[1]}-${m[2]}-${m[3]}'),
                      style: TextStyle(
                        color: const Color(0xFF9B9B9B),
                        fontSize: 50.sp,
                        fontFamily: 'Core_Gothic_D5',
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 100.w),
            ],
          ),
        ),
      );
}

class SetAddress extends StatelessWidget {
  const SetAddress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1440.w,
      height: 315.h,
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 100.w,
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
            SizedBox(height: 30.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "서울 중구 퇴계로36길 2 910호",
                  style: TextStyle(
                    color: const Color(0xFF333333),
                    fontSize: 60.sp,
                    fontFamily: 'Core_Gothic_D5',
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    minimumSize: Size.zero,
                    padding: EdgeInsets.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    // splashFactory: NoSplash.splashFactory,
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

class MyPageOrderHistoryWidget extends GetView<MyPageController> {
  const MyPageOrderHistoryWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Obx(
        () => SizedBox(
          width: 1440.w,
          height: 1020.h,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 100.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
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
                    TextButton(
                      onPressed: () => Get.toNamed('/mypage/order/history'),
                      style: TextButton.styleFrom(
                        minimumSize: Size.zero,
                        padding: EdgeInsets.zero,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        // splashFactory: NoSplash.splashFactory,
                      ),
                      child: Text(
                        "더보기",
                        style: TextStyle(
                          color: const Color(0xFF333333),
                          fontSize: 50.sp,
                          fontFamily: 'Core_Gothic_D5',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 70.h,
              ),
              controller.orderHistory.isEmpty
                  ? const MyPageOrderHistoryContentEmptyWidget()
                  : const MyPageOrderHistoryContentWidget(),
            ],
          ),
        ),
      );
}

class MyPageOrderHistoryContentEmptyWidget extends StatelessWidget {
  const MyPageOrderHistoryContentEmptyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.all(20),
        height: 250,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.sailing_rounded,
              color: Colors.grey.shade300,
              size: 150.w,
            ),
            SizedBox(height: 30.h),
            Text(
              "주문 내역이 없습니다.",
              style: TextStyle(
                color: Colors.grey.shade300,
                fontSize: 70.sp,
              ),
            )
          ],
        ),
      );
}

class MyPageOrderHistoryContentWidget extends GetView<MyPageController> {
  const MyPageOrderHistoryContentWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Obx(
        () => CarouselSlider(
          options: CarouselOptions(
            height: 712.h,
            viewportFraction: 0.4,
            enableInfiniteScroll: false,
            padEnds: false,
          ),
          items: controller.orderHistory
              .map(
                (value) => Padding(
                  // padding: controller.orderHistory.indexOf(value) == 0
                  //     ? EdgeInsets.only(left: 100.w, right: 50.w)
                  //     : controller.orderHistory.indexOf(value) ==
                  //             controller.orderHistory.length - 1
                  //         ? EdgeInsets.only(left: 50.w, right: 100.w)
                  //         : EdgeInsets.symmetric(horizontal: 50.w),
                  padding: EdgeInsets.symmetric(horizontal: 50.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(15)),
                              child: Image.asset(
                                value["img"],
                                width: 500.w,
                                height: 500.h,
                              ),
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
                      ),
                      SizedBox(height: 30.h),
                      Text(
                        value["storeName"],
                        style: TextStyle(
                          color: const Color(0xFF333333),
                          fontSize: 60.sp,
                          fontFamily: 'Core_Gothic_D5',
                        ),
                      ),
                      SizedBox(height: 30.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            value["price"],
                            style: TextStyle(
                              color: const Color(0xFF333333),
                              fontSize: 50.sp,
                              fontFamily: 'Core_Gothic_D5',
                            ),
                          ),
                          const Spacer(),
                          Text(
                            value["numberOfPeople"],
                            style: TextStyle(
                              color: const Color(0xFFFF8800),
                              fontSize: 50.sp,
                              fontFamily: 'Core_Gothic_D5',
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
              .toList(),
        ),
      );
}

class MyPageFavoritesWidget extends GetView<MyPageController> {
  const MyPageFavoritesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Obx(
        () => Container(
          // color: Colors.indigo,
          width: 1440.w,
          height: 920.h,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 100.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "즐겨찾기",
                      style: TextStyle(
                        color: const Color(0xFF333333),
                        fontSize: 70.sp,
                        fontFamily: 'Core_Gothic_D6',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(
                      onPressed: () => Get.toNamed('/mypage/favorites/all'),
                      style: TextButton.styleFrom(
                        minimumSize: Size.zero,
                        padding: EdgeInsets.zero,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        // splashFactory: NoSplash.splashFactory,
                      ),
                      child: Text(
                        "더보기",
                        style: TextStyle(
                          color: const Color(0xFF333333),
                          fontSize: 50.sp,
                          fontFamily: 'Core_Gothic_D5',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 70.h,
              ),
              controller.orderHistory.isEmpty
                  ? const MyPageFavoritesContentEmptyWidget()
                  : const MyPageFavoritesContentWidget(),
            ],
          ),
        ),
      );
}

class MyPageFavoritesContentEmptyWidget extends StatelessWidget {
  const MyPageFavoritesContentEmptyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.all(20),
        height: 613.h,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.sailing_rounded,
              color: Colors.grey.shade300,
              size: 150.w,
            ),
            SizedBox(height: 30.h),
            Text(
              "즐겨찾기가 없습니다.",
              style: TextStyle(
                color: Colors.grey.shade300,
                fontSize: 70.sp,
              ),
            )
          ],
        ),
      );
}

class MyPageFavoritesContentWidget extends GetView<MyPageController> {
  const MyPageFavoritesContentWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Obx(
        () => CarouselSlider(
          options: CarouselOptions(
            height: 613.h,
            viewportFraction: 0.4,
            enableInfiniteScroll: false,
            padEnds: false,
          ),
          items: controller.favorites
              .map(
                (value) => Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 50.w,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(15)),
                              child: Image.asset(
                                value["img"],
                                width: 500.w,
                                height: 500.h,
                              ),
                            ),
                            Positioned(
                              top: 30.h,
                              right: 30.w,
                              child: Image.asset(
                                "assets/icons/full_heart.png",
                                width: 60.w,
                                height: 60.h,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      Text(
                        value["storeName"],
                        style: TextStyle(
                          color: const Color(0xFF333333),
                          fontSize: 60.sp,
                          fontFamily: 'Core_Gothic_D5',
                        ),
                      ),
                    ],
                  ),
                ),
              )
              .toList(),
        ),
      );
}
