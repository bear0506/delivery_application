import 'package:get/get.dart';

class MyPageOrderHistoryController extends GetxController
    with GetTickerProviderStateMixin {
  // 스켈레톤(쉬머)
  RxBool isLoaderVisible = true.obs;
  // 좋아요 버튼 중복 클릭 방지
  RxBool isLikedEnabled = false.obs;

  late Rx<dynamic> storeIdx = Get.parameters["storeIdx"].obs;

  RxList<dynamic> orderHistory = [
    {
      "number": "1",
      "storeImg": "assets/icons/ch2.png",
      "img": "assets/icons/realc.png",
      "favorites": "true",
      "storeName": "교촌치킨 약수점",
      "starPoint": "4.5",
      "reviewNumber": "159",
      "price": "18,000원",
      "numberOfPeople": "4명",
      "date": "2022-07-01",
      "time": "17:54",
      "userImg": "assets/icons/orderer.png",
      "userID": "♡zi존성민1♡",
      "address": "서울 중구 퇴계로36길 2, 910",
      "orderNumber": "15",
      "mannerScore": "100",
    },
    {
      "number": "2",
      "storeImg": "assets/icons/ch2.png",
      "img": "assets/icons/2.png",
      "favorites": "true",
      "storeName": "Vips 명동점",
      "starPoint": "4.5",
      "reviewNumber": "159",
      "price": "23,500원",
      "numberOfPeople": "5명",
      "date": "2022-06-30",
      "time": "17:54",
      "userImg": "assets/icons/orderer.png",
      "userID": "♡zi존성민1♡",
      "address": "서울 중구 퇴계로36길 2, 910",
      "orderNumber": "15",
      "mannerScore": "100",
    },
    {
      "number": "3",
      "storeImg": "assets/icons/ch2.png",
      "img": "assets/icons/p.png",
      "favorites": "true",
      "storeName": "피자헛 동국대점",
      "starPoint": "4.5",
      "reviewNumber": "159",
      "price": "15,200원",
      "numberOfPeople": "4명",
      "date": "2022-06-25",
      "time": "17:54",
      "userImg": "assets/icons/orderer.png",
      "userID": "♡zi존성민1♡",
      "address": "서울 중구 퇴계로36길 2, 910",
      "orderNumber": "15",
      "mannerScore": "100",
    },
    {
      "number": "4",
      "storeImg": "assets/icons/ch2.png",
      "img": "assets/icons/daesung.png",
      "favorites": "true",
      "storeName": "대성꼬치",
      "starPoint": "4.5",
      "reviewNumber": "159",
      "price": "35,000원",
      "numberOfPeople": "1명",
      "date": "2022-06-12",
      "time": "17:54",
      "userImg": "assets/icons/orderer.png",
      "userID": "♡zi존성민1♡",
      "address": "서울 중구 퇴계로36길 2, 910",
      "orderNumber": "15",
      "mannerScore": "100",
    },
    {
      "number": "5",
      "storeImg": "assets/icons/ch2.png",
      "img": "assets/icons/bibi.png",
      "favorites": "true",
      "storeName": "비비살몬",
      "starPoint": "4.5",
      "reviewNumber": "159",
      "price": "21,000원",
      "numberOfPeople": "3명",
      "date": "2022-06-11",
      "time": "17:54",
      "userImg": "assets/icons/orderer.png",
      "userID": "♡zi존성민1♡",
      "address": "서울 중구 퇴계로36길 2, 910",
      "orderNumber": "15",
      "mannerScore": "100",
    },
  ].obs;

  RxList<dynamic> orderMenuHistory = [
    {
      "menuNumber": "1",
      "menuName": "발사믹치킨 + 웨지감자",
      "price": "22,000",
      "quantity": "1",
    },
    {
      "menuNumber": "2",
      "menuName": "시그니처순살세트 + 웨지감자",
      "price": "34,000",
      "quantity": "1",
    },
  ].obs;

  RxBool temp = false.obs;

  late Rx<dynamic> number = Get.parameters["number"].obs;

  void onChangeNumber() {
    number.value = Get.parameters["number"];
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
    Get.delete<MyPageOrderHistoryController>();

    super.dispose();
  }

  @override
  // ignore: unnecessary_overrides
  InternalFinalCallback<void> get onStart => super.onStart;

  @override
  // ignore: unnecessary_overrides
  InternalFinalCallback<void> get onDelete => super.onDelete;
}
