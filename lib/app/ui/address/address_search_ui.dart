import 'package:delivery_service/app/core/values/colors.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:delivery_service/app/controller/address/address_controller.dart';
import 'package:intl/intl.dart';
import 'package:kpostal/kpostal.dart';

class AddressSearchUi extends GetView<AddressController> {
  AddressSearchUi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return KpostalView(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        titleSpacing: 0,
        title: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                icon: Image.asset(
                  "assets/icons/x.png",
                  width: 50.w,
                  height: 50.h,
                ),
                onPressed: () =>
                    Get.until((route) => Get.currentRoute == "/address"),
              ),
              Text(
                controller.temp2.value,
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: const Color(0xFF333333),
                  fontSize: 60.sp,
                  fontFamily: 'Core_Gothic_D6',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
      callback: (Kpostal result) {
        controller.addressTextFormFieldController.text = result.address;
        controller.addressLat.value = result.latitude.toString();
        controller.addressLng.value = result.longitude.toString();
      },
    );
  }
}
