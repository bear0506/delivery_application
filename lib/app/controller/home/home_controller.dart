import 'package:get/get.dart';
import 'dart:convert';
import 'package:delivery_service/app/data/provider/home/home_provider.dart';
import 'package:delivery_service/app/data/model/home/home_model.dart';

import 'package:delivery_service/app/controller/room/room_controller.dart';
import 'package:delivery_service/app/data/model/room/room_model.dart';

// import 'package:delivery_service/app/data/model/wishlist/wishlist_model.dart';
import 'package:delivery_service/main.dart';

enum FoodCategory {
  all,
  korean,
  snackbar,
  chicken,
  pizza,
  porkcutlets,
  porkfeet,
  steambath,
  grilled,
  chinese,
  japanese,
  sashimiSeafood,
  western,
  cafe,
  dessert,
  asian,
  sandwich,
  burger,
  mexican,
  bento,
}

enum Sort {
  popularity,
  newOrder,
  quickTimeOrder,
  delieveryCostMuch,
  delieveryCostLess,
  numberOfPeople,
}

class HomeController extends GetxController {
  Rx<FoodCategory> foodCategory = FoodCategory.all.obs;
  Rx<Sort> sort = Sort.popularity.obs;

  // late RxList<RoomResponseModel> rooms = <RoomResponseModel>[].obs;

  // late RxList<StoreResponseModel> store = <StoreResponseModel>[].obs;

  RxBool modalVisibility = false.obs;

  late Rx<RoomResponseModel> currentRoom = RoomResponseModel(
          idx: -1,
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
          active: false)
      .obs;

  // // 조회
  // Future<void> handleInitProvider() async {
  //   try {
  //     await HomeInitProvider().dio().then((value) {
  //       if (value.status == "success") {
  //         rooms.addAll(value.rooms);
  //         rooms.refresh();
  //       } else {
  //         print("else");
  //       }
  //     });
  //   } catch (e) {
  //     logger.d(e);
  //   } finally {
  //     Future.delayed(
  //         const Duration(milliseconds: 500),
  //         // ignore: avoid_print
  //         () {});
  //   }
  // }

  RxList roomInfos = [
    jsonDecode(
        '{"idx":1,"name":"연어롭다 연남점","img":"assets/icons/1.png","user":"SexyBBoy"}'),
    jsonDecode(
        '{"idx":2,"name":"Vips 명동점","img":"assets/icons/2.png","user":"asdfzxcv"}'),
    jsonDecode(
        '{"idx":3,"name":"샐러디 동국대점","img":"assets/icons/3.png","user":"왕뚱뚱보"}')
  ].obs;

  void TurnOnMapModal(int index) {
    RoomController roomController = Get.put(RoomController());

    // print(roomController.rooms[index]);

    currentRoom.value = roomController.rooms[index];

    modalVisibility.value = true;
  }

  void TurnOffMapModal() {
    print("TurnOffMapModal");

    modalVisibility.value = false;
  }

  @override
  // ignore: unnecessary_overrides
  void onInit() async {
    // await handleInitProvider();

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
  InternalFinalCallback<void> get onStart => super.onStart;

  @override
  // ignore: unnecessary_overrides
  InternalFinalCallback<void> get onDelete => super.onDelete;
}
