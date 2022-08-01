import 'package:get/get.dart';

class MyPageFavoritesController extends GetxController
    with GetTickerProviderStateMixin {
  // 스켈레톤(쉬머)
  RxBool isLoaderVisible = true.obs;
  // 좋아요 버튼 중복 클릭 방지
  RxBool isLikedEnabled = false.obs;

  RxList<dynamic> favorites = [
    {
      "img": "assets/icons/realc.png",
      "storeName": "교촌치킨 약수점",
      "starPoint": "4.5",
      "reviewNumber": "159",
      "deliveryTime": "12분 ~ 20분",
      "deliveryFee": "3000원",
    },
    {
      "img": "assets/icons/salady.png",
      "storeName": "Salady 동국대점",
      "starPoint": "4.5",
      "reviewNumber": "159",
      "deliveryTime": "12분 ~ 20분",
      "deliveryFee": "3000원",
    },
    {
      "img": "assets/icons/coffee.png",
      "storeName": "매머드커피 남산점",
      "starPoint": "4.5",
      "reviewNumber": "159",
      "deliveryTime": "12분 ~ 20분",
      "deliveryFee": "3000원",
    },
    {
      "img": "assets/icons/realc.png",
      "storeName": "교촌치킨 약수점",
      "starPoint": "4.5",
      "reviewNumber": "159",
      "deliveryTime": "12분 ~ 20분",
      "deliveryFee": "3000원",
    },
    {
      "img": "assets/icons/salady.png",
      "storeName": "Salady 동국대점",
      "starPoint": "4.5",
      "reviewNumber": "159",
      "deliveryTime": "12분 ~ 20분",
      "deliveryFee": "3000원",
    },
    {
      "img": "assets/icons/coffee.png",
      "storeName": "매머드커피 남산점",
      "starPoint": "4.5",
      "reviewNumber": "159",
      "deliveryTime": "12분 ~ 20분",
      "deliveryFee": "3000원",
    },
  ].obs;

  RxBool temp = false.obs;

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
    Get.delete<MyPageFavoritesController>();

    super.dispose();
  }

  @override
  // ignore: unnecessary_overrides
  InternalFinalCallback<void> get onStart => super.onStart;

  @override
  // ignore: unnecessary_overrides
  InternalFinalCallback<void> get onDelete => super.onDelete;
}
