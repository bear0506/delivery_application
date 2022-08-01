import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:delivery_service/app/controller/room/room_controller.dart';

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
                children: const [
                  SetAddress(),
                  Divider(
                    color: Color(0xFFECECEC),
                    thickness: 5,
                  ),
                  SelectTime(),
                  Divider(
                    color: Color(0xFFECECEC),
                    thickness: 5,
                  ),
                  PeopleNumberSetting(),
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

class SelectTime extends StatefulWidget {
  const SelectTime({Key? key}) : super(key: key);

  @override
  State<SelectTime> createState() => _SelectTimeState();
}

class _SelectTimeState extends State<SelectTime> {
  TimeOfDay selectedTime = TimeOfDay.now();
  @override
  Widget build(BuildContext context) {
    return Padding(
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
                  _selectTime(context);
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
                    selectedTime.hour < 10
                        ? "0${selectedTime.hour}"
                        : "${selectedTime.hour}",
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
                    selectedTime.minute >= 10
                        ? "${selectedTime.minute}"
                        : "0${selectedTime.minute}",
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
    );
  }

  _selectTime(BuildContext context) async {
    final TimeOfDay? timeOfDay = await showTimePicker(
      context: context,
      initialTime: selectedTime,
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
    if (timeOfDay != null && timeOfDay != selectedTime) {
      setState(
        () {
          selectedTime = timeOfDay;
        },
      );
    }
  }
}

// class SelectTime extends GetView<RoomController> {
//   const SelectTime({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) => Obx(
//         () => Padding(
//           padding: EdgeInsets.symmetric(
//             horizontal: 100.w,
//             vertical: 40.h,
//           ),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 "주문 시간 설정",
//                 style: TextStyle(
//                   color: const Color(0xFFB8B8B8),
//                   fontSize: 50.sp,
//                   fontFamily: 'Core_Gothic_D4',
//                 ),
//               ),
//               SizedBox(
//                 height: 30.h,
//               ),
//               Text(
//                 "입력한 시간에 맞추어 주문이 진행됩니다.",
//                 style: TextStyle(
//                   color: const Color(0xFFB8B8B8),
//                   fontSize: 40.sp,
//                   fontFamily: 'Core_Gothic_D4',
//                 ),
//               ),
//               ListView.builder(
//                 physics: const NeverScrollableScrollPhysics(),
//                 shrinkWrap: true,
//                 itemCount: controller.isCheckbox.length,
//                 itemBuilder: (BuildContext context, int index) => Obx(
//                   () => Theme(
//                     data: ThemeData(unselectedWidgetColor: kPrimaryColor),
//                     child: CheckboxListTile(
//                       focusNode: index == 0
//                           ? controller.timeCheckBoxFocusNode
//                           : controller.privacyCheckBoxFocusNode,
//                       controlAffinity: ListTileControlAffinity.leading,
//                       contentPadding: EdgeInsets.zero,
//                       dense: true,
//                       title: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             controller.isCheckbox[index]["time"].value,
//                             style: TextStyle(
//                               color: const Color(0xFF333333),
//                               fontSize: 60.sp,
//                               fontFamily: 'Core_Gothic_D5',
//                             ),
//                           ),
//                         ],
//                       ),
//                       value: controller.isCheckbox[index]["isChecked"].value,
//                       activeColor: kPrimaryColor,
//                       onChanged: (bool? value) {
//                         for (var element in controller.isCheckbox) {
//                           element["isChecked"].value = false;
//                         }
//                         controller.isCheckbox[index]["isChecked"].value = value;
//                       },
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       );
// }

class PeopleNumberSetting extends StatefulWidget {
  const PeopleNumberSetting({Key? key}) : super(key: key);

  @override
  State<PeopleNumberSetting> createState() => _PeopleNumberSettingState();
}

int n = 2;

class _PeopleNumberSettingState extends State<PeopleNumberSetting> {
  void add() {
    if (n < 5) {
      setState(() {
        n++;
      });
    }
  }

  void minus() {
    if (n > 2) {
      setState(() {
        n--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
                child: FloatingActionButton(
                  backgroundColor: const Color(0xFFEFEFEF),
                  splashColor: Colors.transparent,
                  elevation: 0,
                  onPressed: minus,
                  heroTag: "minus",
                  child: Image.asset(
                    "assets/icons/minus.png",
                    width: 50.w,
                    height: 50.h,
                  ),
                ),
              ),
              SizedBox(
                width: 60.w,
              ),
              Text(
                "$n",
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
                child: FloatingActionButton(
                  backgroundColor: const Color(0xFFEFEFEF),
                  splashColor: Colors.transparent,
                  elevation: 0,
                  onPressed: add,
                  heroTag: "plus",
                  child: Image.asset(
                    "assets/icons/plus.png",
                    width: 50.w,
                    height: 50.h,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class BottomOutlinedButtonWidget extends StatelessWidget {
  BottomOutlinedButtonWidget({Key? key}) : super(key: key);

  final roomController = Get.put(RoomController());

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
            Get.toNamed('/store=${roomController.storeIdx}/roomResult');
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
