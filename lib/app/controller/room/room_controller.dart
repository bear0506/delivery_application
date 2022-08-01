import 'dart:convert';

import 'package:get/get.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:delivery_service/main.dart';

import 'package:delivery_service/app/data/provider/room/room_provider.dart';
import 'package:delivery_service/app/data/model/room/room_model.dart';

import 'package:delivery_service/app/controller/map/map_controller.dart';

enum Sort {
  popularity,
  newOrder,
  quickTimeOrder,
  delieveryCostMuch,
  delieveryCostLess,
  numberOfPeople,
}

class RoomController extends GetxController {
  late BuildContext context;

  Rx<Sort> sort = Sort.popularity.obs;

  late RxList<RoomResponseModel> rooms = <RoomResponseModel>[].obs;
  late RxList<RoomResponseModel> roomsInStore = <RoomResponseModel>[].obs;
  late Rx<RoomResponseModel> room = RoomResponseModel(
    idx: 0,
    memIdx: 0,
    memName: "",
    storeIdx: 0,
    storeName: "",
    address: "",
    lat: "",
    lng: "",
    timeLimit: "",
    currentNum: 0,
    maximumNum: 0,
    deliveryTime: "",
    deliveryFee: 0,
    active: false,
  ).obs;

  Rx<ScrollController> scrollController = ScrollController().obs;
  Rx<ScrollController> scrollController2 = ScrollController().obs;

  late Rx<dynamic> storeIdx;
  late Rx<dynamic> roomIdx;

  RxInt count = 0.obs;

  RxDouble currentExtent = 0.0.obs;
  RxDouble maxExtent = 9999.0.obs;

  RxDouble extentRatio = 0.0.obs;

  RxBool temptemp = true.obs;

  RxBool isLoaderVisible = false.obs;

  late FocusScopeNode currentFocus;
  late FocusNode timeCheckBoxFocusNode;
  late FocusNode privacyCheckBoxFocusNode;
  late FocusNode timeOutlinedButtonFocusNode;

  RxList<dynamic> isCheckbox = [
    {
      "id": 0,
      "time": "01:00".obs,
      "isChecked": false.obs,
    },
    {
      "id": 1,
      "time": "03:00".obs,
      "isChecked": false.obs,
    },
    {
      "id": 2,
      "time": "05:00".obs,
      "isChecked": false.obs,
    },
    {
      "id": 3,
      "time": "10:00".obs,
      "isChecked": false.obs,
    },
  ].obs;

  RxList roomInfos = [
    jsonDecode(
        '{"idx":1,"storeName":"교촌치킨 약수점","starRate":"4.5","reviewCount":"159","deliveryTime":"21분 ~ 30분","img":"assets/icons/orderer.png","user":"♡zi존성민1♡","address":"서울 중구 퇴계로36길 2","numberOfTransactions":"15","mannerScore":"100","deliveryFee":"3,000","time":"09:27","distance":"0.7","capacity":"4","totalDeliveryFee":"750"}'),
  ].obs;

  isSliverAppBarExpanded() {
    temptemp = (scrollController.value.hasClients &&
            scrollController.value.offset > (820.h - kToolbarHeight))
        .obs;
  }

  getCurrentExtent() {
    maxExtent.value = scrollController.value.position.maxScrollExtent;
    currentExtent.value = scrollController.value.offset;

    extentRatio.value = currentExtent.value / maxExtent.value;
  }

  // 전체 조회
  Future<void> handleRoomAllProvider() async {
    try {
      await RoomAllProvider().dio().then((value) {
        if (value.status == "success") {
          rooms.addAll(value.rooms);
          rooms.refresh();
        } else {
          print("else");
        }
      });
    } catch (e) {
      logger.d(e);
    } finally {
      Future.delayed(
          const Duration(milliseconds: 500),
          // ignore: avoid_print
          () {});
    }
  }

  // 특정 가게 방 조회
  Future<void> handleRoomsInStoreProvider() async {
    roomsInStore.clear();

    storeIdx = Get.parameters["storeIdx"].obs;

    try {
      await RoomsInStoreProvider()
          .dio(storeIdx: int.parse(storeIdx.value))
          .then((value) {
        if (value.status == "success") {
          print("방 조회 성공!");

          roomsInStore.addAll(value.rooms);
          roomsInStore.refresh();
        } else {
          print("else");
        }
      });
    } catch (e) {
      logger.d(e);
    } finally {
      Future.delayed(
          const Duration(milliseconds: 500),
          // ignore: avoid_print
          () {});
    }
  }

  // 특정 방 조회
  Future<void> handleRoomProvider() async {
    roomIdx = Get.parameters["roomIdx"].obs;

    try {
      await RoomInitProvider()
          .dio(roomIdx: int.parse(roomIdx.value))
          .then((value) {
        if (value.status == "success") {
          room.value = value.room;
          room.refresh();
        } else {
          print("fail");
        }
      });
    } catch (e) {
      logger.d(e);
    } finally {
      Future.delayed(
          const Duration(milliseconds: 500),
          // ignore: avoid_print
          () {});
    }
  }

  @override
  // ignore: unnecessary_overrides
  void onInit() async {
    await handleRoomAllProvider();

    scrollController.value.addListener(getCurrentExtent);
    scrollController.value.addListener(isSliverAppBarExpanded);

    timeCheckBoxFocusNode = FocusNode();
    privacyCheckBoxFocusNode = FocusNode();
    timeOutlinedButtonFocusNode = FocusNode();

    super.onInit();
  }

  @override
  // ignore: unnecessary_overrides
  void onReady() {
    super.onReady();
  }

  @override
  // ignore: unnecessary_overrides
  void onClose() {
    super.onClose();
  }

  @override
  // ignore: unnecessary_overrides
  void dispose() {
    timeCheckBoxFocusNode.dispose();
    privacyCheckBoxFocusNode.dispose();
    timeOutlinedButtonFocusNode.dispose();

    super.dispose();
  }

  @override
  // ignore: unnecessary_overrides
  InternalFinalCallback<void> get onStart => super.onStart;

  @override
  // ignore: unnecessary_overrides
  InternalFinalCallback<void> get onDelete => super.onDelete;
}
