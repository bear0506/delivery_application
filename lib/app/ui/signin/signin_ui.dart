import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:delivery_service/app/core/values/colors.dart';

import 'package:delivery_service/app/controller/signin/signin_controller.dart';

class SignInUi extends GetView<SignInController> {
  const SignInUi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // => Obx(() =>
    return Scaffold(
      resizeToAvoidBottomInset: true,
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: AppbarWidget(
        appBar: AppBar(),
      ),
      body: Stack(
        children: [
          SizedBox(
            // width: Get.width,
            child: Image.asset(
              'assets/images/signin/background.png',
              fit: BoxFit.cover,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(40),
                height: Get.height - 1000.h,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30.0),
                    topLeft: Radius.circular(30.0),
                  ),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    const LogoWidget(),
                    SizedBox(height: 250.h),
                    const EmailWidget(),
                    SizedBox(height: 120.h),
                    const PasswordWidget(),
                    SizedBox(height: 20.h),
                    const FindWidget(),
                    SizedBox(height: 330.h),
                    const ElevatedButtonWidget(),
                    SizedBox(height: 50.h),
                    const SignUpTextButtonWidget(),
                  ],
                ),
              ),
            ),
          ),
          // GlobalCustomLoaderWidget(
          //     isLoaderisible: controller.isLoaderVisible.value),
        ],
      ),
    );
  }
}

class LogoWidget extends StatelessWidget {
  const LogoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Align(
        alignment: Alignment.centerLeft,
        child: Container(
          alignment: Alignment.topCenter,
          child: Text(
            "배달띱",
            style: TextStyle(
              color: const Color(0xFFFF8800),
              fontFamily: 'Jalnan',
              fontSize: 120.sp,
            ),
          ),
        ),
      );
}

class EmailWidget extends GetView<SignInController> {
  const EmailWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => TextFormField(
        controller: controller.emailController.value,
        keyboardType: TextInputType.emailAddress,
        textInputAction: TextInputAction.next,
        // inputFormatters: [
        //   FilteringTextInputFormatter.deny(RegExp(
        //       r"/^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{3,}$/i")),
        // ],
        // onFieldSubmitted: (value) => controller.handleEmailOnFieldSubmitted(),
        // validator: (value) =>
        //     controller.handleValidator(type: "email", value: value),
        style: TextStyle(
            fontFamily: 'Core_Gothic_D4',
            color: const Color(0xFF333333),
            fontSize: 60.sp),
        decoration: InputDecoration(
          hintText: "이메일을 입력해주세요",
          hintStyle: TextStyle(
            fontFamily: 'Core_Gothic_D4',
            color: const Color(0xFFDDDDDD),
            fontSize: 60.sp,
          ),
          // enabledBorder: UnderlineInputBorder(
          //   borderSide: BorderSide(color: kPrimaryColor, width: 2),
          // ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xFFFF8800),
            ),
          ),
        ),
      );
}

class PasswordWidget extends GetView<SignInController> {
  const PasswordWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Obx(
        () => TextFormField(
          controller: controller.passwordController.value,
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.done,
          obscureText: controller.isPasswordVisible.value,
          // inputFormatters: <TextInputFormatter>[
          //   LengthLimitingTextInputFormatter(20),
          // ],
          // onFieldSubmitted: (value) =>
          //     controller.handlePasswordOnFieldSubmitted(),
          // validator: (value) =>
          //     controller.handleValidator(type: "password", value: value),
          style: TextStyle(
              fontFamily: 'Core_Gothic_D4',
              color: const Color(0xFF333333),
              fontSize: 60.sp),
          decoration: InputDecoration(
            hintText: "비밀번호를 입력해주세요",
            hintStyle: TextStyle(
              fontFamily: 'Core_Gothic_D4',
              color: const Color(0xFFDDDDDD),
              fontSize: 60.sp,
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                color: Color(0xFFFF8800),
              ),
            ),
            // enabledBorder: const UnderlineInputBorder(
            //   borderSide: BorderSide(color: kPrimaryColor, width: 2),
            // ),
            suffixIcon: IconButton(
              onPressed: () => controller.isPasswordVisible.value =
                  !controller.isPasswordVisible.value,
              icon: Icon(controller.isPasswordVisible.value
                  ? Icons.visibility_off
                  : Icons.visibility),
            ),
          ),
        ),
      );
}

class FindWidget extends StatelessWidget {
  const FindWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TextButton(
            child: Text(
              "이메일 / 비밀번호 찾기",
              style: TextStyle(
                fontFamily: 'Core_Gothic_D4',
                color: const Color(0xFF333333),
                fontSize: 50.sp,
              ),
            ),
            // onPressed: () => Get.toNamed("/find", preventDuplicates: false),
            onPressed: () => {},
          ),
        ],
      );
}

class ElevatedButtonWidget extends GetView<SignInController> {
  const ElevatedButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => SizedBox(
        width: 800.w,
        height: 200.h,
        child: ElevatedButton(
          child: Text(
            "로그인",
            style: TextStyle(
              fontFamily: 'Core_Gothic_D5',
              color: const Color(0xFFFFFFFF),
              fontSize: 70.sp,
            ),
          ),
          style: ElevatedButton.styleFrom(
            primary: kPrimaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50.0),
              side: const BorderSide(color: kPrimaryColor, width: 2),
            ),
            shadowColor: Colors.black,
          ),
          onPressed: () => controller.handleSignInProvider(),
          // onPressed: () => {},
        ),
      );
}

class SignUpTextButtonWidget extends StatelessWidget {
  const SignUpTextButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => SizedBox(
        height: 32,
        child: TextButton(
          child: const Text(
            "배달띱이 처음이신가요?",
            style: TextStyle(
              color: Colors.black45,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          onPressed: () =>
              Get.toNamed("/signup/terms", preventDuplicates: false),
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
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: const Color(0xFFFFFFFF),
            size: 120.w,
          ),
          tooltip: "뒤로가기",
          onPressed: () => Get.back(),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: <Color>[Colors.black, Colors.black.withOpacity(0)],
            ),
          ),
        ),
      );
}
