import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:delivery_service/app/controller/home/home_controller.dart';

import 'package:delivery_service/app/ui/room/room_vertical_list_ui.dart';
import 'package:delivery_service/app/ui/store/store_category_ui.dart';
import 'package:delivery_service/app/ui/room/room_horizontal_list_ui.dart';

// ignore: must_be_immutable
class ListWidget extends GetView<HomeController> {
  ListWidget(ScrollController controller, {Key? key}) : super(key: key) {
    scrollController = controller;
  }

  late ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return MediaQuery.removePadding(
      context: context,
      child: Container(
        decoration: const BoxDecoration(
          color: Color(0xFFFFF6EC),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24.0),
            topRight: Radius.circular(24.0),
          ),
        ),
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24.0),
                topRight: Radius.circular(24.0)),
          ),
          child: Container(
            padding: EdgeInsets.only(top: AppBar().preferredSize.height),
            child: Column(
              children: [
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
                    ],
                  ),
                  width: 1240.w,
                  height: 150.h,
                  child: TextField(
                    // textAlign: TextAlign.start,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 45.sp,
                      fontFamily: 'Core_Gothic_D5',
                    ),
                    decoration: InputDecoration(
                      // contentPadding: const EdgeInsets.all(10),
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 40.h, horizontal: 60.w),
                      border: InputBorder.none,
                      hintText: '오늘의 메뉴를 알려주세요.',
                      suffixIcon: GestureDetector(
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
                SizedBox(
                  height: 50.h,
                ),
                Expanded(
                  child: ListView(
                    controller: scrollController,
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    children: [
                      const StoreCategoryListUi(),
                      const Divider(
                        color: Color(0xFFECECEC),
                        thickness: 7,
                      ),
                      RoomHorizontalListUi(),
                      const Divider(
                        color: Color(0xFFECECEC),
                        thickness: 7,
                      ),
                      RoomVerticalListUi(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
