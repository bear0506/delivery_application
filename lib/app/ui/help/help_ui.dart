import 'package:get/get.dart';

import 'package:shimmer/shimmer.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:delivery_service/app/controller/help/help_controller.dart';

class HelpUi extends StatelessWidget {
  HelpUi({Key? key}) : super(key: key);

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
              "고객지원",
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
        ),
      );

  // 도움말 컨텐츠 위젯
  Widget _helpContentWidget() => Column(
        children: [
          SizedBox(
            width: 1240.w,
            height: 550.h,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: 50.w,
                    bottom: 30.h,
                  ),
                  child: Text(
                    "고객센터",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: const Color(0xFFB8B8B8),
                      fontSize: 50.sp,
                      fontFamily: 'Core_Gothic_D4',
                    ),
                  ),
                ),
                ListTile(
                  title: Text(
                    '1:1 문의',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 60.sp,
                      fontFamily: 'Core_Gothic_D5',
                    ),
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    size: 20,
                    color: Colors.black,
                  ),
                  onTap: () => Get.toNamed('/help/inquiry'),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 60.w,
                  ),
                  child: const Divider(
                    color: Color(0xFFB8B8B8),
                    thickness: 1,
                  ),
                ),
                ListTile(
                  title: Text(
                    '자주하는 질문',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 60.sp,
                      fontFamily: 'Core_Gothic_D5',
                    ),
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    size: 20,
                    color: Colors.black,
                  ),
                  onTap: () => Get.toNamed('/help/fqa'),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 60.w,
                  ),
                  child: const Divider(
                    color: Color(0xFFB8B8B8),
                    thickness: 1,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 150.h,
          ),
          SizedBox(
            width: 1240.w,
            height: 320.h,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: 50.w,
                    bottom: 30.h,
                  ),
                  child: Text(
                    "도움말",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: const Color(0xFFB8B8B8),
                      fontSize: 50.sp,
                      fontFamily: 'Core_Gothic_D4',
                    ),
                  ),
                ),
                ListTile(
                  title: Text(
                    '도움말',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 60.sp,
                      fontFamily: 'Core_Gothic_D5',
                    ),
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    size: 20,
                    color: Colors.black,
                  ),
                  onTap: () => Get.toNamed('/help/detail'),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 60.w,
                  ),
                  child: const Divider(
                    color: Color(0xFFB8B8B8),
                    thickness: 1,
                  ),
                ),
              ],
            ),
          ),
        ],
      );

  // 도움말 컨텐츠 쉬머 위젯
  Widget _helpContentShimmerWidget() => Column(
        children: [
          SizedBox(
            width: 1240.w,
            height: 560.h,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: 50.w,
                    bottom: 30.h,
                  ),
                  child: Shimmer.fromColors(
                    baseColor: Colors.grey.shade300,
                    highlightColor: Colors.grey.shade100,
                    child: Container(
                      width: 184.w,
                      height: 69.h,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                    ),
                  ),
                ),
                ListTile(
                  title: Shimmer.fromColors(
                    baseColor: Colors.grey.shade300,
                    highlightColor: Colors.grey.shade100,
                    child: Container(
                      width: 1240.w,
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
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 60.w,
                  ),
                  child: const Divider(
                    color: Color(0xFFB8B8B8),
                    thickness: 1,
                  ),
                ),
                ListTile(
                  title: Shimmer.fromColors(
                    baseColor: Colors.grey.shade300,
                    highlightColor: Colors.grey.shade100,
                    child: Container(
                      width: 1240.w,
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
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 60.w,
                  ),
                  child: const Divider(
                    color: Color(0xFFB8B8B8),
                    thickness: 1,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 150.h,
          ),
          SizedBox(
            width: 1240.w,
            height: 330.h,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: 50.w,
                    bottom: 30.h,
                  ),
                  child: Shimmer.fromColors(
                    baseColor: Colors.grey.shade300,
                    highlightColor: Colors.grey.shade100,
                    child: Container(
                      width: 184.w,
                      height: 69.h,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                    ),
                  ),
                ),
                ListTile(
                  title: Shimmer.fromColors(
                    baseColor: Colors.grey.shade300,
                    highlightColor: Colors.grey.shade100,
                    child: Container(
                      width: 1240.w,
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
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 60.w,
                  ),
                  child: const Divider(
                    color: Color(0xFFB8B8B8),
                    thickness: 1,
                  ),
                ),
              ],
            ),
          ),
        ],
      );
}
