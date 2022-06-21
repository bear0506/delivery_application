import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:delivery_service/app/controller/splash/splash_controller.dart';

class SplashUi extends GetView<SplashController> {
  const SplashUi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFFFF8800),
                  Color(0xFFFF93A6),
                ],
                begin: FractionalOffset(0.0, 0.0),
                end: FractionalOffset(0.0, 1.0),
                stops: [0.0, 1.0],
                tileMode: TileMode.clamp,
              ),
            ),
          ),
        ],
      );
}
