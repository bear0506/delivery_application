import "package:flutter/material.dart";
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:delivery_service/app/controller/signup/signup_controller.dart';

import 'package:delivery_service/app/global_widgets/global_loader_widget.dart';

class SignUpPasswordUi extends GetView<SignUpController> {
  SignUpPasswordUi({Key? key}) : super(key: key);

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
                                PasswordWidget(globalFormKey: _globalFormKey),
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
              "가입의 마지막\r\n단계 입니다!",
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

class PasswordWidget extends GetView<SignUpController> {
  const PasswordWidget({Key? key, required this.globalFormKey})
      : super(key: key);

  // ignore: prefer_typing_uninitialized_variables
  final globalFormKey;

  @override
  Widget build(BuildContext context) => Obx(() => Column(
        children: [
          TextFormField(
            controller: controller.passwordTextFormFieldController,
            focusNode: controller.passwordTextFormFieldFocusNode,
            enabled: controller.isPasswordTextFormFieldEnabled.value,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.go,
            autofocus: true,
            obscureText: controller.isPasswordHideVisible.value,
            inputFormatters: <TextInputFormatter>[
              LengthLimitingTextInputFormatter(20),
            ],
            onFieldSubmitted: (value) =>
                controller.handlePasswordOnFieldSubmitted(value: value),
            onChanged: (value) => controller.handlePasswordOnChanged(
                globalFormKey: globalFormKey),
            validator: (value) => controller.handlePasswordValidator(
                type: "password", value: value),
            style: TextStyle(
              color: Colors.black,
              fontSize: 60.sp,
              fontFamily: 'Core_Gothic_D4',
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
              hintText: "비밀번호를 입력해주세요.",
              hintStyle: TextStyle(
                color: const Color(0xFFDDDDDD),
                fontSize: 60.sp,
                fontFamily: 'Core_Gothic_D4',
              ),
              suffixIcon: IconButton(
                onPressed: () => controller.isPasswordHideVisible.value =
                    !controller.isPasswordHideVisible.value,
                color: Theme.of(context).colorScheme.secondary.withOpacity(0.4),
                icon: Icon(controller.isPasswordHideVisible.value
                    ? Icons.visibility_off
                    : Icons.visibility),
              ),
            ),
          ),
          SizedBox(
            height: 150.h,
          ),
          TextFormField(
            controller: controller.passwordReTextFormFieldController,
            focusNode: controller.passwordReTextFormFieldFocusNode,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.go,
            enabled: controller.isPasswordReTextFormFieldEnabled.value,
            obscureText: controller.isPasswordReHideVisible.value,
            inputFormatters: <TextInputFormatter>[
              // FilteringTextInputFormatter.deny(pwRegExp),
              LengthLimitingTextInputFormatter(20),
            ],
            onFieldSubmitted: (value) => controller.handlePasswordProvider(),
            onChanged: (value) => controller.handlePasswordReOnChanged(
                globalFormKey: globalFormKey, value: value),
            validator: (value) => controller.handlePasswordValidator(
                type: "passwordRe", value: value),
            style: TextStyle(
              color: Colors.black,
              fontSize: 60.sp,
              fontFamily: 'Core_Gothic_D4',
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
              hintText: "비밀번호를 다시 입력해주세요.",
              hintStyle: TextStyle(
                color: const Color(0xFFDDDDDD),
                fontSize: 60.sp,
                fontFamily: 'Core_Gothic_D4',
              ),
              suffixIcon: IconButton(
                onPressed: () => controller.isPasswordReHideVisible.value =
                    !controller.isPasswordReHideVisible.value,
                color: Theme.of(context).colorScheme.secondary.withOpacity(0.4),
                icon: Icon(
                  controller.isPasswordReHideVisible.value
                      ? Icons.visibility_off
                      : Icons.visibility,
                ),
              ),
            ),
          ),
        ],
      ));
}

class BottomOutlinedButtonWidget extends GetView<SignUpController> {
  const BottomOutlinedButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Obx(
        () => Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            padding: EdgeInsets.only(
              bottom: 250.h,
            ),
            width: 800.w,
            height: 450.h,
            child: OutlinedButton(
              focusNode: controller.passwordOutlinedButtonFocusNode,
              onPressed: () => controller.handlePasswordProvider(),
              child: Text(
                "회원가입",
                style: controller.passwordOutlinedButtonTextStyle(),
                // style: TextStyle(
                //   color: const Color(0xFFFF8800),
                //   fontSize: 70.sp,
                //   fontFamily: 'Core_Gothic_D5',
                // ),
              ),
              style: controller.passwordOutlinedButtonStyle(),
              // style: ElevatedButton.styleFrom(
              //   primary: Colors.white,
              //   onPrimary: Colors.white,
              //   shape: RoundedRectangleBorder(
              //     borderRadius: BorderRadius.circular(50.0),
              //     side: const BorderSide(color: Color(0xFFFF8800), width: 3),
              //   ),
              //   shadowColor: Colors.black,
              // ),
            ),
          ),
        ),
      );
}
