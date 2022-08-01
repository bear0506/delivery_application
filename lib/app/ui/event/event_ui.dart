import 'package:get/get.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:delivery_service/app/controller/event/event_controller.dart';

class EventUi extends GetView<EventController> {
  EventUi({Key? key}) : super(key: key);

  @override
  final EventController controller = Get.find();

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
            "이벤트",
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
                    eventContentWidget(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget eventContentWidget() => ListView.separated(
        primary: false,
        shrinkWrap: true,
        separatorBuilder: (BuildContext context, int index) => const Divider(
          color: Color(0xFFB8B8B8),
          thickness: 1,
        ),
        itemCount: controller.events.length,
        itemBuilder: (BuildContext _, int index) => InkWell(
          child: SizedBox(
            width: 1240.w,
            height: 920.h,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  controller.events[index]["title"],
                  style: TextStyle(
                    color: const Color(0xFF333333),
                    fontSize: 60.sp,
                    fontFamily: 'Core_Gothic_D5',
                  ),
                ),
                Text(
                  controller.events[index]["date"],
                  style: TextStyle(
                    color: const Color(0xFF919191),
                    fontSize: 50.sp,
                    fontFamily: 'Core_Gothic_D4',
                  ),
                ),
                Image.asset(
                  controller.events[index]["img"],
                ),
              ],
            ),
          ),
          onTap: () {
            Get.toNamed('/event/${controller.events[index]["idx"]}');
            controller.onChangeEventIdx();
          },
        ),
      );
}
