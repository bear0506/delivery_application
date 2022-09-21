import 'dart:convert';

import 'package:intl/intl.dart';

// delivery
class OrderBaseResponseModel {
  late String? status;

  OrderBaseResponseModel.fromJson(Map<String, dynamic> data) {
    status = data["status"];
  }
}

class CartBaseResponseModel {
  late String? status;
  late OrderResponseModel order;
  late List<OrderDetailResponseModel> orderDetails =
      <OrderDetailResponseModel>[];

  CartBaseResponseModel.fromJson(Map<String, dynamic> data) {
    status = data["status"];
    order = data["message"]["order"] != null
        ? OrderResponseModel.fromJson(data["message"]["order"])
        : OrderResponseModel(
            idx: 0,
            storeIdx: 0,
            price: 0,
            deliveryFee: 0,
            address: "",
            detail: "",
            lat: "",
            lng: "",
            status: "IC",
          );
    data["message"]["cart"]
        .map((e) => orderDetails.add(OrderDetailResponseModel.fromJson(e)))
        .toList();
  }
}

class CartCheckResponseModel {
  final String? status;
  final String? error;
  final dynamic message;
  final dynamic orderIdx;

  CartCheckResponseModel({
    this.status,
    this.error,
    this.message,
    this.orderIdx,
  });

  factory CartCheckResponseModel.formJson(Map<String, dynamic> json) =>
      CartCheckResponseModel(
        status: json["status"] ?? "",
        error: json["error"] ?? "",
        message: json["message"] ?? "",
        orderIdx: json["orderIdx"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "error": error,
        "message": message,
        "orderIdx": orderIdx,
      };
}

class CartCheckRequestModel {
  late int storeIdx;

  CartCheckRequestModel({
    required this.storeIdx,
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      "store_idx": storeIdx,
    };

    return map;
  }
}

class OrderExecuteRequestModel {
  late String address;
  late String detail;
  late String lat;
  late String lng;

  OrderExecuteRequestModel({
    required this.address,
    required this.detail,
    required this.lat,
    required this.lng,
  });

  // Map<String, dynamic> toJson() {
  //   Map<String, dynamic> map = {
  //     "store_idx": storeIdx,
  //     "price": price,
  //     "delivery_fee": deliveryFee,
  //   };

  //   return map;
  // }
}

class OrderAddRequestModel {
  late int storeIdx;
  late int price;
  late int deliveryFee;

  OrderAddRequestModel({
    required this.storeIdx,
    required this.price,
    required this.deliveryFee,
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      "store_idx": storeIdx,
      "price": price,
      "delivery_fee": deliveryFee,
    };

    return map;
  }
}

class OrderDetailAddRequestModel {
  late int orderIdx;
  late int menuIdx;
  late String menuOptions;
  late int count;
  late int price;

  OrderDetailAddRequestModel(
      {required this.orderIdx,
      required this.menuIdx,
      required this.menuOptions,
      required this.count,
      required this.price});

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      "order_idx": orderIdx,
      "menu_idx": menuIdx,
      "menu_options": menuOptions,
      "count": count,
      "price": price,
    };

    return map;
  }
}

class OrderResponseModel {
  late int idx;
  late int storeIdx;
  late int price;
  late int deliveryFee;
  late String address;
  late String detail;
  late String lat;
  late String lng;
  late String status;

  OrderResponseModel({
    required this.idx,
    required this.storeIdx,
    required this.price,
    required this.deliveryFee,
    required this.address,
    required this.detail,
    required this.lat,
    required this.lng,
    required this.status,
  });

  factory OrderResponseModel.fromJson(Map<String, dynamic> data) {
    return OrderResponseModel(
      idx: data['idx'],
      storeIdx: data['store_idx'],
      price: data['price'],
      deliveryFee: data['delivery_fee'],
      address: data['address'] != null ? data['address'] : "",
      detail: data['detail'] != null ? data['detail'] : "",
      lat: data['lat'] != null ? data['lat'] : "",
      lng: data['lng'] != null ? data['lng'] : "",
      status: data['status'],
    );
  }
}

class OrderDetailResponseModel {
  late int idx;
  late int orderIdx;
  late int menuIdx;
  late String menuOptions;
  late int count;
  late int price;
  late String menu;

  OrderDetailResponseModel({
    required this.idx,
    required this.orderIdx,
    required this.menuIdx,
    required this.menuOptions,
    required this.count,
    required this.price,
    required this.menu,
  });

  factory OrderDetailResponseModel.fromJson(Map<String, dynamic> data) {
    return OrderDetailResponseModel(
      idx: data['idx'],
      orderIdx: data['order_idx'],
      menuIdx: data['menu_idx'],
      menuOptions: data['menu_options'],
      count: data['count'],
      price: data['price'],
      menu: json.encode(data['menu']),
    );
  }
}
