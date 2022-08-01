import 'package:get/get.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:delivery_service/app/controller/event/event_controller.dart';

class EventDetailUi extends GetView<EventController> {
  EventDetailUi({Key? key}) : super(key: key);

  @override
  final EventController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: Colors.white,
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
            "이벤트 페이지",
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
              child: eventContentDetailWidget(
                int.parse(controller.eventIdx.value),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget eventContentDetailWidget(int eventIdx) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            controller.events[eventIdx - 1]["img"],
            fit: BoxFit.fill,
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 100.w,
              top: 50.h,
              right: 100.w,
              bottom: 100.h,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  controller.events[eventIdx - 1]["title"],
                  style: TextStyle(
                    color: const Color(0xFF333333),
                    fontSize: 60.sp,
                    fontFamily: 'Core_Gothic_D5',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 50.h,
                ),
                Text(
                  controller.events[eventIdx - 1]["date"],
                  style: TextStyle(
                    color: const Color(0xFF919191),
                    fontSize: 50.sp,
                    fontFamily: 'Core_Gothic_D4',
                  ),
                ),
              ],
            ),
          ),
          Image.asset(
            controller.events[eventIdx - 1]["content"],
            fit: BoxFit.fill,
          ),
        ],
      );
}
