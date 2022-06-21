import 'package:delivery_service/app/controller/main/main_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:delivery_service/app/ui/home/home_ui.dart';
import 'package:get/get.dart';

const navBarHeight = 10.0;

class MainUi extends GetView<MainController> {
  const MainUi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ScreenUtilInit(
        designSize:
            Size(controller.deviceWidth.value, controller.deviceHeight.value),
        builder: (context, child) => HomeUi(),
      ),
    );
  }
}
