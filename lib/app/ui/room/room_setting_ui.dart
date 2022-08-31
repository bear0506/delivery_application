import 'package:delivery_service/app/controller/order/order_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:delivery_service/app/controller/room/room_controller.dart';
import 'package:delivery_service/app/controller/address/address_controller.dart';
import 'package:intl/intl.dart';

class RoomSettingUi extends GetView<RoomController> {
  const RoomSettingUi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: NestedScrollView(
        physics: const ClampingScrollPhysics(),
        controller: controller.scrollController.value,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            Obx(
              () => SliverAppBar(
                elevation: 0,
                expandedHeight: 200.h,
                collapsedHeight: 200.h,
                automaticallyImplyLeading: false,
                titleSpacing: 0,
                backgroundColor: Colors.white,
                pinned: controller.temptemp.value,
                title: Padding(
                  padding: EdgeInsets.only(
                    left: 50.w,
                    top: 50.h,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: Image.asset(
                          "assets/icons/x.png",
                          color: const Color(0xFF333333),
                          width: 60.w,
                          height: 60.h,
                        ),
                        onPressed: () => Get.back(),
                      ),
                      SizedBox(
                        width: 20.w,
                      ),
                      Expanded(
                        child: Text(
                          "방 만들기",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: const Color(0xFF333333),
                            fontSize: 60.sp,
                            fontFamily: 'Core_Gothic_D5',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ];
        },
        body: Theme(
          data: Theme.of(context).copyWith(
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
              physics: const NeverScrollableScrollPhysics(),
              child: Column(
                children: [
                  SetAddressWidget(),
                  Divider(
                    color: Color(0xFFECECEC),
                    thickness: 5,
                  ),
                  // SelectTime(),
                  SelectTimeWidget(),
                  Divider(
                    color: Color(0xFFECECEC),
                    thickness: 5,
                  ),
                  // PeopleNumberSetting(),
                  NumberSettingWidget(),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomOutlinedButtonWidget(),
    );
  }
}

class SetAddressWidget extends GetView<RoomController> {
  const SetAddressWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 100.w,
          vertical: 60.h,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "배달 주소",
              style: TextStyle(
                color: const Color(0xFFB8B8B8),
                fontSize: 50.sp,
                fontFamily: 'Core_Gothic_D4',
              ),
            ),
            SizedBox(
              height: 45.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Text(
                    Get.put(AddressController()).currentAddress.value.address +
                        ", " +
                        Get.put(AddressController())
                            .currentAddress
                            .value
                            .detail,
                    style: TextStyle(
                      color: const Color(0xFF333333),
                      fontSize: 60.sp,
                      fontFamily: 'Core_Gothic_D5',
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                SizedBox(width: 20.w),
                TextButton(
                  onPressed: () {
                    Get.toNamed("/address");
                  },
                  style: TextButton.styleFrom(
                    splashFactory: NoSplash.splashFactory,
                    minimumSize: Size.zero,
                    padding: EdgeInsets.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  child: Text(
                    "변경",
                    style: TextStyle(
                      color: const Color(0xFFFF8800),
                      fontSize: 50.sp,
                      fontFamily: 'Core_Gothic_D5',
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class SetAddress extends StatelessWidget {
  const SetAddress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 310.h,
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 100.w,
          vertical: 40.h,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "배달 주소",
              style: TextStyle(
                color: const Color(0xFFB8B8B8),
                fontSize: 50.sp,
                fontFamily: 'Core_Gothic_D4',
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "서울 중구 퇴계로36길 2 910호",
                  style: TextStyle(
                    color: const Color(0xFF333333),
                    fontSize: 60.sp,
                    fontFamily: 'Core_Gothic_D5',
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    splashFactory: NoSplash.splashFactory,
                  ),
                  child: Text(
                    "변경",
                    style: TextStyle(
                      color: const Color(0xFFFF8800),
                      fontSize: 50.sp,
                      fontFamily: 'Core_Gothic_D5',
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class SelectTimeWidget extends GetView<RoomController> {
  openSelectTimeModal(BuildContext context) async {
    final TimeOfDay? timeOfDay = await showTimePicker(
      context: context,
      initialTime: controller.selectedTime.value,
      // initialTime: TimeOfDay(
      //     hour: controller.selectedTime.value.hour,
      //     minute: controller.selectedTime.value.minute),
      initialEntryMode: TimePickerEntryMode.input,
      confirmText: "확인",
      cancelText: "취소",
      helpText: "시간 설정",
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            timePickerTheme: TimePickerThemeData(
              backgroundColor: const Color(0xFFFFFFFF),
              dayPeriodShape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                side: BorderSide(color: Colors.orange, width: 0),
              ),
              dialHandColor: const Color(0xFF999999),
              dialBackgroundColor: const Color(0xFFE0E0E0),
              hourMinuteTextStyle: TextStyle(
                fontSize: 100.sp,
                fontWeight: FontWeight.bold,
              ),
              dayPeriodTextStyle: TextStyle(
                fontSize: 40.sp,
                fontWeight: FontWeight.bold,
              ),
              helpTextStyle: TextStyle(
                  fontSize: 30.sp,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF333333)),
              entryModeIconColor: const Color(0xFF333333),
            ),
            colorScheme: const ColorScheme.light(
              primary: Color(0xFFFF8800),
              onPrimary: Color(0xFFFF8800),
              onSurface: Color(0xFF333333),
            ),
            textButtonTheme: TextButtonThemeData(
              style: ButtonStyle(
                foregroundColor: MaterialStateColor.resolveWith(
                  (states) => const Color(0xFF999999),
                ),
              ),
            ),
          ),
          child: MediaQuery(
            data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
            child: child!,
          ),
        );
      },
    );
    if (timeOfDay != null && timeOfDay != controller.selectedTime) {
      controller.selectedTime.value = timeOfDay;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Padding(
        padding: EdgeInsets.symmetric(
          vertical: 40.h,
          horizontal: 100.w,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "주문 시간 설정",
                      style: TextStyle(
                        color: const Color(0xFFB8B8B8),
                        fontSize: 50.sp,
                        fontFamily: 'Core_Gothic_D4',
                      ),
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    Text(
                      "입력한 시간에 맞추어 주문이 진행됩니다.",
                      style: TextStyle(
                        color: const Color(0xFFB8B8B8),
                        fontSize: 40.sp,
                        fontFamily: 'Core_Gothic_D4',
                      ),
                    ),
                  ],
                ),
                TextButton(
                  onPressed: () {
                    openSelectTimeModal(context);
                  },
                  style: TextButton.styleFrom(
                    splashFactory: NoSplash.splashFactory,
                  ),
                  child: Text(
                    "시간 변경",
                    style: TextStyle(
                      color: const Color(0xFFFF8800),
                      fontSize: 50.sp,
                      fontFamily: 'Core_Gothic_D5',
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 80.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 400.w,
                  height: 350.h,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 10.w,
                      color: const Color(0xFFFF8800),
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 60.h,
                      horizontal: 85.w,
                    ),
                    child: Text(
                      controller.selectedTime.value.hour < 10
                          ? "0${controller.selectedTime.value.hour}"
                          : "${controller.selectedTime.value.hour}",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: const Color(0xFF333333),
                        fontSize: 180.sp,
                        fontFamily: 'Core_Gothic_D5',
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 40.h,
                  ),
                  child: Text(
                    ":",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: const Color(0xFF333333),
                      fontSize: 200.sp,
                      fontFamily: 'Core_Gothic_D5',
                    ),
                  ),
                ),
                Container(
                  width: 400.w,
                  height: 350.h,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 10.w,
                      color: const Color(0xFFFF8800),
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 60.h,
                      horizontal: 85.w,
                    ),
                    child: Text(
                      controller.selectedTime.value.minute >= 10
                          ? "${controller.selectedTime.value.minute}"
                          : "0${controller.selectedTime.value.minute}",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: const Color(0xFF333333),
                        fontSize: 180.sp,
                        fontFamily: 'Core_Gothic_D5',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class NumberSettingWidget extends GetView<RoomController> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        padding: EdgeInsets.symmetric(
          horizontal: 100.w,
          vertical: 40.h,
        ),
        height: 350.h,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "인원 설정",
              style: TextStyle(
                color: const Color(0xFFB8B8B8),
                fontSize: 50.sp,
                fontFamily: 'Core_Gothic_D4',
              ),
            ),
            Text(
              "최소 2인에서 최대 5인까지 인원을 설정해주세요.",
              style: TextStyle(
                color: const Color(0xFFB8B8B8),
                fontSize: 40.sp,
                fontFamily: 'Core_Gothic_D4',
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Spacer(),
                SizedBox(
                  width: 80.w,
                  height: 80.h,
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onPressed: () {
                      controller.minusNumberOfPeople();
                    },
                    icon: Image.asset("assets/icons/minus1.png"),
                  ),
                ),
                SizedBox(
                  width: 60.w,
                ),
                Text(
                  controller.numberOfPeople.value.toString(),
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 60.sp,
                    fontFamily: 'Core_Gothic_D5',
                  ),
                ),
                SizedBox(
                  width: 60.w,
                ),
                SizedBox(
                  width: 80.w,
                  height: 80.h,
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onPressed: () {
                      controller.plusNumberOfPeople();
                    },
                    icon: Image.asset("assets/icons/plus1.png"),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class BottomOutlinedButtonWidget extends GetView<RoomController> {
  BottomOutlinedButtonWidget({Key? key}) : super(key: key);

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
          onPressed: () {
            // Get.toNamed('/store=${controller.storeIdx}/roomResult');
            print(Get.put(AddressController()).currentAddress.value.address +
                ", " +
                Get.put(AddressController()).currentAddress.value.detail);

            print(controller.selectedTime.value);

            controller.handleRoomAddProvider();

            // print(Get.put(OrderController()).)
            // print(DateFormat('yyyy-MM-dd HH:mm:ss')
            //     .format(controller.selectedTime.value));
          },
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
            "방 만들기",
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
