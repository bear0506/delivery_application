import 'package:get/get.dart';

import 'package:delivery_service/main.dart';
import 'package:delivery_service/app/data/provider/mypage/mypage_provider.dart';

import 'package:delivery_service/app/data/model/mypage/mypage_model.dart';
// import 'package:delivery_service/app/data/model/mypage/mypage_order_history_model.dart';
// import 'package:delivery_service/app/data/model/mypage/mypage_favorites_model.dart';
// import 'package:delivery_service/app/data/provider/mypage/mypage_favorites_provider.dart';

class MyPageController extends GetxController with GetTickerProviderStateMixin {
  RxList<dynamic> users = [
    {
      "img": "assets/icons/min.png",
      "nickname": "Mini_mee",
      "name": "김민니",
      "phoneNumber": "010-1**4-5678",
    },
  ].obs;

  RxBool temp = false.obs;

  // 로딩 인디케이터
  RxBool isLoaderVisible = false.obs;

  RxBool orderHistoryDetailLoader = false.obs;

  late RxList<OrderResponseModel> orders = <OrderResponseModel>[].obs;
  late RxList<FavoriteResponseModel> favorites = <FavoriteResponseModel>[].obs;

  late Rx<OrderResponseModel> order = OrderResponseModel(
    idx: 0,
    storeIdx: 0,
    storeName: "",
    price: 0,
    address: "",
    detail: "",
    status: "",
    orderCount: 0,
    orderAt: DateTime.now(),
    favorite: false,
  ).obs;

  late Rx<OrderHisotryResponseModel> orderHistory = OrderHisotryResponseModel(
    idx: 0,
    storeIdx: 0,
    storeName: "",
    memName: "",
    memPhoto: "",
    price: 0,
    address: "",
    detail: "",
    status: "",
    deliveryTime: "",
    deliveryFee: 0,
    orderCount: 0,
    orderAt: DateTime.now(),
    orderDetails: [],
  ).obs;

  // 마이페이지 정보 전체 조회
  Future<void> handleMyPageInfoInitProvider() async {
    try {
      await MyPageInfoInitProvider().dio().then((value) {
        if (value.status == "success") {
          orders.assignAll(value.orders);
          favorites.assignAll(value.favorites);

          orders.refresh();
          favorites.refresh();
        } else {
          logger.d(value.message);
        }
      });
    } catch (e) {
      logger.d(e);
    } finally {
      isLoaderVisible.value = true;
    }
  }

  Future<void> handleOrderHistoryProvider() async {
    try {
      await OrderHistoryInitProvider()
          .dio(orderIdx: int.parse(Get.parameters["orderIdx"]!))
          .then((value) {
        if (value.status == "success") {
          orderHistory.value = value.orderHistory;
          orderHistory.refresh();
        } else {
          logger.d(value.message);
        }
      });
    } catch (e) {
      logger.d(e);
    } finally {
      orderHistoryDetailLoader.value = true;
    }
  }

  void handleMyPageOrderInitProvider(int index) {
    for (var tempOrder in orders) {
      if (tempOrder.idx == index) {
        order.value = tempOrder;
        order.refresh();
      }
    }
  }

  @override
  // ignore: unnecessary_overrides
  void onReady() {
    handleMyPageInfoInitProvider();

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
