import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:delivery_service/app/core/values/colors.dart';

import 'package:delivery_service/app/controller/success/success_controller.dart';

class SuccessUi extends GetView<SuccessController> {
  const SuccessUi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Stack(
            children: [
              Container(
                padding: const EdgeInsets.all(40),
                height: Get.height - 80,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Stack(
                        children: [
                          Container(
                            width: 150,
                            height: 150,
                            child: const Icon(
                              Icons.check_rounded,
                              color: kPrimaryColor,
                              size: 120,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.grey.shade100,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const TitleWidget(),
                    const ContentWidget(),
                  ],
                ),
              ),
              const OutlinedButtonWidget(),
            ],
          ),
        ),
      );
}

class TitleWidget extends GetView<SuccessController> {
  const TitleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        children: [
          const SizedBox(height: 50),
          Center(
            child: Text(
              controller.title.value ?? "제목",
              style: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      );
}

class ContentWidget extends GetView<SuccessController> {
  const ContentWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        children: [
          const SizedBox(height: 25),
          Center(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Text(
                controller.content.value ?? "내용",
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 18, color: Colors.grey),
              ),
            ),
          ),
        ],
      );
}

class OutlinedButtonWidget extends GetView<SuccessController> {
  const OutlinedButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          padding: const EdgeInsets.fromLTRB(40, 0, 40, 20),
          width: double.infinity,
          height: 70,
          child: OutlinedButton(
            child: const Text(
              "확인",
              style: TextStyle(
                color: kPrimaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            onPressed: () {
              switch (controller.action.value) {
                case "signin":
                  Get.offAllNamed("/signin");
                  break;
                default:
                  Get.offAllNamed("/home");
              }
            },
            style: OutlinedButton.styleFrom(
              side: const BorderSide(color: kPrimaryColor, width: 1),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.0),
              ),
              backgroundColor: Colors.white,
              elevation: 1.1,
              shadowColor: Colors.black,
            ),
          ),
        ),
      );
}
