import 'package:delivery_service/app/controller/signin/signin_controller.dart';
import 'package:delivery_service/app/controller/signup/signup_controller.dart';
import 'package:delivery_service/app/global_widgets/loader_widget.dart';
import "package:flutter/material.dart";
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpPhoneUi extends GetView<SignUpController> {
  SignUpPhoneUi({Key? key}) : super(key: key);

  final _globalFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          controller.currentFocus = FocusScope.of(context);

          if (!controller.currentFocus.hasPrimaryFocus &&
              controller.currentFocus.focusedChild != null) {
            FocusManager.instance.primaryFocus?.unfocus();
          }
        },
        child: Stack(
          children: [
            Scaffold(
              resizeToAvoidBottomInset: false,
              appBar: AppbarWidget(
                appBar: AppBar(),
              ),
              body: SafeArea(
                child: Form(
                  key: _globalFormKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Stack(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 135.w),
                        child: ListView(
                          children: [
                            const CommentWidget(),
                            NameWidget(globalFormKey: _globalFormKey),
                            SizedBox(
                              height: 150.h,
                            ),
                            PhoneWidget(globalFormKey: _globalFormKey),
                            SizedBox(
                              height: 150.h,
                            ),
                            PhoneVerifyWidget(globalFormKey: _globalFormKey),
                          ],
                        ),
                      ),
                      const BottomSheetElevatedButton(),
                    ],
                  ),
                ),
              ),
            ),
            customLoaderWidget(
              isLoaderisible: controller.isLoaderVisible.value,
            ),
          ],
        ),
      ),
    );
  }
}

class AppbarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppbarWidget({Key? key, required this.appBar}) : super(key: key);

  final AppBar appBar;

  @override
  Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);

  @override
  Widget build(BuildContext context) => AppBar(
        leading: IconButton(
          icon:
              const Icon(Icons.arrow_back, color: Color(0xFF333333), size: 30),
          tooltip: "뒤로가기",
          onPressed: () => Get.back(),
        ),
        backgroundColor: Colors.white10,
        elevation: 0,
      );
}

class CommentWidget extends StatelessWidget {
  const CommentWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        children: [
          SizedBox(height: 400.h),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "핸드폰 인증을\r\n진행해주세요.",
              style: TextStyle(
                color: Colors.black,
                fontSize: 80.sp,
                fontFamily: 'Core_Gothic_D5',
              ),
            ),
          ),
          SizedBox(height: 190.h),
        ],
      );
}

class NameWidget extends GetView<SignUpController> {
  const NameWidget({Key? key, required this.globalFormKey}) : super(key: key);

  // ignore: prefer_typing_uninitialized_variables
  final globalFormKey;

  @override
  Widget build(BuildContext context) => Obx(
        () => Column(
          children: [
            TextFormField(
              controller: controller.nameTextFormFieldController,
              focusNode: controller.nameTextFormFieldFocusNode,
              enabled: controller.isNameTextFormFieldEnabled.value,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.go,
              autofocus: true,
              inputFormatters: <TextInputFormatter>[
                LengthLimitingTextInputFormatter(8),
              ],
              onFieldSubmitted: (value) =>
                  controller.handleNameOnFieldSubmitted(value: value),
              onChanged: (value) => controller.handleNameOnChanged(
                  globalFormKey: globalFormKey, value: value),
              validator: (value) =>
                  controller.handlePhoneValidator(type: "name", value: value),
              style: TextStyle(
                color: Colors.black,
                fontSize: 60.sp,
                fontFamily: 'Core_Gothic_D4',
              ),
              decoration: InputDecoration(
                // enabledBorder: const UnderlineInputBorder(
                //   borderSide: BorderSide(
                //     color: Color(0xFFFF8800),
                //   ),
                // ),
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xFFFF8800),
                  ),
                ),
                hintText: "이름",
                hintStyle: TextStyle(
                  color: const Color(0xFFDDDDDD),
                  fontSize: 60.sp,
                  fontFamily: 'Core_Gothic_D4',
                ),
              ),
            ),
          ],
        ),
      );
}

class PhoneWidget extends GetView<SignUpController> {
  const PhoneWidget({Key? key, required this.globalFormKey}) : super(key: key);

  // ignore: prefer_typing_uninitialized_variables
  final globalFormKey;

  @override
  Widget build(BuildContext context) => Obx(
        () => Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: TextFormField(
                    controller: controller.phoneTextFormFieldController,
                    focusNode: controller.phoneTextFormFieldFocusNode,
                    enabled: controller.isPhoneTextFormFieldEnabled.value,
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.go,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(11),
                    ],
                    onFieldSubmitted: (value) =>
                        controller.handlePhoneProvider(),
                    onChanged: (value) => controller.handlePhoneOnChanged(
                        globalFormKey: globalFormKey, value: value),
                    validator: (value) => controller.handlePhoneValidator(
                        type: "phone", value: value),
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 60.sp,
                      fontFamily: 'Core_Gothic_D4',
                    ),
                    decoration: InputDecoration(
                      // enabledBorder: const UnderlineInputBorder(
                      //   borderSide: BorderSide(
                      //     color: Color(0xFFFF8800),
                      //   ),
                      // ),
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFFFF8800),
                        ),
                      ),
                      hintText: "휴대전화번호 입력 ('-' 제외)",
                      hintStyle: TextStyle(
                        color: const Color(0xFFDDDDDD),
                        fontSize: 60.sp,
                        fontFamily: 'Core_Gothic_D4',
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 60.w),
                Expanded(
                  flex: 0,
                  child: Padding(
                    padding: EdgeInsets.only(top: 20.h),
                    child: SizedBox(
                      width: 380.w,
                      height: 120.h,
                      child: Obx(
                        () => OutlinedButton(
                          focusNode: controller.phoneOutlinedButtonFocusNode,
                          child: Text(
                            "인증번호 전송",
                            style: controller.phoneOutlinedButtonTextStyle(),
                          ),
                          onPressed: () => controller.handlePhoneProvider(),
                          style: controller.phoneOutlinedButtonStyle(),
                        ),
                      ),
                      // child: ElevatedButton(
                      //   child: Text(
                      //     "인증번호 전송",
                      //     style: TextStyle(
                      //       color: Colors.white,
                      //       fontSize: 40.sp,
                      //       fontFamily: 'Core_Gothic_D4',
                      //     ),
                      //   ),
                      //   style: ElevatedButton.styleFrom(
                      //     // primary: const Color(0xFFFF8800),
                      //     primary: Colors.blue,
                      //     onPrimary: const Color(0xFFFF8800),
                      //     shape: RoundedRectangleBorder(
                      //       borderRadius: BorderRadius.circular(50.0),
                      //       side: const BorderSide(
                      //           color: Color(0xFFFF8800), width: 3),
                      //     ),
                      //     shadowColor: Colors.black,
                      //   ),
                      //   onPressed: () {},
                      // ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
}

class PhoneVerifyWidget extends GetView<SignUpController> {
  const PhoneVerifyWidget({Key? key, required this.globalFormKey})
      : super(key: key);

  // ignore: prefer_typing_uninitialized_variables
  final globalFormKey;

  @override
  Widget build(BuildContext context) => Obx(
        () => Visibility(
          visible: controller.isPhoneVerifyTextFormFieldVisible.value,
          maintainState: true,
          maintainAnimation: true,
          maintainSize: false,
          maintainSemantics: false,
          maintainInteractivity: false,
          child: Column(
            children: [
              TextFormField(
                controller: controller.phoneVerifyTextFormFieldController,
                focusNode: controller.phoneVerifyTextFormFieldFocusNode,
                enabled: controller.isPhoneVerifyTextFormFieldEnabled.value,
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.go,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(6),
                ],
                onFieldSubmitted: (value) =>
                    controller.handlePhoneVerifyProvider(),
                onChanged: (value) => controller.handlePhoneVerifyOnChanged(
                    globalFormKey: globalFormKey, value: value),
                validator: (value) => controller.handlePhoneValidator(
                    type: "phoneVerify", value: value),
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 60.sp,
                  fontFamily: 'Core_Gothic_D4',
                ),
                decoration: InputDecoration(
                  // enabledBorder: const UnderlineInputBorder(
                  //   borderSide: BorderSide(
                  //     color: Color(0xFFFF8800),
                  //   ),
                  // ),
                  focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFFFF8800),
                    ),
                  ),
                  hintText: "인증번호 6자리",
                  hintStyle: TextStyle(
                    color: const Color(0xFFDDDDDD),
                    fontSize: 60.sp,
                    fontFamily: 'Core_Gothic_D4',
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}

class BottomSheetElevatedButton extends GetView<SignUpController> {
  const BottomSheetElevatedButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          padding: EdgeInsets.only(
            bottom: 250.h,
          ),
          width: 800.w,
          height: 450.h,
          child: ElevatedButton(
            onPressed: () => controller.handlePhoneVerifyProvider(),
            child: Text(
              "인증하기",
              style: controller.phoneVerifyOutlinedButtonTextStyle(),
            ),
            style: controller.phoneVerifyOutlinedButtonStyle(),
          ),
        ),
      ),
    );
  }
}
