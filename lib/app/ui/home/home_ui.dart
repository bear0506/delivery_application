import 'package:delivery_service/app/controller/main/main_controller.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'dart:math';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import 'package:delivery_service/app/controller/home/home_controller.dart';

import 'package:delivery_service/common/my_flutter_app_icons.dart';
import 'package:delivery_service/app/ui/map/map_ui.dart';
import 'package:delivery_service/app/ui/list/list_ui.dart';

import 'package:kpostal/kpostal.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

const navBarHeight = 10.0;

class HomeUi extends GetView<HomeController> {
  HomeUi({Key? key}) : super(key: key);

  // final HomeController _homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      drawer: const DrawerWidget(),
      appBar: const AppbarWidget(),
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          MapUi(),
          Positioned(
            right: 50.w,
            bottom: 80.h,
            child: SpeedDialWidget(),
          ),
          MapModalWidget(),
        ],
      ),
      bottomNavigationBar: SlidingUpPanelWidget(),
    );
  }
}

class DrawerWidget extends GetView<HomeController> {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: 1000.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          DrawerWidgetHeader(),
          buildMenuItems(context),
        ],
      ),
    );
  }
}

class DrawerWidgetHeader extends GetView<HomeController> {
  final HomeController homeController = Get.find();
  final MainController mainController = Get.put(MainController());

  @override
  Widget build(BuildContext context) {
    print(mainController.currentMember.value.idx);

    return Obx(
      () => mainController.currentMember.value.idx == 0
          ? Container(
              height: 450.h + MediaQuery.of(context).padding.top,
              color: const Color(0xFFF5F5F5),
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).padding.top,
              ),
              child: Container(
                // color: Colors.amber,
                padding: EdgeInsets.all(75.w),
                child: InkWell(
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/icons/userIcon.png',
                        height: 250.h,
                        width: 250.w,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 80.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '로그인/회원가입',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 60.sp,
                                fontFamily: 'Core_Gothic_D5',
                              ),
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            Text(
                              '자유롭게 배달띱을 즐겨보아요',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                color: const Color(0xFF9B9B9B),
                                fontSize: 35.sp,
                                fontFamily: 'Core_Gothic_D4',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  onTap: () => Get.toNamed('/signin'),
                ),
              ),
            )
          : Container(
              height: 450.h + MediaQuery.of(context).padding.top,
              color: const Color(0xFFF5F5F5),
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).padding.top,
              ),
              child: Container(
                // color: Colors.amber,
                padding: EdgeInsets.all(75.w),
                child: Row(
                  children: [
                    Container(
                      width: 250.w,
                      height: 250.h,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: NetworkImage(
                                mainController.currentMember.value.photo),
                            fit: BoxFit.cover),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 80.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            mainController.currentMember.value.nickname + " 님",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 60.sp,
                              fontFamily: 'Core_Gothic_D5',
                            ),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Text(
                            '환영합니다!',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              color: const Color(0xFF9B9B9B),
                              fontSize: 35.sp,
                              fontFamily: 'Core_Gothic_D4',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}

Widget buildMenuItems(BuildContext context) {
  return ListView(
    padding: EdgeInsets.symmetric(
      vertical: 50.h,
    ),
    physics: const NeverScrollableScrollPhysics(),
    scrollDirection: Axis.vertical,
    shrinkWrap: true,
    children: <Widget>[
      SizedBox(
        height: 200.h,
        child: Padding(
          padding: EdgeInsets.only(
            left: 10.w,
          ),
          child: ListTile(
            leading: Image.asset(
              "assets/icons/my.png",
              width: 80.w,
              height: 80.h,
            ),
            horizontalTitleGap: 0,
            title: Text(
              '마이페이지',
              textAlign: TextAlign.start,
              style: TextStyle(
                color: Colors.black,
                fontSize: 60.sp,
                fontFamily: 'Core_Gothic_D5',
              ),
            ),
            onTap: () => Get.toNamed('/mypage'),
          ),
        ),
      ),
      Divider(
        height: 1.h,
        thickness: 1,
        indent: 60.w,
        endIndent: 60.w,
      ),
      SizedBox(
        height: 200.h,
        child: Padding(
          padding: EdgeInsets.only(
            left: 10.w,
          ),
          child: ListTile(
            leading: Image.asset(
              "assets/icons/notice.png",
              width: 80.w,
              height: 80.h,
            ),
            horizontalTitleGap: 0,
            title: Text(
              '공지',
              textAlign: TextAlign.start,
              style: TextStyle(
                color: Colors.black,
                fontSize: 60.sp,
                fontFamily: 'Core_Gothic_D5',
              ),
            ),
            onTap: () => Get.toNamed('/notice'),
          ),
        ),
      ),
      Divider(
        height: 1.h,
        thickness: 1,
        indent: 60.w,
        endIndent: 60.w,
      ),
      SizedBox(
        height: 200.h,
        child: Padding(
          padding: EdgeInsets.only(
            left: 10.w,
          ),
          child: ListTile(
            leading: Image.asset(
              "assets/icons/event.png",
              width: 80.w,
              height: 80.h,
            ),
            horizontalTitleGap: 0,
            title: Text(
              '이벤트',
              textAlign: TextAlign.start,
              style: TextStyle(
                color: Colors.black,
                fontSize: 60.sp,
                fontFamily: 'Core_Gothic_D5',
              ),
            ),
            onTap: () => Get.toNamed('/event'),
          ),
        ),
      ),
      Divider(
        height: 1.h,
        thickness: 1,
        indent: 60.w,
        endIndent: 60.w,
      ),
      SizedBox(
        height: 200.h,
        child: Padding(
          padding: EdgeInsets.only(
            left: 10.w,
          ),
          child: ListTile(
            leading: Image.asset(
              "assets/icons/service.png",
              width: 80.w,
              height: 80.h,
            ),
            horizontalTitleGap: 0,
            title: Text(
              '고객지원',
              textAlign: TextAlign.start,
              style: TextStyle(
                color: Colors.black,
                fontSize: 60.sp,
                fontFamily: 'Core_Gothic_D5',
              ),
            ),
            onTap: () => Get.toNamed('/help'),
          ),
        ),
      ),
      Divider(
        height: 1.h,
        thickness: 1,
        indent: 60.w,
        endIndent: 60.w,
      ),
      SizedBox(
        height: 200.h,
        child: Padding(
          padding: EdgeInsets.only(
            left: 10.w,
          ),
          child: ListTile(
            leading: Image.asset(
              "assets/icons/how_to.png",
              width: 80.w,
              height: 80.h,
            ),
            horizontalTitleGap: 0,
            title: Text(
              '이용방법',
              textAlign: TextAlign.start,
              style: TextStyle(
                color: Colors.black,
                fontSize: 60.sp,
                fontFamily: 'Core_Gothic_D5',
              ),
            ),
            onTap: () {},
          ),
        ),
      ),
      Divider(
        height: 1.h,
        thickness: 1,
        indent: 60.w,
        endIndent: 60.w,
      ),
      SizedBox(
        height: 200.h,
        child: Padding(
          padding: EdgeInsets.only(
            left: 10.w,
          ),
          child: ListTile(
            leading: Image.asset(
              "assets/icons/setting.png",
              width: 80.w,
              height: 80.h,
            ),
            horizontalTitleGap: 0,
            title: Text(
              '설정',
              textAlign: TextAlign.start,
              style: TextStyle(
                color: Colors.black,
                fontSize: 60.sp,
                fontFamily: 'Core_Gothic_D5',
              ),
            ),
            onTap: () => Get.toNamed("/setting"),
          ),
        ),
      ),
    ],
  );
}

class AppbarWidget extends GetView<HomeController>
    implements PreferredSizeWidget {
  const AppbarWidget({Key? key}) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(470.h);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      automaticallyImplyLeading: false,
      elevation: 0,
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: <Color>[Colors.white, Colors.white.withOpacity(0)],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(height: 50.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                    child: Image.asset(
                      'assets/icons/menuBar.png',
                      width: 60.w,
                      height: 35.h,
                    ),
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(const CircleBorder()),
                      backgroundColor: MaterialStateProperty.all(Colors.white),
                      fixedSize: MaterialStateProperty.all(Size(134.w, 134.h)),
                      shadowColor:
                          MaterialStateProperty.all<Color>(Colors.black),
                    ),
                  ),
                  Text(
                    '배달띱',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: const Color(0xFFFF8800),
                      fontFamily: 'Jalnan',
                      fontSize: 90.sp,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      showDialog(
                        barrierLabel: "Label",
                        barrierDismissible: true,
                        barrierColor: Colors.black.withOpacity(0.5),
                        context: context,
                        builder: (BuildContext context) {
                          return Column(
                            children: [
                              Align(
                                alignment: Alignment.topRight,
                                child: ElevatedButton(
                                  onPressed: () {
                                    Get.back();
                                  },
                                  child: Image.asset(
                                    'assets/icons/category.png',
                                    width: 60.w,
                                    height: 58.h,
                                  ),
                                  style: ButtonStyle(
                                    shape: MaterialStateProperty.all(
                                      const CircleBorder(),
                                    ),
                                    backgroundColor: MaterialStateProperty.all(
                                      Colors.white,
                                    ),
                                    fixedSize: MaterialStateProperty.all(
                                      Size(134.w, 134.h),
                                    ),
                                    shadowColor:
                                        MaterialStateProperty.all<Color>(
                                      Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                              AlertDialog(
                                contentPadding:
                                    EdgeInsets.fromLTRB(30.w, 40.h, 30.w, 40.h),
                                content: Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 600.h,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          CategoryRadio(
                                            category: FoodCategory.all,
                                            tagName: "전체",
                                          ),
                                          CategoryRadio(
                                            category: FoodCategory.korean,
                                            tagName: "한식",
                                          ),
                                          CategoryRadio(
                                            category: FoodCategory.snackbar,
                                            tagName: "분식",
                                          ),
                                          CategoryRadio(
                                            category: FoodCategory.chicken,
                                            tagName: "치킨",
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          CategoryRadio(
                                            category: FoodCategory.pizza,
                                            tagName: "피자",
                                          ),
                                          CategoryRadio(
                                            category: FoodCategory.porkcutlets,
                                            tagName: "돈까스",
                                          ),
                                          CategoryRadio(
                                            category: FoodCategory.porkfeet,
                                            tagName: "족발",
                                          ),
                                          CategoryRadio(
                                            category: FoodCategory.steambath,
                                            tagName: "찜/탕",
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          CategoryRadio(
                                            category: FoodCategory.grilled,
                                            tagName: "구이",
                                          ),
                                          CategoryRadio(
                                            category: FoodCategory.chinese,
                                            tagName: "중식",
                                          ),
                                          CategoryRadio(
                                            category: FoodCategory.japanese,
                                            tagName: "일식",
                                          ),
                                          CategoryRadio(
                                            category:
                                                FoodCategory.sashimiSeafood,
                                            tagName: "회/해물",
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          CategoryRadio(
                                            category: FoodCategory.western,
                                            tagName: "양식",
                                          ),
                                          CategoryRadio(
                                            category: FoodCategory.cafe,
                                            tagName: "카페",
                                          ),
                                          CategoryRadio(
                                            category: FoodCategory.dessert,
                                            tagName: "디저트",
                                          ),
                                          CategoryRadio(
                                            category: FoodCategory.asian,
                                            tagName: "아시안",
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          CategoryRadio(
                                            category: FoodCategory.sandwich,
                                            tagName: "샌드위치",
                                          ),
                                          CategoryRadio(
                                            category: FoodCategory.burger,
                                            tagName: "버거",
                                          ),
                                          CategoryRadio(
                                            category: FoodCategory.mexican,
                                            tagName: "멕시칸",
                                          ),
                                          CategoryRadio(
                                            category: FoodCategory.bento,
                                            tagName: "도시락",
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Image.asset(
                      'assets/icons/category.png',
                      width: 60.w,
                      height: 58.h,
                    ),
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(const CircleBorder()),
                      backgroundColor: MaterialStateProperty.all(Colors.white),
                      fixedSize: MaterialStateProperty.all(Size(134.w, 134.h)),
                      shadowColor:
                          MaterialStateProperty.all<Color>(Colors.black),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 75.h,
              ),
              InkWell(
                onTap: () => Get.to(
                  () => KpostalView(
                    callback: (Kpostal result) {
                      print(result.address);
                      print(result.latitude.toString());
                      print(result.longitude.toString());
                    },
                  ),
                ),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(36),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          spreadRadius: 1,
                          blurRadius: 3,
                          offset: Offset(0.3, 0.3),
                        ),
                      ]),
                  width: 1340.w,
                  height: 160.h,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 60.w),
                        child: Text(
                          "배달주소",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: const Color(0xFFFF8800),
                            fontSize: 55.sp,
                            fontFamily: 'Core_Gothic_D5',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          "서울 중구 퇴계로 36길 2, 910호",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: const Color(0xFF333333),
                            fontSize: 45.sp,
                            fontFamily: 'Core_Gothic_D5',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(60.w),
                        child: Image.asset(
                          'assets/icons/arrow.png',
                          width: 50.w,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MapModalWidget extends GetView<HomeController> {
  final HomeController _homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Visibility(
        visible: _homeController.modalVisibility.value,
        child: Positioned(
          top: MediaQuery.of(context).padding.top,
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 20.h, horizontal: 0),
            width: 1240.w,
            height: 630.h,
            decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(
                  color: Colors.grey,
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: Offset(0.3, 1.2),
                ),
              ],
              borderRadius: BorderRadius.circular(20),
              color: const Color(0xFFF9F9F9),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 300.h,
                      width: 300.w,
                      child: Image.asset(
                        // roomInfo['img'],
                        "assets/icons/c.png",
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
                                  _homeController.currentRoom.value.idx != -1
                                      ? _homeController
                                          .currentRoom.value.storeName
                                      : "",
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
                                    builder: (BuildContext context,
                                        Duration value, Widget? child) {
                                      final minutes = value.inMinutes
                                          .toString()
                                          .padLeft(2, '0');
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
                                _homeController.currentRoom.value.idx != -1
                                    ? _homeController.currentRoom.value.memName
                                    : "",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 40.sp,
                                  fontFamily: 'Core_Gothic_D4',
                                ),
                              ),
                              Text(
                                _homeController.currentRoom.value.idx != -1
                                    ? "123m"
                                    : "",
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
                                _homeController.currentRoom.value.idx != -1
                                    ? _homeController
                                        .currentRoom.value.deliveryFee
                                        .toString()
                                    : "",
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
                                  totalSteps: 4,
                                  // currentStep: int.parse(roomInfo['capacity']),
                                  currentStep: 1,
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: 590.w,
                      height: 150.h,
                      child: OutlinedButton(
                        onPressed: () {},
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
                          "담으러가기",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 60.sp,
                            fontFamily: 'Core_Gothic_D5',
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 500.w,
                      height: 150.h,
                      child: OutlinedButton(
                        onPressed: () => _homeController.TurnOffMapModal(),
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(
                              color: Color(0xFFA1A1A1), width: 1),
                          backgroundColor: const Color(0xFFA1A1A1),
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
                          "닫기",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 60.sp,
                            fontFamily: 'Core_Gothic_D5',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class CategoryRadio extends GetView<HomeController> {
  FoodCategory category;
  String tagName;

  CategoryRadio({Key? key, required this.category, required this.tagName})
      : super(key: key);

  final HomeController _controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Expanded(
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: 50.w,
                height: 50.h,
                child: Radio(
                  value: category,
                  groupValue: _controller.foodCategory.value,
                  onChanged: (FoodCategory? value) {
                    _controller.foodCategory.value = value!;
                    Get.back();
                  },
                  activeColor: const Color(0xFFFF8800),
                ),
              ),
            ),
            Expanded(
              child: Text(
                tagName,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 40.sp,
                  fontFamily: 'Core_Gothic_D5',
                ),
              ),
            ),
          ],
        ),
        flex: 1,
      ),
    );
  }
}

class SpeedDialWidget extends GetView<HomeController> {
  final isDialOpen = ValueNotifier(true);

  SpeedDialWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 330.h),
      child: WillPopScope(
        onWillPop: () async {
          if (isDialOpen.value) {
            isDialOpen.value = false;
            return false;
          } else {
            return true;
          }
        },
        child: SpeedDial(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          overlayColor: Colors.grey[350],
          overlayOpacity: 0.7,
          spaceBetweenChildren: 15,
          elevation: 10,
          closeManually: true,
          openCloseDial: isDialOpen,
          buttonSize: Size(235.w, 235.h),
          childrenButtonSize: Size(280.w, 280.h),
          icon: Icon(
            MyFlutterApp.plus,
            size: 30.w,
          ).icon,
          activeIcon: Icon(
            MyFlutterApp.plus,
            size: 100.w,
          ).icon,
          animationSpeed: 200,
          animationAngle: (pi / 4) * 3,
          children: [
            SpeedDialChild(
              elevation: 200,
              child: Icon(
                MyFlutterApp.message,
                size: 100.w,
              ),
            ),
            SpeedDialChild(
              elevation: 200,
              child: Icon(
                MyFlutterApp.home,
                size: 100.w,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class SlidingUpPanelWidget extends GetView<HomeController> {
  SlidingUpPanelWidget({Key? key}) : super(key: key);

  double tempMargin = navBarHeight;

  @override
  Widget build(BuildContext context) {
    return SlidingUpPanel(
      maxHeight: MediaQuery.of(context).size.height,
      minHeight: 330.h,
      parallaxEnabled: true,
      parallaxOffset: 1,
      panelBuilder: (controller) => ListWidget(controller),
      collapsed: Container(
        decoration: const BoxDecoration(
          color: Color(0xFFFFF6EC),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24.0), topRight: Radius.circular(24.0)),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 35.h,
            ),
            Container(
              width: 150.w,
              height: 10.h,
              decoration: const BoxDecoration(
                  color: Color(0xFFBBBBBB),
                  borderRadius: BorderRadius.all(Radius.circular(24.0))),
            ),
            Container(
              height: 250.h,
              margin: EdgeInsets.only(
                top: 35.h,
                left: tempMargin,
                right: tempMargin,
              ),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24.0),
                    topRight: Radius.circular(24.0)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Container(),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "다른 메뉴",
                        style: TextStyle(
                          color: const Color(0xFFAA5500),
                          fontSize: 70.sp,
                          fontFamily: 'Core_Gothic_D',
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      Text(
                        "를 찾으시나요?",
                        style: TextStyle(
                          color: const Color(0xFF333333),
                          fontSize: 70.sp,
                          fontFamily: 'Core_Gothic_D',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Container(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(24.0),
        topRight: Radius.circular(24.0),
      ),
    );
  }
}
