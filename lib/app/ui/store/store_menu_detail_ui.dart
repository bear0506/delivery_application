import 'package:get/get.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:delivery_service/app/core/values/colors.dart';

import 'package:delivery_service/app/controller/store/store_controller.dart';
import 'package:intl/intl.dart';

class StoreMenuDetailUi extends GetView<StoreController> {
  StoreMenuDetailUi({Key? key}) : super(key: key);

  get math => null;

  final storeController = Get.put(StoreController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: NestedScrollView(
        physics: const ClampingScrollPhysics(),
        controller: storeController.scrollController.value,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            Obx(
              () => SliverAppBar(
                elevation: 0,
                expandedHeight: 700.h,
                automaticallyImplyLeading: false,
                titleSpacing: 0,
                backgroundColor: Colors.white,
                pinned: true,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: Image.asset(
                        "assets/icons/back.png",
                        color: Color.lerp(
                          const Color(0xFFFFFFFF),
                          const Color(0xFF333333),
                          storeController.extentRatio.value,
                        ),
                        width: 80.w,
                        height: 60.h,
                      ),
                      onPressed: () => Get.back(),
                    ),
                    Expanded(
                      child: Text(
                        storeController.currentMenu.value.name,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: Color.lerp(
                            const Color(0x00FFFFFF),
                            const Color(0xFF333333),
                            storeController.extentRatio.value,
                          ),
                          fontSize: 60.sp,
                          fontFamily: 'Core_Gothic_D5',
                        ),
                      ),
                    ),
                  ],
                ),
                flexibleSpace: FlexibleSpaceBar(
                  background: Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/icons/ch.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ];
        },
        body: Theme(
          data: Theme.of(context).copyWith(
            // accentColor: Color(0xff936c3b), // Previously it was implemented like this
            colorScheme: ColorScheme.fromSwatch(
              accentColor: Colors.transparent,
            ), // but now it should be declared like this
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
                  MenuTitle(),
                  const Divider(
                    color: Color(0xFFECECEC),
                    thickness: 5,
                  ),
                  SideMenu(),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomOutlinedButtonWidget(),
    );
  }
}

class MenuTitle extends GetView<StoreController> {
  MenuTitle({
    Key? key,
  }) : super(key: key);

  final StoreController storeController = Get.put(StoreController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        color: Colors.white,
        height: 630.h,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 100.w,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 80.h,
                  ),
                  Text(
                    storeController.currentMenu.value.name,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 80.sp,
                      fontFamily: 'Core_Gothic_D5',
                    ),
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  Text(
                    storeController.currentMenu.value.info,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: const Color(0xFFB8B8B8),
                      fontSize: 60.sp,
                      fontFamily: 'Core_Gothic_D4',
                    ),
                  ),
                  SizedBox(
                    height: 100.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        NumberFormat('###,###,###,###')
                                .format(storeController.menuPrice.value)
                                .replaceAll(" ", "") +
                            "원",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 80.sp,
                          fontFamily: 'Core_Gothic_D5',
                        ),
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 100.w,
                            height: 100.h,
                            child: FloatingActionButton(
                              backgroundColor: const Color(0xFFEFEFEF),
                              splashColor: Colors.transparent,
                              elevation: 0,
                              onPressed: () {
                                storeController.onClickMenuCountMinus();
                              },
                              heroTag: "minus",
                              child: Image.asset(
                                "assets/icons/minus.png",
                                width: 50.w,
                                height: 50.h,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 60.w,
                          ),
                          Text(
                            // storeController.menuCount.value.toString(),
                            storeController.currentMenu.value.count.toString(),
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 80.sp,
                              fontFamily: 'Core_Gothic_D5',
                            ),
                          ),
                          SizedBox(
                            width: 60.w,
                          ),
                          SizedBox(
                            width: 100.w,
                            height: 100.h,
                            child: FloatingActionButton(
                              backgroundColor: const Color(0xFFEFEFEF),
                              splashColor: Colors.transparent,
                              elevation: 0,
                              onPressed: () {
                                storeController.onClickMenuCountPlus();
                              },
                              heroTag: "plus",
                              child: Image.asset(
                                "assets/icons/plus.png",
                                width: 50.w,
                                height: 50.h,
                              ),
                            ),
                          ),
                        ],
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

class SideMenu extends GetView<StoreController> {
  SideMenu({Key? key}) : super(key: key);

  final StoreController storeController = Get.put(StoreController());

  @override
  Widget build(BuildContext context) => Obx(
        () => Padding(
          padding: EdgeInsets.symmetric(horizontal: 100.w),
          child: SizedBox(
            width: 1440.w,
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: storeController.currentMenu.value.menuOptionTab.length,
              itemBuilder: (BuildContext context, int index) {
                var menuOptionTab =
                    storeController.currentMenu.value.menuOptionTab[index];

                return Column(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 30.h),
                      child: Text(
                        menuOptionTab.name,
                        style: TextStyle(
                          color: const Color(0xFF333333),
                          fontSize: 65.sp,
                          fontFamily: 'Core_Gothic_D5',
                        ),
                      ),
                    ),
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: menuOptionTab.menuOption.length,
                      itemBuilder: (BuildContext context, int index) {
                        var menuOption = menuOptionTab.menuOption[index];

                        return Container(
                          width: 1440.w,
                          child: InkWell(
                            onTap: () {
                              menuOption.check.value = !menuOption.check.value;
                              storeController.onChangeMenuPrice();
                            },
                            child: Obx(
                              () => Container(
                                // color: Colors.amber,
                                child: Row(
                                  children: [
                                    Theme(
                                      data: ThemeData(
                                        unselectedWidgetColor:
                                            Color(0xFFFF8800),
                                      ),
                                      child: Checkbox(
                                        // checkColor: Color(0xFFFF8800),
                                        checkColor: Colors.white,
                                        activeColor: Color(0xFFFF8800),
                                        value: menuOption.check.value,
                                        // value: tempCheck,
                                        onChanged: (bool? value) {
                                          print(value);
                                        },
                                      ),
                                    ),
                                    Expanded(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        // crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            menuOption.name,
                                            style: TextStyle(
                                              color: const Color(0xFF333333),
                                              fontSize: 50.sp,
                                              fontFamily: 'Core_Gothic_D5',
                                            ),
                                          ),
                                          Text(
                                            "+ ${NumberFormat('###,###,###,###').format(menuOption.price).replaceAll(" ", "")}원",
                                            style: TextStyle(
                                              color: const Color(0xFFB8B8B8),
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
                            ),
                          ),
                        );
                      },
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 50.h),
                      child: Container(
                        color: Color(0xFFECECEC),
                        width: 1240.w,
                        height: 5.h,
                      ),
                    )
                  ],
                );
              },
            ),
          ),
        ),
      );
}

class BottomOutlinedButtonWidget extends StatelessWidget {
  BottomOutlinedButtonWidget({Key? key}) : super(key: key);

  final storeController = Get.put(StoreController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 100.w, vertical: 50.h),
      child: SizedBox(
        width: 1240.w,
        height: 200.h,
        child: OutlinedButton(
          // onPressed: () => Get.toNamed(
          //     '/store=${storeController.storeIdx}/storeMenuDetail=${Get.parameters["menuIdx"]}/storeOrder'),
          onPressed: () {
            storeController.handleCartUpdateProvider();
          },
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
            "담기",
            style: TextStyle(
              color: Colors.white,
              fontSize: 70.sp,
              fontFamily: 'Core_Gothic_D5',
            ),
          ),
        ),
      ),
    );
  }
}
