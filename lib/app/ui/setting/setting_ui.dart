import 'package:get/get.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: depend_on_referenced_packages
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import 'package:delivery_service/app/controller/setting/setting_controller.dart';

class SettingUi extends GetView<SettingController> {
  SettingUi({Key? key}) : super(key: key);

  @override
  final SettingController controller = Get.find();

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
            "도움말",
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
                    // switchWidget(),
                    ListView.separated(
                      primary: false,
                      shrinkWrap: true,
                      separatorBuilder: (BuildContext context, int index) =>
                          Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 50.w,
                          vertical: 50.h,
                        ),
                        child: const Divider(
                          color: Color(0xFFB8B8B8),
                          thickness: 1,
                        ),
                      ),
                      itemCount: controller.switchContent.length,
                      itemBuilder: (BuildContext _, int index) => Column(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 50.w,
                            ),
                            child: Container(
                              color: Colors.white,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    controller.switchContent[index]["title"],
                                    style: TextStyle(
                                      color: const Color(0xFF333333),
                                      fontSize: 50.sp,
                                      fontFamily: 'Core_Gothic_D6',
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Obx(
                                    () => Switch(
                                      value: controller
                                          .switchContent[index]["isChecked"]
                                          .value,
                                      onChanged: (value) {
                                        controller
                                                .switchContent[index]["isChecked"]
                                                .value =
                                            !controller
                                                .switchContent[index]
                                                    ["isChecked"]
                                                .value;
                                      },
                                      activeTrackColor: const Color(0xFFFF8800),
                                      activeColor: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    controller
                            .switchContent[controller.switchContent.length - 1]
                                ["isChecked"]
                            .value
                        ? Obx(
                            () => SfSliderTheme(
                              data: SfSliderThemeData(
                                activeTrackHeight: 10.h,
                                inactiveTrackHeight: 10.h,
                                tickSize: Size(0.w, 50.h),
                                minorTickSize: Size(0.w, 0.h),
                                tickOffset: Offset(0, -30.h),
                                inactiveLabelStyle: TextStyle(
                                  color: const Color(0xFF333333),
                                  fontSize: 40.sp,
                                  fontFamily: 'Core_Gothic_D5',
                                ),
                                activeLabelStyle: TextStyle(
                                  color: const Color(0xFF333333),
                                  fontSize: 40.sp,
                                  fontFamily: 'Core_Gothic_D5',
                                ),
                                tooltipTextStyle: TextStyle(
                                  color: const Color(0xFF333333),
                                  fontSize: 40.sp,
                                  fontFamily: 'Core_Gothic_D5',
                                ),
                                inactiveTrackColor: const Color(0xFFCFCFCF),
                                activeTrackColor: const Color(0xFFFF8800),
                                thumbColor: Colors.white,
                                activeTickColor: const Color(0xFFFF8800),
                                inactiveTickColor: const Color(0xFFCFCFCF),
                                overlayColor:
                                    const Color(0xFFFF8800).withOpacity(0.1),
                                thumbStrokeColor: const Color(0xFFFF8800),
                                thumbStrokeWidth: 5.w,
                                trackCornerRadius: 0,
                              ),
                              child: SfSlider(
                                min: 100.0,
                                max: 500.0,
                                value: controller.distance.value,
                                interval: 100,
                                stepSize: 100,
                                showTicks: true,
                                showLabels: true,
                                enableTooltip: false,
                                minorTicksPerInterval: 10,
                                onChanged: (dynamic value) {
                                  controller.distance.value = value;
                                },
                              ),
                            ),
                          )
                        : Container(),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 50.w,
                        vertical: 50.h,
                      ),
                      child: const Divider(
                        color: Color(0xFFB8B8B8),
                        thickness: 1,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
