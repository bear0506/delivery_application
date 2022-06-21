import 'package:get/get.dart';
import 'dart:convert';
import 'package:delivery_service/app/data/provider/home/home_provider.dart';
import 'package:delivery_service/app/data/model/home/home_model.dart';
// import 'package:delivery_service/app/controller/mypage/mypage_controller.dart';
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

  late RxList<RoomResponseModel> rooms = <RoomResponseModel>[].obs;
  late RxList<StoreResponseModel> store = <StoreResponseModel>[].obs;

  RxBool modalVisibility = false.obs;

  // 조회
  Future<void> handleInitProvider() async {
    try {
      await HomeInitProvider().dio().then((value) {
        if (value.status == "success") {
          print("Success!");

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
          () => print("Delay~"));
    }
  }

  RxList roomInfos = [
    jsonDecode(
        '{"idx":1,"name":"연어롭다 연남점","img":"assets/icons/1.png","user":"SexyBBoy"}'),
    jsonDecode(
        '{"idx":2,"name":"Vips 명동점","img":"assets/icons/2.png","user":"asdfzxcv"}'),
    jsonDecode(
        '{"idx":3,"name":"샐러디 동국대점","img":"assets/icons/3.png","user":"왕뚱뚱보"}')
  ].obs;

  RxList roomVerticalInfos = [
    jsonDecode(
        '{"idx":1,"name":"연어롭다 연남점1","img":"assets/icons/c.png","user":"SexyBBoy","deliveryFee":"2,000원","time":"09:27","distance":"0.7km","capacity":"3"}'),
    jsonDecode(
        '{"idx":2,"name":"연어롭다 연남점2","img":"assets/icons/c.png","user":"SexyBBoy","deliveryFee":"2,000원","time":"09:27","distance":"0.7km","capacity":"3"}'),
    jsonDecode(
        '{"idx":3,"name":"연어롭다 연남점3","img":"assets/icons/c.png","user":"SexyBBoy","deliveryFee":"2,000원","time":"09:27","distance":"0.7km","capacity":"3"}'),
    jsonDecode(
        '{"idx":4,"name":"연어롭다 연남점4","img":"assets/icons/c.png","user":"SexyBBoy","deliveryFee":"2,000원","time":"09:27","distance":"0.7km","capacity":"3"}'),
    jsonDecode(
        '{"idx":5,"name":"연어롭다 연남점5","img":"assets/icons/c.png","user":"SexyBBoy","deliveryFee":"2,000원","time":"09:27","distance":"0.7km","capacity":"3"}'),
    jsonDecode(
        '{"idx":6,"name":"연어롭다 연남점6","img":"assets/icons/c.png","user":"SexyBBoy","deliveryFee":"2,000원","time":"09:27","distance":"0.7km","capacity":"3"}'),
    jsonDecode(
        '{"idx":7,"name":"연어롭다 연남점7","img":"assets/icons/c.png","user":"SexyBBoy","deliveryFee":"2,000원","time":"09:27","distance":"0.7km","capacity":"3"}'),
    jsonDecode(
        '{"idx":8,"name":"연어롭다 연남점8","img":"assets/icons/c.png","user":"SexyBBoy","deliveryFee":"2,000원","time":"09:27","distance":"0.7km","capacity":"3"}'),
    jsonDecode(
        '{"idx":9,"name":"연어롭다 연남점9","img":"assets/icons/c.png","user":"SexyBBoy","deliveryFee":"2,000원","time":"09:27","distance":"0.7km","capacity":"3"}'),
    jsonDecode(
        '{"idx":10,"name":"연어롭다 연남점10","img":"assets/icons/c.png","user":"SexyBBoy","deliveryFee":"2,000원","time":"09:27","distance":"0.7km","capacity":"3"}'),
  ].obs;

  void TurnOnMapModal(int index) {
    print(rooms[index].storeName);

    modalVisibility.value = true;
  }

  void TurnOffMapModal() {
    print("TurnOffMapModal");

    modalVisibility.value = false;
  }

  @override
  // ignore: unnecessary_overrides
  void onInit() async {
    await handleInitProvider();

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
