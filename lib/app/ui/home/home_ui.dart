import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:math';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import 'package:delivery_service/app/controller/home/home_controller.dart';

import 'package:delivery_service/common/my_flutter_app_icons.dart';
import 'package:delivery_service/app/ui/map/map_ui.dart';
import 'package:delivery_service/app/ui/list/list_ui.dart';

const navBarHeight = 10.0;

class HomeUi extends GetView<HomeController> {
  HomeUi({Key? key}) : super(key: key);

  final HomeController _homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
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
            Visibility(
              visible: _homeController.modalVisibility.value,
              child: Positioned(
                top: 430.h + MediaQuery.of(context).padding.top,
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  width: 1350.w,
                  height: 500.h,
                  child: Text(
                    _homeController.modalVisibility.value.toString(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 50.w,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: SlidingUpPanelWidget(),
      ),
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
          buildHeader(context),
          buildMenuItems(context),
        ],
      ),
    );
  }
}

Widget buildHeader(BuildContext context) => Container(
      height: 450.h + MediaQuery.of(context).padding.top,
      color: const Color(0xFFF5F5F5),
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top,
      ),
      child: Container(
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
    );

Widget buildMenuItems(BuildContext context) => ListView(
      padding: EdgeInsets.symmetric(vertical: 50.h, horizontal: 0),
      physics: const NeverScrollableScrollPhysics(),
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      children: <Widget>[
        SizedBox(
          height: 200.h,
          child: ListTile(
            leading: Icon(
              Icons.settings,
              size: 100.w,
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
            onTap: () {},
          ),
        ),
        Divider(
          height: 1.h,
          thickness: 1,
          indent: 75.w,
          endIndent: 75.w,
        ),
        SizedBox(
          height: 200.h,
          child: ListTile(
            leading: Icon(
              Icons.settings,
              size: 100.w,
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
            onTap: () {},
          ),
        ),
        Divider(
          height: 1.h,
          thickness: 1,
          indent: 75.w,
          endIndent: 75.w,
        ),
        SizedBox(
          height: 200.h,
          child: ListTile(
            leading: Icon(
              Icons.settings,
              size: 100.w,
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
            onTap: () {},
          ),
        ),
        Divider(
          height: 1.h,
          thickness: 1,
          indent: 75.w,
          endIndent: 75.w,
        ),
        SizedBox(
          height: 200.h,
          child: ListTile(
            leading: Icon(
              Icons.settings,
              size: 100.w,
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
            onTap: () {},
          ),
        ),
        Divider(
          height: 1.h,
          thickness: 1,
          indent: 75.w,
          endIndent: 75.w,
        ),
        SizedBox(
          height: 200.h,
          child: ListTile(
            leading: Icon(
              Icons.settings,
              size: 100.w,
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
        Divider(
          height: 1.h,
          thickness: 1,
          indent: 75.w,
          endIndent: 75.w,
        ),
        SizedBox(
          height: 200.h,
          child: ListTile(
            leading: Icon(
              Icons.settings,
              size: 100.w,
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
            onTap: () {},
          ),
        ),
      ],
    );

class AppbarWidget extends GetView<HomeController>
    implements PreferredSizeWidget {
  const AppbarWidget({Key? key}) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(420.h);

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
              Container(
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
                width: 1170.w,
                height: 160.h,
                child: TextField(
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 55.sp,
                    fontFamily: 'Core_Gothic_D',
                    fontWeight: FontWeight.w600,
                  ),
                  decoration: InputDecoration(
                    // contentPadding: EdgeInsets.all(35.w),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 50.h, horizontal: 60.w),
                    border: InputBorder.none,
                    hintText: '오늘의 메뉴를 알려주세요.',
                    suffixIcon: GestureDetector(
                      onTap: () {},
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 35.h, horizontal: 50.w),
                        child: Image.asset(
                          'assets/icons/search.png',
                        ),
                      ),
                    ),
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
