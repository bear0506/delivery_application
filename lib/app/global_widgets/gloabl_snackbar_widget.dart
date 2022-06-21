import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<SnackbarController> globalSnackBarWidget(
        {String title = "알림", String message = "메세지를 설정해주세요."}) async =>
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.TOP,
      duration: const Duration(seconds: 3),
      // icon: Icon(
      //   Icons.info,
      //   color: Colors.grey.shade100,
      // ),
      titleText: Text(
        title,
        style: const TextStyle(
            color: Colors.black, fontSize: 16, fontWeight: FontWeight.w900),
      ),
      messageText: Text(
        message,
        style: const TextStyle(
            color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
      ),
      margin: const EdgeInsets.all(20),
      // backgroundColor: Colors.white60,
    );

Future<dynamic> globalSnackBarDialogWidget(
        {String title = "알림", String message = "메세지를 설정해주세요."}) async =>
    await Get.defaultDialog(title: title, middleText: message);

Future<dynamic> globalSnackBarBottomWidget(
        {String message = "메세지를 설정해주세요."}) async =>
    await Get.bottomSheet(
      Container(
        height: 100,
        color: Colors.white,
        child: Center(
          child: Text(message),
        ),
      ),
      ignoreSafeArea: true,
      enterBottomSheetDuration: const Duration(milliseconds: 100),
      exitBottomSheetDuration: const Duration(milliseconds: 100),
    );
