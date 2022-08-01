import 'dart:io';

import 'package:delivery_service/app/controller/main/main_controller.dart';
import 'package:delivery_service/app/global_widgets/gloabl_snackbar_widget.dart';
import 'package:get/get.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:cached_network_image/cached_network_image.dart';

import 'package:delivery_service/app/global_widgets/global_loader_widget.dart';
import 'package:delivery_service/app/controller/mypage/mypage_user_update_controller.dart';
import 'package:get_storage/get_storage.dart';

class MyPageUserUpdateUi extends GetView<MyPageUserUpdateController> {
  MyPageUserUpdateUi({Key? key}) : super(key: key);

  @override
  final MyPageUserUpdateController controller = Get.find();

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
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
            "프로필 변경",
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
            child: SafeArea(
              child: Form(
                key: controller.globalFormKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.only(
                        left: 150.w,
                        top: 80.h,
                        right: 150.w,
                      ),
                      child: Column(
                        children: [
                          ImagesWidget(),
                          NameWidget(),
                          SizedBox(height: 80.h),
                          EmailWidget(),
                          SizedBox(height: 80.h),
                          NickNameWidget(),
                          SizedBox(height: 80.h),
                          PhoneNumberWidget(),
                          SizedBox(height: 80.h),
                        ],
                      ),
                    ),
                    Divider(
                      color: const Color(0xFFECECEC),
                      thickness: 4.h,
                    ),
                    LogoutWidget(),
                  ],
                ),
              ),
            ),
          ),
        ),
        bottomSheet: const BottomSheetOutlinedButtonWidget(),
      );
}

class ImagesWidget extends GetView<MyPageUserUpdateController> {
  ImagesWidget({Key? key}) : super(key: key);

  @override
  final MyPageUserUpdateController controller = Get.find();
  final MainController mainController = Get.put(MainController());

  @override
  Widget build(BuildContext context) => Obx(
        () => Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                child: InkWell(
                  child: Container(
                    width: 600.w,
                    height: 600.h,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey.shade200,
                      image: DecorationImage(
                          image: NetworkImage(
                              mainController.currentMember.value.photo),
                          fit: BoxFit.cover),
                    ),
                  ),
                  // onTap: () => controller.handleSelectImage(),
                ),
              ),
              SizedBox(
                height: 80.h,
              ),
              InkWell(
                onTap: () => controller.handleSelectImage(),
                child: Text(
                  "프로필 사진 변경",
                  style: TextStyle(
                    color: const Color(0xFFFF8800),
                    fontSize: 60.sp,
                    fontFamily: 'Core_Gothic_D5',
                  ),
                ),
              ),
              SizedBox(
                height: 100.h,
              ),
            ],
          ),
        ),
      );
}

class NameWidget extends GetView<MyPageUserUpdateController> {
  NameWidget({Key? key}) : super(key: key);

  @override
  final MyPageUserUpdateController controller = Get.find();
  final MainController mainController = Get.put(MainController());

  @override
  Widget build(BuildContext context) => Obx(
        () => SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "이름",
                style: TextStyle(
                  color: const Color(0xFFB8B8B8),
                  fontSize: 60.sp,
                  fontFamily: 'Core_Gothic_D5',
                ),
              ),
              SizedBox(height: 30.h),
              Text(
                mainController.currentMember.value.name,
                style: TextStyle(
                  color: const Color(0xFF333333),
                  fontSize: 60.sp,
                  fontFamily: 'Core_Gothic_D5',
                ),
              ),
            ],
          ),
        ),
      );
}

class EmailWidget extends GetView<MyPageUserUpdateController> {
  EmailWidget({Key? key}) : super(key: key);

  @override
  final MyPageUserUpdateController controller = Get.find();
  final MainController mainController = Get.put(MainController());

  @override
  Widget build(BuildContext context) => Obx(
        () => SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Email",
                style: TextStyle(
                  color: const Color(0xFFB8B8B8),
                  fontSize: 60.sp,
                  fontFamily: 'Core_Gothic_D5',
                ),
              ),
              SizedBox(height: 30.h),
              Text(
                mainController.currentMember.value.email,
                style: TextStyle(
                  color: const Color(0xFF333333),
                  fontSize: 60.sp,
                  fontFamily: 'Core_Gothic_D5',
                ),
              ),
            ],
          ),
        ),
      );
}

class NickNameWidget extends GetView<MyPageUserUpdateController> {
  NickNameWidget({Key? key}) : super(key: key);

  // @override
  // final MyPageUserUpdateController controller = Get.find();
  // final MainController mainController = Get.put(MainController());

  @override
  Widget build(BuildContext context) => Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "닉네임",
              style: TextStyle(
                color: const Color(0xFFB8B8B8),
                fontSize: 60.sp,
                fontFamily: 'Core_Gothic_D5',
              ),
            ),
            TextFormField(
              controller: controller.nicknameTextFormFieldController,
              focusNode: controller.nicknameTextFormFieldFocusNode,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.go,
              inputFormatters: <TextInputFormatter>[
                LengthLimitingTextInputFormatter(20),
              ],
              // onFieldSubmitted: (value) => controller.handleNextFocusNode(
              //     type: "nickname", value: value),
              onChanged: (value) =>
                  controller.globalFormKey.currentState!.save(),
              validator: (value) =>
                  controller.handleValidator(type: "nickname", value: value),
              style: TextStyle(
                color: const Color(0xFF333333),
                fontSize: 60.sp,
                fontFamily: 'Core_Gothic_D5',
              ),
              decoration: InputDecoration(
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xFFFF8800),
                  ),
                ),
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xFFFF8800),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
}

class PhoneNumberWidget extends GetView<MyPageUserUpdateController> {
  PhoneNumberWidget({Key? key}) : super(key: key);

  @override
  final MyPageUserUpdateController controller = Get.find();
  final MainController mainController = Get.put(MainController());

  @override
  Widget build(BuildContext context) => Obx(
        () => SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "핸드폰 번호",
                style: TextStyle(
                  color: const Color(0xFFB8B8B8),
                  fontSize: 60.sp,
                  fontFamily: 'Core_Gothic_D5',
                ),
              ),
              SizedBox(height: 30.h),
              Text(
                (mainController.currentMember.value.phone).replaceAllMapped(
                    RegExp(r'(\d{3})(\d{3,4})(\d{4})'),
                    (m) => '${m[1]}-${m[2]}-${m[3]}'),
                style: TextStyle(
                  color: const Color(0xFF333333),
                  fontSize: 60.sp,
                  fontFamily: 'Core_Gothic_D5',
                ),
              ),
            ],
          ),
        ),
      );
}

class LogoutWidget extends GetView<MyPageUserUpdateController> {
  LogoutWidget({Key? key}) : super(key: key);

  @override
  final MyPageUserUpdateController controller = Get.find();

  @override
  Widget build(BuildContext context) => Obx(
        () => Padding(
          padding: EdgeInsets.symmetric(
            vertical: 80.h,
          ),
          child: TextButton(
            onPressed: () {
              GetStorage().remove("token");
              Get.offAllNamed("/main");
            },
            style: ButtonStyle(
              overlayColor: MaterialStateColor.resolveWith(
                (states) => Colors.transparent,
              ),
            ),
            child: Text(
              controller.users[0]["logout"],
              style: TextStyle(
                color: const Color(0xFFFF8800),
                fontSize: 60.sp,
                fontFamily: 'Core_Gothic_D5',
              ),
            ),
          ),
        ),
      );
}

class BottomSheetOutlinedButtonWidget
    extends GetView<MyPageUserUpdateController> {
  const BottomSheetOutlinedButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
        padding: EdgeInsets.only(
          bottom: 150.h,
          left: 100.w,
          right: 100.w,
        ),
        child: SizedBox(
          width: 1240.w,
          height: 200.h,
          child: OutlinedButton(
            onPressed: () async {
              await controller.handleUpdateProvider();

              if (controller.isUpdateProvider.value) {
                Get.back();
                globalSnackBarWidget(message: "프로필 변경이 완료되었습니다.");
              } else {
                // globalSnackBarWidget(message: "프로필 변경이 실패하였습니다.");
              }
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
              "저장하기",
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
