import 'package:get/get.dart';

import 'package:delivery_service/main.dart';
import 'package:delivery_service/app/data/provider/mypage/mypage_provider.dart';

import 'package:delivery_service/app/data/model/mypage/mypage_model.dart';
import 'package:delivery_service/app/data/model/mypage/mypage_order_history_model.dart';
import 'package:delivery_service/app/data/model/mypage/mypage_favorites_model.dart';
import 'package:delivery_service/app/data/provider/mypage/mypage_favorites_provider.dart';

class MyPageController extends GetxController with GetTickerProviderStateMixin {
  RxList<dynamic> users = [
    {
      "img": "assets/icons/min.png",
      "nickname": "Mini_mee",
      "name": "김민니",
      "phoneNumber": "010-1**4-5678",
    },
  ].obs;

  RxList<dynamic> orderHistory = [
    {
      "img": "assets/icons/realc.png",
      "favorites": "true",
      "storeName": "교촌치킨 약수점",
      "price": "18,000원",
      "numberOfPeople": "4명",
      "date": "2022-07-01",
    },
    {
      "img": "assets/icons/2.png",
      "favorites": "true",
      "storeName": "Vips 명동점",
      "price": "23,500원",
      "numberOfPeople": "5명",
      "date": "2022-06-30",
    },
    {
      "img": "assets/icons/p.png",
      "favorites": "true",
      "storeName": "피자헛 동국대점",
      "price": "15,200원",
      "numberOfPeople": "4명",
      "date": "2022-06-25",
    },
    {
      "img": "assets/icons/daesung.png",
      "favorites": "true",
      "storeName": "대성꼬치",
      "price": "35,000원",
      "numberOfPeople": "1명",
      "date": "2022-06-12",
    },
    {
      "img": "assets/icons/bibi.png",
      "favorites": "true",
      "storeName": "비비살몬",
      "price": "21,000원",
      "numberOfPeople": "3명",
      "date": "2022-06-11",
    },
  ].obs;

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

  // 로딩 인디케이터
  RxBool isLoaderVisible = true.obs;

  // 조회
  Future<void> handleInitProvider() async {
    try {
      await MyPageProvider().dio().then((value) {
        if (value.status == "success") {
          // users.assign(value.user);
          // trades.assignAll(value.trades);
          // wishlists.assignAll(value.wishlists);
          // searchRecents.assignAll(value.searchRecents);

          // user.refresh();
          // trades.refresh();
          // wishlists.refresh();
          // searchRecents.refresh();
        } else {
          logger.d(value.message);
        }
      });
    } catch (e) {
      logger.d(e);
    } finally {
      isLoaderVisible.value = false;
    }
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
    Get.delete<MyPageController>();

    super.dispose();
  }

  @override
  // ignore: unnecessary_overrides
  InternalFinalCallback<void> get onStart => super.onStart;

  @override
  // ignore: unnecessary_overrides
  InternalFinalCallback<void> get onDelete => super.onDelete;
}
