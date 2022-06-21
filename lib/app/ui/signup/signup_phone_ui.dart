import "package:flutter/material.dart";
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpPhoneUi extends StatelessWidget {
  const SignUpPhoneUi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppbarWidget(
        appBar: AppBar(),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.only(left: 135.w),
              child: Column(
                children: [
                  const CommentWidget(),
                  const NameWidget(),
                  SizedBox(
                    height: 150.h,
                  ),
                  const PhoneWidget(),
                  SizedBox(
                    height: 150.h,
                  ),
                  const PhoneVerifyWidget(),
                ],
              ),
            ),
            const BottomSheetElevatedButton(),
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

class NameWidget extends StatelessWidget {
  const NameWidget({Key? key}) : super(key: key);

  get controller => null;

  get globalFormKey => null;

  @override
  Widget build(BuildContext context) => Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
              right: 150.w,
            ),
            child: TextFormField(
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.go,
              autofocus: true,
              inputFormatters: <TextInputFormatter>[
                LengthLimitingTextInputFormatter(8),
              ],
              onFieldSubmitted: (value) =>
                  controller.handleNickNameOnFieldSubmitted(value: value),
              validator: (value) =>
                  controller.handleInfoValidator(type: "name", value: value),
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
                hintText: "이름",
                hintStyle: TextStyle(
                  color: const Color(0xFFDDDDDD),
                  fontSize: 60.sp,
                  fontFamily: 'Core_Gothic_D4',
                ),
              ),
            ),
          ),
        ],
      );
}

class PhoneWidget extends StatelessWidget {
  const PhoneWidget({Key? key}) : super(key: key);

  get controller => null;

  get globalFormKey => null;

  @override
  Widget build(BuildContext context) => Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
              right: 150.w,
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: TextFormField(
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
                  child: SizedBox(
                    width: 380.w,
                    height: 120.h,
                    child: ElevatedButton(
                      child: Text(
                        "인증번호 전송",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 40.sp,
                          fontFamily: 'Core_Gothic_D4',
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: const Color(0xFFFF8800),
                        onPrimary: const Color(0xFFFF8800),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0),
                          side: const BorderSide(
                              color: Color(0xFFFF8800), width: 3),
                        ),
                        shadowColor: Colors.black,
                      ),
                      onPressed: () {},
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      );
}

class PhoneVerifyWidget extends StatelessWidget {
  const PhoneVerifyWidget({Key? key}) : super(key: key);

  get controller => null;

  get globalFormKey => null;

  @override
  Widget build(BuildContext context) => Visibility(
        maintainState: true,
        maintainAnimation: true,
        maintainSize: false,
        maintainSemantics: false,
        maintainInteractivity: false,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                right: 150.w,
              ),
              child: TextFormField(
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
                  hintText: "인증번호 6자리",
                  hintStyle: TextStyle(
                    color: const Color(0xFFDDDDDD),
                    fontSize: 60.sp,
                    fontFamily: 'Core_Gothic_D4',
                  ),
                ),
              ),
            ),
          ],
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
              Get.toNamed("/signup/info", preventDuplicates: false),
          child: Text(
            "인증하기",
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
