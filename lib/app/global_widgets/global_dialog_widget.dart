import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:delivery_service/app/core/values/colors.dart';

Future<dynamic> globalTradeDialogWidget(
        {String idx = "0", String content = "내용"}) =>
    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.all(10),
        height: 160,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Wrap(
                children: [
                  Text(
                    content,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
                width: Get.width,
                height: 50,
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 1,
                      child: SizedBox(
                        height: 50,
                        child: ElevatedButton(
                          child: const Text(
                            "상호교환",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onPressed: () => Get.toNamed(
                              "/house/trade/mutual/$idx",
                              preventDuplicates: false),
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      flex: 1,
                      child: SizedBox(
                        height: 50,
                        child: OutlinedButton(
                          child: const Text(
                            "단일여행",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onPressed: () =>
                              Get.toNamed("/house/trade/single/$idx"),
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
          ],
        ),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
        ),
      ),
      elevation: 20.0,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
    );

Future<dynamic> globalTradeRequestDialogWidget(
        {dynamic controller,
        dynamic context,
        String content = "내용",
        String button = "버튼",
        dynamic action}) =>
    Get.bottomSheet(
      Obx(
        () => Container(
          padding: const EdgeInsets.all(10),
          height: 310,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Wrap(
                  children: [
                    Text(
                      content,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              // const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                          flex: 1,
                          child: InkWell(
                            onTap: () => controller.handleDatePikcer(
                                context: context, type: "시작"),
                            child: IgnorePointer(
                              child: TextFormField(
                                controller:
                                    controller.startedAtController.value,
                                focusNode: controller.startedAtFocusNode.value,
                                enabled: false,
                                keyboardType: TextInputType.datetime,
                                textInputAction: TextInputAction.go,
                                onChanged: (value) => controller
                                    .globalFormKey.currentState!
                                    .save(),
                                style: const TextStyle(
                                    color: kTextBodyColor, fontSize: 16),
                                decoration: const InputDecoration(
                                  labelText: "숙박 희망 시작 날짜",
                                  hintText: "시작날짜를 선택해주세요.",
                                  hintStyle: TextStyle(
                                    color: Colors.black12,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        SizedBox(
                          width: 30,
                          height: 30,
                          child: IconButton(
                            onPressed: () => controller.handleDatePikcer(
                                context: context, type: "시작"),
                            icon: const Icon(
                              Icons.calendar_today_outlined,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                          flex: 1,
                          child: InkWell(
                            onTap: () => controller.handleDatePikcer(
                                context: context, type: "종료"),
                            child: IgnorePointer(
                              child: TextFormField(
                                controller: controller.endedAtController.value,
                                focusNode: controller.endedAtFocusNode.value,
                                enabled: false,
                                keyboardType: TextInputType.datetime,
                                textInputAction: TextInputAction.go,
                                onChanged: (value) => controller
                                    .globalFormKey.currentState!
                                    .save(),
                                style: const TextStyle(
                                    color: kTextBodyColor, fontSize: 16),
                                decoration: const InputDecoration(
                                  labelText: "숙박 희망 종료 날짜",
                                  hintText: "종료날짜를 선택해주세요.",
                                  hintStyle: TextStyle(
                                    color: Colors.black12,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        SizedBox(
                          width: 30,
                          height: 30,
                          child: IconButton(
                            onPressed: () => controller.handleDatePikcer(
                                context: context, type: "종료"),
                            icon: const Icon(
                              Icons.calendar_today_outlined,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: Get.width,
                height: 50,
                child: ElevatedButton(
                  child: Text(
                    button,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: action,
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
          ),
        ),
      ),
    );

Future<dynamic> globalWillPopScopeDialogWidget() => Get.bottomSheet(
      Container(
        padding: const EdgeInsets.all(10),
        height: 160,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Wrap(
                children: const [
                  Text(
                    "변경사항이 저장되지 않고,\r\n처음부터 다시 시작해야 합니다.",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            // const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: SizedBox(
                    height: 50,
                    child: ElevatedButton(
                      child: const Text(
                        "뒤로가기",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onPressed: () {
                        Get.back();
                        Get.until((route) => Get.currentRoute == '/signin');
                      },
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  flex: 1,
                  child: SizedBox(
                    height: 50,
                    child: OutlinedButton(
                      child: const Text(
                        "계속진행",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onPressed: () => Get.back(),
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
        ),
      ),
      elevation: 20.0,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
    );

Future<dynamic> globalDeleteDialogWidget(
        {String content = "내용", String button = "버튼", dynamic action}) =>
    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.all(10),
        height: 175,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Wrap(
                children: [
                  Text(
                    content,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: Get.width,
              height: 50,
              child: ElevatedButton(
                child: Text(
                  button,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: action,
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
        ),
      ),
      elevation: 20.0,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
    );
