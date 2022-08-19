import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:delivery_service/app/controller/address/address_controller.dart';
import 'package:intl/intl.dart';
import 'package:kpostal/kpostal.dart';

class AddressUi extends GetView<AddressController> {
  AddressUi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          titleSpacing: 0,
          title: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  icon: Image.asset(
                    "assets/icons/x.png",
                    width: 50.w,
                    height: 50.h,
                  ),
                  onPressed: () => Get.back(),
                ),
                Text(
                  controller.temp1.value,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: const Color(0xFF333333),
                    fontSize: 60.sp,
                    fontFamily: 'Core_Gothic_D6',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
        body: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (OverscrollIndicatorNotification? overscroll) {
            overscroll!.disallowIndicator();
            return true;
          },
          child: Column(
            children: [
              SizedBox(height: 30.h),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 50.w),
                width: 1240.w,
                height: 140.h,
                decoration: BoxDecoration(
                  color: Color(0xFFE0E0E0),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: InkWell(
                  onTap: () {
                    Get.toNamed("/address/detail");
                    Get.toNamed("/address/search");
                  },
                  child: Row(
                    children: [
                      Image.asset(
                        "assets/icons/search.png",
                        width: 60.w,
                        height: 60.h,
                      ),
                      SizedBox(width: 50.w),
                      Text(
                        "지번, 도로명, 건물명으로 검색",
                        style: TextStyle(
                          color: const Color(0xFFA1A1A1),
                          fontSize: 55.sp,
                          fontFamily: 'Core_Gothic_D5',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 60.h),
              Container(
                height: 20.h,
                color: Color(0xFFECECEC),
              ),
              SingleChildScrollView(
                child: ListView.separated(
                  padding: EdgeInsets.symmetric(
                    vertical: 50.h,
                    horizontal: 100.w,
                  ),
                  shrinkWrap: true,
                  controller: controller.listScrollController.value,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {
                        controller.handleAddressSelectProvider(
                            controller.addresses[index].idx);
                      },
                      child: Row(
                        children: [
                          Container(
                            width: 250.w,
                            child: Text(
                              controller.addresses[index].name,
                              style: TextStyle(
                                color: const Color(0xFF333333),
                                fontSize: 55.sp,
                                fontFamily: 'Core_Gothic_D5',
                              ),
                            ),
                          ),
                          SizedBox(width: 50.w),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  controller.addresses[index].address,
                                  style: TextStyle(
                                    color: const Color(0xFF333333),
                                    fontSize: 45.sp,
                                    fontFamily: 'Core_Gothic_D5',
                                  ),
                                ),
                                SizedBox(height: 10.h),
                                Text(
                                  controller.addresses[index].detail,
                                  style: TextStyle(
                                    color: const Color(0xFF333333),
                                    fontSize: 45.sp,
                                    fontFamily: 'Core_Gothic_D5',
                                  ),
                                ),
                              ],
                            ),
                          ),
                          controller.addresses[index].active == true
                              ? Icon(
                                  CupertinoIcons.check_mark_circled,
                                  color: Color(0xFFFF8800),
                                  size: 65.w,
                                )
                              : SizedBox(),
                          SizedBox(width: 50.w),
                          InkWell(
                            onTap: () {
                              controller.handleAddressDeleteProvider(
                                  controller.addresses[index].idx);
                            },
                            child: Icon(
                              CupertinoIcons.delete,
                              size: 65.w,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 20.h,
                      ),
                      child: const Divider(
                        color: Color(0xFFECECEC),
                        thickness: 2,
                      ),
                    );
                  },
                  itemCount: controller.addresses.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
