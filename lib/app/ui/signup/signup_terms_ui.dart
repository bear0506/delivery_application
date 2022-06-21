import "package:flutter/material.dart";
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:delivery_service/app/core/values/colors.dart';

import 'package:delivery_service/app/controller/signup/signup_controller.dart';

import 'package:delivery_service/app/global_widgets/global_loader_widget.dart';

class SignUpTermsUi extends GetView<SignUpController> {
  const SignUpTermsUi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Obx(
        () => Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppbarWidget(appBar: AppBar()),
          body: SafeArea(
            child: Stack(
              children: [
                Container(
                  padding: const EdgeInsets.all(40),
                  child: Column(
                    children: const [
                      CommentWidget(),
                      SizedBox(
                        height: 50,
                      ),
                      TermsAllCheckBoxWidget(),
                      Expanded(
                        flex: 1,
                        child: TermsCheckBoxWidget(),
                      ),
                    ],
                  ),
                ),
                const BottomSheetOutlinedButton(),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 500.h),
          Row(
            children: [
              Text(
                "배달띱",
                style: TextStyle(
                  color: const Color(0xFFFF8800),
                  fontFamily: 'Jalnan',
                  fontSize: 120.sp,
                ),
              ),
              SizedBox(
                width: 30.w,
              ),
              Text(
                "에 오신 것을",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 70.sp,
                  fontFamily: 'Core_Gothic_D5',
                ),
              ),
            ],
          ),
          SizedBox(
            height: 15.h,
          ),
          Text(
            "환영합니다!",
            style: TextStyle(
              color: Colors.black,
              fontSize: 70.sp,
              fontFamily: 'Core_Gothic_D5',
            ),
          ),
        ],
      );
}

class TermsAllCheckBoxWidget extends GetView<SignUpController> {
  const TermsAllCheckBoxWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Obx(
        () => Column(
          children: [
            Theme(
              data: ThemeData(unselectedWidgetColor: kPrimaryColor),
              child: CheckboxListTile(
                focusNode: controller.allCheckBoxFocusNode,
                controlAffinity: ListTileControlAffinity.leading,
                contentPadding: EdgeInsets.zero,
                title: Text(
                  controller.isAllCheckBox["title"],
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                value: controller.isAllCheckBox["isChecked"],
                activeColor: kPrimaryColor,
                onChanged: (bool? value) {
                  controller.isAllCheckBox["isChecked"] = value;

                  for (var index = 0;
                      index < controller.isCheckbox.length;
                      index++) {
                    controller.isCheckbox[index]["isChecked"].value = value;
                  }
                },
              ),
            ),
            const Divider(
              color: Colors.black12,
              thickness: 1,
            ),
          ],
        ),
      );
}

class TermsCheckBoxWidget extends GetView<SignUpController> {
  const TermsCheckBoxWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Obx(
        () => ListView.builder(
          itemCount: controller.isCheckbox.length,
          itemBuilder: (BuildContext context, int index) => Obx(
            () => Theme(
              data: ThemeData(unselectedWidgetColor: kPrimaryColor),
              child: CheckboxListTile(
                focusNode: index == 0
                    ? controller.termsCheckBoxFocusNode
                    : controller.privacyCheckBoxFocusNode,
                controlAffinity: ListTileControlAffinity.leading,
                contentPadding: EdgeInsets.zero,
                title: GestureDetector(
                  onTap: () {
                    Get.defaultDialog(
                      title: controller.isCheckbox[index]["title"].value,
                      content: Container(
                        padding: const EdgeInsets.all(20),
                        height: 200,
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text(controller
                                  .isCheckbox[index]["content"].value),
                            ],
                          ),
                        ),
                      ),
                      titleStyle: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        controller.isCheckbox[index]["title"].value,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 5),
                      const Icon(
                        Icons.circle,
                        size: 6,
                        color: Colors.red,
                      ),
                    ],
                  ),
                ),
                value: controller.isCheckbox[index]["isChecked"].value,
                activeColor: kPrimaryColor,
                onChanged: (bool? value) {
                  controller.isCheckbox[index]["isChecked"].value = value;
                  controller.isCheckbox.every((e) => e["isChecked"].value) ==
                          true
                      ? controller.isAllCheckBox["isChecked"] = true
                      : controller.isAllCheckBox["isChecked"] = false;
                },
              ),
            ),
          ),
        ),
      );
}

class BottomSheetOutlinedButton extends GetView<SignUpController> {
  const BottomSheetOutlinedButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Obx(
        () => Align(
          alignment: Alignment.bottomCenter,
          child: SizedBox(
            // padding: EdgeInsets.only(bottom: 250.h,),
            width: 800.w,
            height: 200.h,
            child: OutlinedButton(
              focusNode: controller.termsOutlinedButtonFocusNode,
              onPressed: () => controller.outlinedButtonOnPressed(),
              child: Text(
                "다음",
                style: controller.outlinedButtonTextStyle(),
              ),
              style: controller.outlinedButtonStyle(),
            ),
          ),
        ),
      );
}

class BottomSheetElevatedButton extends GetView<SignUpController> {
  const BottomSheetElevatedButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: SizedBox(
        // padding: EdgeInsets.only(
        //   bottom: 250.h,
        // ),
        width: 800.w,
        height: 200.h,
        child: ElevatedButton(
          onPressed: () => controller.outlinedButtonOnPressed(),
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
