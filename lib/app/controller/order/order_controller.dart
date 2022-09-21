import 'dart:convert';

import 'package:delivery_service/app/controller/address/address_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:flutter/material.dart';

import 'package:delivery_service/main.dart';

import 'package:delivery_service/app/controller/store/store_controller.dart';
import 'package:delivery_service/app/data/provider/order/order_provider.dart';
import 'package:delivery_service/app/data/model/order/order_model.dart';

class OrderController extends GetxController with GetTickerProviderStateMixin {
  // late Rx<dynamic> storeIdx = Get.parameters["storeIdx"].obs;

  // Rx<dynamic> orderIdx = 0.obs;

  Rx<ScrollController> scrollController = ScrollController().obs;
  RxBool temp = true.obs;

  // 리퀘스트 모델(데이터 넘기기)
  Rx<CartCheckRequestModel> cartCheckRequestModel = CartCheckRequestModel(
    storeIdx: 0,
  ).obs;

  void handleCartCheckRequestModel({
    required int storeIdx,
  }) {
    cartCheckRequestModel.update((_) {
      _?.storeIdx = storeIdx;
    });
  }

  // 주문 실행
  Rx<OrderExecuteRequestModel> orderExecuteRequestModel =
      OrderExecuteRequestModel(
    address: "",
    detail: "",
    lat: "",
    lng: "",
  ).obs;

  void handleOrderExecuteRequestModel({
    required String address,
    required String detail,
    required String lat,
    required String lng,
  }) {
    orderExecuteRequestModel.update((_) {
      _?.address = address;
      _?.detail = detail;
      _?.lat = lat;
      _?.lng = lng;
    });
  }

  // 주문 추가
  Rx<OrderAddRequestModel> orderAddRequestModel = OrderAddRequestModel(
    storeIdx: 0,
    price: 0,
    deliveryFee: 0,
  ).obs;

  void handleOrderAddRequestModel({
    required int storeIdx,
    required int price,
    required int deliveryFee,
  }) {
    orderAddRequestModel.update((_) {
      _?.storeIdx = storeIdx;
      _?.price = price;
      _?.deliveryFee = deliveryFee;
    });
  }

  // 주문 상세 추가
  Rx<OrderDetailAddRequestModel> orderDetailAddRequestModel =
      OrderDetailAddRequestModel(
    orderIdx: 0,
    menuIdx: 0,
    menuOptions: "",
    count: 0,
    price: 0,
  ).obs;

  void handleOrderDetailAddRequestModel(
      {required int orderIdx,
      required int menuIdx,
      required String menuOptions,
      required int count,
      required int price}) {
    orderDetailAddRequestModel.update((_) {
      _?.orderIdx = orderIdx;
      _?.menuIdx = menuIdx;
      _?.menuOptions = menuOptions;
      _?.count = count;
      _?.price = price;
    });
  }

  RxInt cartItemCount = 0.obs;

  late Rx<OrderResponseModel> cartOrder = OrderResponseModel(
    idx: 0,
    storeIdx: 0,
    price: 0,
    deliveryFee: 0,
    address: "",
    detail: "",
    lat: "",
    lng: "",
    status: "IC",
  ).obs;

  late RxList<OrderDetailResponseModel> cartMenus =
      <OrderDetailResponseModel>[].obs;

  // 장바구니 조회
  Future<void> handleCartInitProvider() async {
    try {
      await CartInitProvider().dio().then((value) {
        if (value.status == "success") {
          print("장바구니 조회 성공");

          cartItemCount.value = 0;

          cartOrder.value = value.order;
          cartOrder.refresh();

          cartMenus.assignAll(value.orderDetails);
          cartMenus.refresh();

          for (var item in cartMenus) cartItemCount.value += item.count;
        } else {
          print("장바구니 조회 실패");
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

  //장바구니 상태 확인
  Future<void> handleCartCheckProvider() async {
    try {
      handleCartCheckRequestModel(
        storeIdx: int.parse(Get.parameters["storeIdx"].obs.string),
      );

      await CartCheckProvider()
          .dio(requestModel: cartCheckRequestModel)
          .then((value) {
        if (value.status == "success") {
          // print(value.message);

          if (value.message == "ADD") {
            print("아직 장바구니 없음");

            handleOrderAddProvider();
          } else if (value.message == "UPDATE") {
            print("같은 가게 메뉴 있음");

            handleOrderDetailAddProvider(value.orderIdx);
          } else if (value.message == "DELETE") {
            print("다른 가게 메뉴 있음");

            Get.dialog(
              AlertDialog(
                title: Text(
                  "장바구니에는 같은 가게의 메뉴만 담을 수 있습니다.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 60.sp,
                    fontFamily: 'Core_Gothic_D5',
                  ),
                ),
                titlePadding:
                    EdgeInsets.symmetric(horizontal: 80.w, vertical: 100.h),
                content: SizedBox(
                  width: 1000.w,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "선택하신 메뉴를 장바구니에 담을 경우 이전에 담은 메뉴가 삭제됩니다.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: const Color(0xFFB8B8B8),
                          fontSize: 50.sp,
                          fontFamily: 'Core_Gothic_D3',
                        ),
                      ),
                    ],
                  ),
                ),
                contentPadding:
                    EdgeInsets.only(left: 90.w, right: 90.w, bottom: 50.h),
                actions: [
                  TextButton(
                    child: Text(
                      "확인",
                      style: TextStyle(
                        color: const Color(0xFFFF8800),
                        fontSize: 60.sp,
                        fontFamily: 'Core_Gothic_D5',
                      ),
                    ),
                    onPressed: () {
                      handleOrderAddProvider();

                      handleOrderDeleteProvider(value.orderIdx);
                    },
                  ),
                  TextButton(
                    child: Text(
                      "취소",
                      style: TextStyle(
                        color: const Color(0xFFFF8800),
                        fontSize: 60.sp,
                        fontFamily: 'Core_Gothic_D5',
                      ),
                    ),
                    onPressed: () => Get.back(),
                  ),
                ],
                actionsAlignment: MainAxisAlignment.center,
                actionsPadding: EdgeInsets.zero,
              ),
            );
          }

          // print(currentMenu.value.menuOptionTab);
        } else {
          print(value.status);
          print(value.message);
          print("else");
        }
      });
    } catch (e) {
      logger.d(e);
    }
  }

  //주문 실행
  Future<void> handleOrderExecuteProvider() async {
    try {
      handleOrderExecuteRequestModel(
        address: Get.put(AddressController()).currentAddress.value.address,
        detail: Get.put(AddressController()).currentAddress.value.detail,
        lat: Get.put(AddressController()).currentAddress.value.lat,
        lng: Get.put(AddressController()).currentAddress.value.lng,
      );

      await OrderExecuteProvider()
          .dio(requestModel: orderExecuteRequestModel)
          .then((value) {
        if (value.status == "success") {
          print("주문 실행 성공");

          Get.toNamed('/order=${Get.parameters["orderIdx"]}/orderResult');
        } else {
          print("주문 실행 실패");
        }
      });
    } catch (e) {
      logger.d(e);
    }
  }

  //장바구니 추가
  Future<void> handleOrderAddProvider() async {
    try {
      handleOrderAddRequestModel(
        storeIdx: int.parse(Get.parameters["storeIdx"].obs.string),
        price: Get.put(StoreController()).menuPrice.value,
        deliveryFee: calculateDeliveryFee(
            Get.put(StoreController()).store.value.deliveryFee,
            Get.put(StoreController()).menuPrice.value),
      );

      await OrderAddProvider()
          .dio(requestModel: orderAddRequestModel)
          .then((value) {
        if (value.status == "success") {
          print("주문 추가 성공");

          handleOrderDetailAddProvider(value.orderIdx);
        } else {
          print("주문 추가 실패");
        }
      });
    } catch (e) {
      logger.d(e);
    }
  }

  //장바구니 메뉴 추가
  Future<void> handleOrderDetailAddProvider(int orderIdx) async {
    try {
      handleOrderDetailAddRequestModel(
        orderIdx: orderIdx,
        menuIdx: Get.put(StoreController()).currentMenu.value.idx,
        menuOptions: Get.put(StoreController()).menuOptions.join(","),
        count: Get.put(StoreController()).currentMenu.value.count.value,
        price: Get.put(StoreController()).menuPrice.value,
      );

      await OrderDetailAddProvider()
          .dio(requestModel: orderDetailAddRequestModel)
          .then((value) {
        if (value.status == "success") {
          print("Order Detail 추가 성공");

          handleCartUpdateProvider(orderIdx);
          Get.back();
        } else {
          print("Order Detail 추가 실패");
        }
      });
    } catch (e) {
      logger.d(e);
    }
  }

  //장바구니 삭제
  Future<void> handleOrderDeleteProvider(int orderIdx) async {
    try {
      await OrderDeleteProvider().dio(idx: orderIdx).then((value) {
        if (value.status == "success") {
          print("기존 장바구니 삭제 성공");

          Get.back();
        } else {
          print("기존 장바구니 삭제 실패");
        }
      });
    } catch (e) {
      logger.d(e);
    }
  }

  // 장바구니 메뉴 삭제
  Future<void> handleOrderDetailDeleteProvider(
      int orderIdx, int orderDetailIdx) async {
    try {
      await OrderDetailDeleteProvider().dio(idx: orderDetailIdx).then((value) {
        if (value.status == "success") {
          print("장바구니 메뉴 삭제 성공");

          handleCartUpdateProvider(orderIdx);
        } else {
          print("장바구니 메뉴 삭제 실패");
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

  // 장바구니 메뉴 수량 플러스
  Future<void> handleOrderDetailCountPlusProvider(
      int orderIdx, int orderDetailIdx) async {
    try {
      await OrderDetailCountPlusProvider()
          .dio(idx: orderDetailIdx)
          .then((value) {
        if (value.status == "success") {
          print("장바구니 메뉴 수량 +1 성공");

          handleCartUpdateProvider(orderIdx);
        } else {
          print("장바구니 메뉴 수량 +1 실패");
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

  // 장바구니 메뉴 수량 마이너스
  Future<void> handleOrderDetailCountMinusProvider(
      int orderIdx, int orderDetailIdx) async {
    try {
      await OrderDetailCountMinusProvider()
          .dio(idx: orderDetailIdx)
          .then((value) {
        if (value.status == "success") {
          print("장바구니 메뉴 수량 -1 성공");

          handleCartUpdateProvider(orderIdx);
        } else {
          print("장바구니 메뉴 수량 -1 실패");
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

  //장바구니 업데이트
  Future<void> handleCartUpdateProvider(int orderIdx) async {
    try {
      await CartUpdateProvider().dio(idx: orderIdx).then((value) {
        if (value.status == "success") {
          print("장바구니 업데이트 성공");

          handleCartInitProvider();
        } else {
          print("장바구니 업데이트 실패");
        }
      });
    } catch (e) {
      logger.d(e);
    }
  }

  int calculateDeliveryFee(String deliveryFee, int menuPrice) {
    dynamic keys = json
        .decode(Get.put(StoreController()).store.value.deliveryFee)
        .keys
        .toList();
    dynamic values = json
        .decode(Get.put(StoreController()).store.value.deliveryFee)
        .values
        .toList();

    for (int i = keys.length - 1; i >= 0; i--) {
      dynamic key = keys[i].split("~");

      if (i == 0) {
        return values[0];
      } else {
        if (int.parse(key[0]) <= menuPrice && int.parse(key[1]) > menuPrice)
          return values[i];
        else
          continue;
      }
    }

    return -1;
  }

  @override
  // ignore: unnecessary_overrides
  void onReady() {
    handleCartInitProvider();

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
    Get.delete<OrderController>();

    super.dispose();
  }

  @override
  // ignore: unnecessary_overrides
  InternalFinalCallback<void> get onStart => super.onStart;

  @override
  // ignore: unnecessary_overrides
  InternalFinalCallback<void> get onDelete => super.onDelete;
}
