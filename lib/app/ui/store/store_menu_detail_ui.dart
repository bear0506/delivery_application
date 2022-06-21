import 'package:get/get.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:delivery_service/app/core/values/colors.dart';

import 'package:delivery_service/app/controller/store/store_controller.dart';

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
                        storeController
                            .storeTempMenus[Get.parameters["menuIdx"]]!.name,
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
                children: const [
                  MenuTitle(),
                  Divider(
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

class MenuTitle extends StatefulWidget {
  const MenuTitle({
    Key? key,
  }) : super(key: key);

  @override
  State<MenuTitle> createState() => _MenuTitleState();
}

int n = 0;

class _MenuTitleState extends State<MenuTitle> {
  void add() {
    setState(() {
      n++;
    });
  }

  void minus() {
    if (n > 0) {
      setState(() {
        n--;
      });
    }
  }

  final storeController = Get.put(StoreController());

  @override
  Widget build(BuildContext context) {
    return Container(
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
                  storeController
                      .storeTempMenus[Get.parameters["menuIdx"]]!.name,
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
                  storeController
                      .storeTempMenus[Get.parameters["menuIdx"]]!.decsription,
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
                      "${storeController.storeTempMenus[Get.parameters["menuIdx"]]!.price}원",
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
                            onPressed: minus,
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
                          "$n",
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
                            onPressed: add,
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
    );
  }
}

class SideMenu extends GetView<StoreController> {
  const SideMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Obx(
        () => Padding(
          padding: EdgeInsets.only(
            left: 90.w,
            right: 100.w,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 100.h,
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 40.w,
                ),
                child: Text(
                  "추가메뉴",
                  style: TextStyle(
                    color: const Color(0xFF333333),
                    fontSize: 80.sp,
                    fontFamily: 'Core_Gothic_D5',
                  ),
                ),
              ),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                // itemCount: controller.isCheckbox.length,
                itemCount: controller.storeTempMenus[Get.parameters["menuIdx"]]!
                    .additionalProducts.length,
                itemBuilder: (BuildContext context, int index) => Obx(
                  () => Theme(
                    data: ThemeData(unselectedWidgetColor: kPrimaryColor),
                    child: CheckboxListTile(
                      focusNode: index == 0
                          ? controller.menusCheckBoxFocusNode
                          : controller.privacyCheckBoxFocusNode,
                      controlAffinity: ListTileControlAffinity.leading,
                      contentPadding: EdgeInsets.zero,
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            controller
                                .storeTempMenus[Get.parameters["menuIdx"]]!
                                .additionalProducts[index]
                                .name,
                            style: TextStyle(
                              color: const Color(0xFF333333),
                              fontSize: 60.sp,
                              fontFamily: 'Core_Gothic_D5',
                            ),
                          ),
                          Text(
                            "+${controller.storeTempMenus[Get.parameters["menuIdx"]]!.additionalProducts[index].price}원",
                            style: TextStyle(
                              color: const Color(0xFFB8B8B8),
                              fontSize: 60.sp,
                              fontFamily: 'Core_Gothic_D5',
                            ),
                          ),
                        ],
                      ),
                      value: controller
                          .storeTempMenus[Get.parameters["menuIdx"]]!
                          .additionalProducts[index]
                          .isChecked
                          .value,
                      activeColor: kPrimaryColor,
                      onChanged: (bool? value) {
                        controller.storeTempMenus[Get.parameters["menuIdx"]]!
                            .additionalProducts[index].isChecked.value = value!;
                      },
                    ),
                  ),
                ),
              ),
            ],
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
      padding: EdgeInsets.only(
        bottom: 150.h,
        left: 100.w,
        right: 100.w,
      ),
      child: SizedBox(
        width: 1240.w,
        height: 200.h,
        child: OutlinedButton(
          // onPressed: () => Get.toNamed(
          //     '/store=${storeController.storeIdx}/storeMenuDetail=${Get.parameters["menuIdx"]}/storeOrder'),
          onPressed: () => Get.back(),
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
