import "package:flutter/material.dart";
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:delivery_service/app/core/values/colors.dart';

import 'package:delivery_service/app/controller/signup/signup_controller.dart';

import 'package:delivery_service/app/global_widgets/global_loader_widget.dart';

class SignUpInfoUi extends GetView<SignUpController> {
  SignUpInfoUi({Key? key}) : super(key: key);

  final _globalFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) => GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          controller.currentFocus = FocusScope.of(context);

          if (!controller.currentFocus.hasPrimaryFocus &&
              controller.currentFocus.focusedChild != null) {
            FocusManager.instance.primaryFocus?.unfocus();
          }
        },
        child: WillPopScope(
          onWillPop: () => controller.handleWillPopScopeAction(),
          child: Obx(
            () => Stack(
              children: [
                Scaffold(
                  resizeToAvoidBottomInset: true,
                  appBar: AppbarWidget(appBar: AppBar()),
                  body: SafeArea(
                    child: Form(
                      key: _globalFormKey,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      child: Stack(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(40),
                            child: ListView(
                              children: [
                                const CommentWidget(),
                                NickNameWidget(globalFormKey: _globalFormKey),
                                EmailWidget(globalFormKey: _globalFormKey),
                              ],
                            ),
                          ),
                          const BottomOutlinedButtonWidget(),
                        ],
                      ),
                    ),
                  ),
                ),
                GlobalCustomLoaderWidget(
                    isLoaderisible: controller.isLoaderVisible.value),
              ],
            ),
          ),
        ),
      );

// Widget build(BuildContext context) {
  //   return Scaffold(
  //     resizeToAvoidBottomInset: false,
  //     appBar: AppbarWidget(
  //       appBar: AppBar(),
  //     ),
  //     body: SafeArea(
  //       child: Stack(
  //         children: [
  //           Container(
  //             padding: EdgeInsets.only(left: 135.w),
  //             child: Column(
  //               children: [
  //                 const CommentWidget(),
  //                 SizedBox(
  //                   height: 190.h,
  //                 ),
  //                 const NickNameWidget(),
  //                 SizedBox(
  //                   height: 150.h,
  //                 ),
  //                 const EmailWidget(),
  //               ],
  //             ),
  //           ),
  //           const BottomSheetElevatedButton(),
  //         ],
  //       ),
  //     ),
  //   );
  // }
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
              "사용하실 닉네임과\r\n이메일을 입력해주세요.",
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

class NickNameWidget extends GetView<SignUpController> {
  const NickNameWidget({Key? key, required this.globalFormKey})
      : super(key: key);

  // ignore: prefer_typing_uninitialized_variables
  final globalFormKey;

  @override
  Widget build(BuildContext context) => Column(
        children: [
          TextFormField(
            controller: controller.nickNameTextFormFieldController,
            focusNode: controller.nickNameTextFormFieldFocusNode,
            enabled: controller.isNickNameTextFormFieldEnabled.value,
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.go,
            autofocus: true,
            inputFormatters: <TextInputFormatter>[
              // FilteringTextInputFormatter.allow(
              //     RegExp(r'[ㄱ-ㅎ|ㅏ-ㅣ|가-힣0-9a-zA-Z]')),
              LengthLimitingTextInputFormatter(6),
            ],
            onFieldSubmitted: (value) =>
                controller.handleNickNameOnFieldSubmitted(value: value),
            onChanged: (value) => controller.handleNickNameOnChanged(
                globalFormKey: globalFormKey, value: value),
            validator: (value) =>
                controller.handleInfoValidator(type: "nickname", value: value),
            style: const TextStyle(color: kTextBodyColor, fontSize: 20),
            decoration: const InputDecoration(
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0xFFFF8800),
                ),
              ),
              hintText: "닉네임을 입력해주세요.",
              hintStyle: TextStyle(
                color: Colors.black12,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 30),
        ],
      );

// Widget build(BuildContext context) => Column(
  //   children: [
  //     Padding(
  //       padding: EdgeInsets.only(
  //         right: 150.w,
  //       ),
  //       child: TextFormField(
  //         keyboardType: TextInputType.text,
  //         textInputAction: TextInputAction.go,
  //         autofocus: true,
  //         inputFormatters: <TextInputFormatter>[
  //           LengthLimitingTextInputFormatter(6),
  //         ],
  //         onFieldSubmitted: (value) =>
  //             controller.asdfasdf(value: value),
  //         validator: (value) => controller.handleInfoValidator(
  //             type: "nickname", value: value),
  //         style: TextStyle(
  //           color: Colors.black,
  //           fontSize: 60.sp,
  //           fontFamily: 'Core_Gothic_D4',
  //         ),
  //         decoration: InputDecoration(
  //           enabledBorder: const UnderlineInputBorder(
  //             borderSide: BorderSide(
  //               color: Color(0xFFFF8800),
  //             ),
  //           ),
  //           focusedBorder: const UnderlineInputBorder(
  //             borderSide: BorderSide(
  //               color: Color(0xFFFF8800),
  //             ),
  //           ),
  //           hintText: "닉네임을 입력해주세요.",
  //           hintStyle: TextStyle(
  //             color: const Color(0xFFDDDDDD),
  //             fontSize: 60.sp,
  //             fontFamily: 'Core_Gothic_D4',
  //           ),
  //         ),
  //       ),
  //     ),
  //   ],
  // );
}

class EmailWidget extends GetView<SignUpController> {
  const EmailWidget({Key? key, required this.globalFormKey}) : super(key: key);

  // ignore: prefer_typing_uninitialized_variables
  final globalFormKey;

  @override
  Widget build(BuildContext context) => Obx(
        () => Column(
          children: [
            TextFormField(
              controller: controller.emailTextFormFieldController,
              focusNode: controller.emailTextFormFieldFocusNode,
              enabled: controller.isEmailTextFormFieldEnabled.value,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.go,
              inputFormatters: [
                FilteringTextInputFormatter.deny(
                  RegExp(
                      r"/^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{3,}$/i"),
                ),
              ],
              onFieldSubmitted: (value) => controller.handleInfoProvider(),
              onChanged: (value) => controller.handleEmailOnChanged(
                  globalFormKey: globalFormKey, value: value),
              validator: (value) =>
                  controller.handleInfoValidator(type: "email", value: value),
              style: const TextStyle(color: kTextBodyColor, fontSize: 20),
              decoration: const InputDecoration(
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xFFFF8800),
                  ),
                ),
                hintText: "이메일을 입력해주세요.",
                hintStyle: TextStyle(
                  color: Colors.black12,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      );

// Widget build(BuildContext context) => Column(
  //   children: [
  //     Padding(
  //       padding: EdgeInsets.only(
  //         right: 150.w,
  //       ),
  //       child: TextFormField(
  //         keyboardType: TextInputType.text,
  //         textInputAction: TextInputAction.go,
  //         autofocus: true,
  //         inputFormatters: <TextInputFormatter>[
  //           LengthLimitingTextInputFormatter(40),
  //         ],
  //         onFieldSubmitted: (value) =>
  //             controller.handleNickNameOnFieldSubmitted(value: value),
  //         validator: (value) => controller.handleInfoValidator(
  //             type: "nickname", value: value),
  //         style: TextStyle(
  //           color: Colors.black,
  //           fontSize: 60.sp,
  //           fontFamily: 'Core_Gothic_D4',
  //         ),
  //         decoration: InputDecoration(
  //           enabledBorder: const UnderlineInputBorder(
  //             borderSide: BorderSide(
  //               color: Color(0xFFFF8800),
  //             ),
  //           ),
  //           focusedBorder: const UnderlineInputBorder(
  //             borderSide: BorderSide(
  //               color: Color(0xFFFF8800),
  //             ),
  //           ),
  //           hintText: "이메일을 입력해주세요.",
  //           hintStyle: TextStyle(
  //             color: const Color(0xFFDDDDDD),
  //             fontSize: 60.sp,
  //             fontFamily: 'Core_Gothic_D4',
  //           ),
  //         ),
  //       ),
  //     ),
  //   ],
  // );
}

class BottomOutlinedButtonWidget extends GetView<SignUpController> {
  const BottomOutlinedButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Obx(
        () => Align(
          alignment: Alignment.bottomCenter,
          child: SizedBox(
            // padding: const EdgeInsets.fromLTRB(40, 0, 40, 20),
            width: 800.w,
            height: 200.h,
            child: OutlinedButton(
              focusNode: controller.infoOutlinedButtonFocusNode,
              onPressed: () => controller.handleInfoProvider(),
              child: Text(
                "다음",
                style: controller.infoOutlinedButtonTextStyle(),
              ),
              style: controller.infoOutlinedButtonStyle(),
            ),
          ),
        ),
      );
}

class BottomSheetElevatedButton extends StatelessWidget {
  const BottomSheetElevatedButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        padding: EdgeInsets.only(
          bottom: 250.h,
        ),
        width: 800.w,
        height: 450.h,
        child: ElevatedButton(
          onPressed: () =>
              Get.toNamed("/signup/password", preventDuplicates: false),
          child: Text(
            "다음",
            style: TextStyle(
              color: const Color(0xFFFF8800),
              fontSize: 70.sp,
              fontFamily: 'Core_Gothic_D5',
            ),
          ),
          style: ElevatedButton.styleFrom(
            primary: Colors.white,
            onPrimary: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50.0),
              side: const BorderSide(color: Color(0xFFFF8800), width: 3),
            ),
            shadowColor: Colors.black,
          ),
        ),
      ),
    );
  }
}
