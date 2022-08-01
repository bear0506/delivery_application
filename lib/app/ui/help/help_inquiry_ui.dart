import 'package:get/get.dart';

import 'package:shimmer/shimmer.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:delivery_service/app/controller/help/help_controller.dart';

class HelpInquiryUi extends StatelessWidget {
  HelpInquiryUi({Key? key}) : super(key: key);

  final HelpController controller = Get.find();

  @override
  Widget build(BuildContext context) => Obx(
        () => Scaffold(
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
              "1:1 문의",
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
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.fromLTRB(100.w, 60.h, 100.w, 0),
              child: controller.isLoaderVisible.value == true
                  ? _helpContentShimmerWidget()
                  : _helpContentWidget(),
            ),
          ),
          bottomNavigationBar: const BottomOutlinedButtonWidget(),
        ),
      );

  // 도움말 컨텐츠 위젯
  Widget _helpContentWidget() => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              "응답 가능 시간 11:00 ~ 19:00 (주말제외)",
              style: TextStyle(
                color: const Color(0xFFFF8800),
                fontSize: 70.sp,
                fontFamily: 'Core_Gothic_D6',
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 100.h,
          ),
          Center(
            child: Text(
              "응답 가능 시간 외의 시간에 하신 문의는",
              style: TextStyle(
                color: const Color(0xFF333333),
                fontSize: 60.sp,
                fontFamily: 'Core_Gothic_D6',
              ),
            ),
          ),
          Center(
            child: Text(
              "늦게 처리 될 수 있습니다.",
              style: TextStyle(
                color: const Color(0xFF333333),
                fontSize: 60.sp,
                fontFamily: 'Core_Gothic_D6',
              ),
            ),
          ),
        ],
      );

  // 도움말 컨텐츠 쉬머 위젯
  Widget _helpContentShimmerWidget() => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Shimmer.fromColors(
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.grey.shade100,
              child: Container(
                width: 1222.w,
                height: 97.h,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 100.h,
          ),
          Center(
            child: Shimmer.fromColors(
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.grey.shade100,
              child: Container(
                width: 984.w,
                height: 83.h,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Center(
            child: Shimmer.fromColors(
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.grey.shade100,
              child: Container(
                width: 700.w,
                height: 83.h,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
              ),
            ),
          ),
        ],
      );
}

class BottomOutlinedButtonWidget extends StatelessWidget {
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
          onPressed: () => {},
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
            "문의 메일 보내기",
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
