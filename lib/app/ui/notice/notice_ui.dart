import 'package:get/get.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:delivery_service/app/controller/notice/notice_controller.dart';

class NoticeUi extends GetView<NoticeController> {
  NoticeUi({Key? key}) : super(key: key);

  @override
  final NoticeController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
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
            "공지",
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
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 40.h,
                  horizontal: 100.w,
                ),
                child: Column(
                  children: [
                    noticeContentWidget(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget noticeContentWidget() => ListView.separated(
        primary: false,
        shrinkWrap: true,
        separatorBuilder: (BuildContext context, int index) => Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 50.w,
            vertical: 50.h,
          ),
          child: const Divider(
            color: Color(0xFFB8B8B8),
            thickness: 1,
          ),
        ),
        itemCount: controller.notices.length,
        itemBuilder: (BuildContext _, int index) => ExpansionTile(
          iconColor: const Color(0xFF333333),
          collapsedIconColor: const Color(0xFF333333),
          title: Text(
            controller.notices[index]["date"],
            style: TextStyle(
              color: const Color(0xFFB8B8B8),
              fontSize: 40.sp,
              fontFamily: 'Core_Gothic_D5',
            ),
          ),
          subtitle: Text(
            controller.notices[index]["title"],
            style: TextStyle(
              color: const Color(0xFF333333),
              fontSize: 60.sp,
              fontFamily: 'Core_Gothic_D5',
            ),
          ),
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 50.w,
              ),
              child: Container(
                color: const Color(0xFFF8F8F8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      controller.notices[index]["img"],
                    ),
                    SizedBox(
                      height: 80.h,
                    ),
                    Text(
                      controller.notices[index]["contentTitle"],
                      style: TextStyle(
                        color: const Color(0xFF333333),
                        fontSize: 50.sp,
                        fontFamily: 'Core_Gothic_D6',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    Text(
                      controller.notices[index]["content"],
                      style: TextStyle(
                        color: const Color(0xFF333333),
                        fontSize: 40.sp,
                        fontFamily: 'Core_Gothic_D4',
                      ),
                    ),
                    SizedBox(
                      height: 80.h,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
}
