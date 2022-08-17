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
                  controller.temp2.value,
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
                SizedBox(height: 50.h),
                Row(
                  children: [
                    Text(
                      controller.tempAddress.value,
                      style: TextStyle(
                        color: const Color(0xFF333333),
                        fontSize: 60.sp,
                        fontFamily: 'Core_Gothic_D5',
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 60.h),
                Container(
                  height: 2.h,
                  color: Color(0xFFB8B8B8),
                ),
                SizedBox(height: 20.h),
                Container(
                  width: 1240.w,
                  child: TextField(
                    controller: controller.addressDetailTextFormFieldController,
                    keyboardType: TextInputType.number,
                    style: TextStyle(
                      color: const Color(0xFF333333),
                      fontSize: 60.sp,
                      fontFamily: 'Core_Gothic_D5',
                      // fontWeight: FontWeight.bold,
                    ),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: EdgeInsets.zero,
                      hintText: "상세주소를 입력해주세요",
                      hintStyle: TextStyle(
                        color: const Color(0xFFB8B8B8),
                        fontSize: 60.sp,
                        fontFamily: 'Core_Gothic_D5',
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
                Container(
                  height: 2.h,
                  color: Color(0xFFB8B8B8),
                ),
                SizedBox(height: 30.h),
                Container(
                  width: 1240.w,
                  child: TextField(
                    controller: controller.addressNameTextFormFieldController,
                    keyboardType: TextInputType.number,
                    style: TextStyle(
                      color: const Color(0xFF333333),
                      fontSize: 60.sp,
                      fontFamily: 'Core_Gothic_D5',
                    ),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: EdgeInsets.zero,
                      hintText: "주소 별명 설정",
                      hintStyle: TextStyle(
                        color: const Color(0xFFB8B8B8),
                        fontSize: 60.sp,
                        fontFamily: 'Core_Gothic_D5',
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
                Container(
                  height: 2.h,
                  color: Color(0xFFB8B8B8),
                ),
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
        // body: NestedScrollView(
        //   physics: const NeverScrollableScrollPhysics(),
        //   controller: controller.scrollController.value,
        //   headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        //     return [
        //       SliverAppBar(
        //         elevation: 0,
        //         automaticallyImplyLeading: false,
        //         titleSpacing: 0,
        //         backgroundColor: Colors.white,
        //         pinned: true,
        //         title: Padding(
        //           padding: EdgeInsets.only(
        //             left: 50.w,
        //             top: 50.h,
        //           ),
        //           child: Row(
        //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //             crossAxisAlignment: CrossAxisAlignment.center,
        //             children: [
        //               IconButton(
        //                 icon: Image.asset(
        //                   "assets/icons/x.png",
        //                   width: 50.w,
        //                   height: 50.h,
        //                 ),
        //                 onPressed: () => Get.back(),
        //               ),
        //               SizedBox(
        //                 width: 20.w,
        //               ),
        //               Expanded(
        //                 child: Text(
        //                   controller.temp2.value,
        //                   textAlign: TextAlign.start,
        //                   style: TextStyle(
        //                     color: const Color(0xFF333333),
        //                     fontSize: 60.sp,
        //                     fontFamily: 'Core_Gothic_D6',
        //                     fontWeight: FontWeight.bold,
        //                   ),
        //                 ),
        //               ),
        //             ],
        //           ),
        //         ),
        //       ),
        //     ];
        //   },
        //   body: Container(
        //     color: Colors.pink,
        //     padding: EdgeInsets.symmetric(horizontal: 100.w),
        //     child: Column(
        //       children: [
        //         SizedBox(height: 70.h),
        //         Row(
        //           children: [
        //             Text(
        //               "서울 세종대로 175",
        //               style: TextStyle(
        //                 backgroundColor: Colors.pink,
        //                 color: const Color(0xFF333333),
        //                 fontSize: 60.sp,
        //                 fontFamily: 'Core_Gothic_D5',
        //               ),
        //             ),
        //           ],
        //         ),
        //         SizedBox(height: 60.h),
        //         Container(
        //           width: double.infinity,
        //           height: 100.h,
        //           // color: const Color(0xFFB8B8B8),
        //           color: const Color(0xFF333333),
        //           // color: Colors.pink,
        //           child: Text(
        //             "zzzzz안녕하세요",
        //             style: TextStyle(
        //               overflow: TextOverflow.visible,
        //               fontSize: 50.sp,
        //               backgroundColor: Colors.red,
        //             ),
        //           ),
        //         ),
        //         // AddressDetailWidget(globalFormKey: _globalFormKey),
        //         Container(
        //           color: Colors.blue,
        //           width: 1240.w,
        //           height: 200.h,
        //           child: TextField(
        //
        //           ),
        //           // child: TextField(
        //           //   controller: controller.addressDetailTextFormFieldController,
        //           //   keyboardType: TextInputType.text,
        //           //   style: TextStyle(
        //           //     color: const Color(0xFF333333),
        //           //     fontSize: 50.sp,
        //           //     fontFamily: 'Core_Gothic_D5',
        //           //     // fontWeight: FontWeight.bold,
        //           //   ),
        //           //   decoration: InputDecoration(
        //           //     hintText: "상세주소를 입력해주세요",
        //           //     hintStyle: TextStyle(
        //           //       color: const Color(0xFFB8B8B8),
        //           //       fontSize: 60.sp,
        //           //       fontFamily: 'Core_Gothic_D5',
        //           //     ),
        //           //   ),
        //           // ),
        //         ),
        //
        //         SizedBox(height: 60.h),
        //         Container(
        //           height: 10.h,
        //           color: Color(0xFFB8B8B8),
        //         ),
        //         // TextFormField(
        //         //   controller: controller.addressNameTextFormFieldController,
        //         //   focusNode: controller.addressNameTextFormFieldFocusNode,
        //         //   keyboardType: TextInputType.text,
        //         //   textInputAction: TextInputAction.go,
        //         //   // autofocus: true,
        //         //   // inputFormatters: <TextInputFormatter>[
        //         //   //   FilteringTextInputFormatter.allow(
        //         //   //       RegExp(r'[ㄱ-ㅎ|ㅏ-ㅣ|가-힣0-9a-zA-Z]')),
        //         //   //   LengthLimitingTextInputFormatter(6),
        //         //   // ],
        //         //   // onFieldSubmitted: (value) =>
        //         //   //     controller.handleNickNameOnFieldSubmitted(value: value),
        //         //   // onChanged: (value) => controller.handleNickNameOnChanged(
        //         //   //     globalFormKey: globalFormKey, value: value),
        //         //   // validator: (value) =>
        //         //   //     controller.handleInfoValidator(type: "nickname", value: value),
        //         //   style: TextStyle(color: kTextBodyColor, fontSize: 60.sp),
        //         //   decoration: InputDecoration(
        //         //     // focusedBorder: UnderlineInputBorder(
        //         //     //   borderSide: BorderSide(
        //         //     //     color: Color(0xFFFF8800),
        //         //     //   ),
        //         //     // ),
        //         //     // fillColor: Colors.blue,
        //         //     hintText: "주소 별명 설정",
        //         //     hintStyle: TextStyle(
        //         //       color: Color(0xFFB8B8B8),
        //         //       fontSize: 60.sp,
        //         //       fontFamily: 'Core_Gothic_D5',
        //         //     ),
        //         //   ),
        //         // ),
        //         //
        //         // SizedBox(height: 60.h),
        //         // Container(
        //         //   height: 10.h,
        //         //   color: Color(0xFFB8B8B8),
        //         // ),
        //       ],
        //     ),
        //   ),
        // ),
        // bottomNavigationBar: const BottomOutlinedButtonWidget(),
      ),
    );
  }
}