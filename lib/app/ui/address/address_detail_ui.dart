import 'package:delivery_service/app/core/values/colors.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:delivery_service/app/controller/address/address_controller.dart';
import 'package:intl/intl.dart';
import 'package:kpostal/kpostal.dart';

class AddressDetailUi extends GetView<AddressController> {
  AddressDetailUi({Key? key}) : super(key: key);

  final _globalFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: Scaffold(
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
                    controller.temp3.value,
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
          body: SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 100.w),
              child: Column(
                children: [
                  SizedBox(height: 70.h),
                  SizedBox(
                    width: double.infinity,
                    child: Text(
                      "주소",
                      style: TextStyle(
                        color: const Color(0xFF333333),
                        fontSize: 60.sp,
                        fontFamily: 'Core_Gothic_D5',
                      ),
                    ),
                  ),
                  SizedBox(height: 40.h),
                  TextField(
                    enabled: false,
                    controller: controller.addressTextFormFieldController,
                    keyboardType: TextInputType.text,
                    style: TextStyle(
                      color: const Color(0xFF333333),
                      fontSize: 60.sp,
                      fontFamily: 'Core_Gothic_D5',
                    ),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xFFB2B2B2),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        ),
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 40.w, vertical: 0),
                    ),
                  ),
                  SizedBox(height: 60.h),
                  Container(
                    height: 3.h,
                    color: Color(0xFFB8B8B8),
                  ),
                  SizedBox(height: 60.h),
                  SizedBox(
                    width: double.infinity,
                    child: Text(
                      "상세 주소",
                      style: TextStyle(
                        color: const Color(0xFF333333),
                        fontSize: 60.sp,
                        fontFamily: 'Core_Gothic_D5',
                      ),
                    ),
                  ),
                  SizedBox(height: 40.h),
                  TextField(
                    controller: controller.addressDetailTextFormFieldController,
                    keyboardType: TextInputType.text,
                    style: TextStyle(
                      color: const Color(0xFF333333),
                      fontSize: 60.sp,
                      fontFamily: 'Core_Gothic_D5',
                      // fontWeight: FontWeight.bold,
                    ),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xFFECECEC),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        ),
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 40.w, vertical: 0),
                      hintText: "상세 주소를 입력해주세요",
                      hintStyle: TextStyle(
                        color: const Color(0xFFB8B8B8),
                        fontSize: 60.sp,
                        fontFamily: 'Core_Gothic_D5',
                      ),
                    ),
                  ),
                  controller.addressDetailCheck.value
                      ? SizedBox(height: 60.h)
                      : Column(
                          children: [
                            SizedBox(height: 30.h),
                            Container(
                              padding: EdgeInsets.only(left: 40.w),
                              width: double.infinity,
                              child: Text(
                                "상세 주소를 입력해주세요",
                                style: TextStyle(
                                  color: const Color(0xFFFF0000),
                                  fontSize: 40.sp,
                                  fontFamily: 'Core_Gothic_D4',
                                ),
                              ),
                            ),
                            SizedBox(height: 30.h)
                          ],
                        ),
                  Container(
                    height: 3.h,
                    color: Color(0xFFB8B8B8),
                  ),
                  SizedBox(height: 60.h),
                  SizedBox(
                    width: double.infinity,
                    child: Text(
                      "주소 이름",
                      style: TextStyle(
                        color: const Color(0xFF333333),
                        fontSize: 60.sp,
                        fontFamily: 'Core_Gothic_D5',
                      ),
                    ),
                  ),
                  SizedBox(height: 40.h),
                  TextFormField(
                    controller: controller.addressNameTextFormFieldController,
                    keyboardType: TextInputType.text,
                    style: TextStyle(
                      color: const Color(0xFF333333),
                      fontSize: 60.sp,
                      fontFamily: 'Core_Gothic_D5',
                    ),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xFFECECEC),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        ),
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 40.w, vertical: 0),
                      hintText: "주소 별명 설정",
                      hintStyle: TextStyle(
                        color: const Color(0xFFB8B8B8),
                        fontSize: 60.sp,
                        fontFamily: 'Core_Gothic_D5',
                      ),
                    ),
                  ),
                  controller.addressNameCheck.value
                      ? SizedBox(height: 60.h)
                      : Column(
                          children: [
                            SizedBox(height: 30.h),
                            Container(
                              padding: EdgeInsets.only(left: 40.w),
                              width: double.infinity,
                              child: Text(
                                "주소 이름을 입력해주세요",
                                style: TextStyle(
                                  color: const Color(0xFFFF0000),
                                  fontSize: 40.sp,
                                  fontFamily: 'Core_Gothic_D4',
                                ),
                              ),
                            ),
                            SizedBox(height: 30.h)
                          ],
                        ),
                  Container(
                    height: 3.h,
                    color: Color(0xFFB8B8B8),
                  ),
                  SizedBox(height: 40.h),
                  Theme(
                    data: ThemeData(unselectedWidgetColor: kPrimaryColor),
                    child: CheckboxListTile(
                      // focusNode: index == 0
                      //     ? controller.termsCheckBoxFocusNode
                      //     : controller.privacyCheckBoxFocusNode,
                      controlAffinity: ListTileControlAffinity.trailing,
                      contentPadding: EdgeInsets.zero,
                      title: GestureDetector(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "기본 주소지로 설정",
                              style: TextStyle(
                                color: const Color(0xFF333333),
                                fontSize: 60.sp,
                                fontFamily: 'Core_Gothic_D5',
                              ),
                            ),
                          ],
                        ),
                      ),
                      value: controller.isChecked.value,
                      activeColor: kPrimaryColor,
                      onChanged: (bool? value) {
                        controller.isChecked.value = value!;
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          bottomNavigationBar: const BottomOutlinedButtonWidget(),
        ),
      ),
    );
  }
}

class BottomOutlinedButtonWidget extends GetView<AddressController> {
  const BottomOutlinedButtonWidget({Key? key}) : super(key: key);

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
          onPressed: () {
            controller.handleAddressAddProvider();
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
            "주소 등록",
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
