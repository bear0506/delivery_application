import 'dart:convert';

import 'package:intl/intl.dart';

/*
*title*: 마이페이지
*description*: 마이페이지 리퀘스트 및 리스폰스 모델 입니다.
*/

DateTime now = DateTime.now();

class MyPageBaseResponseModel {
  late String? status;
  late List<OrderResponseModel> orders = <OrderResponseModel>[];
  late List<FavoriteResponseModel> favorites = <FavoriteResponseModel>[];

  MyPageBaseResponseModel({
    required this.status,
    required this.orders,
    required this.favorites,
  });

  factory MyPageBaseResponseModel.fromJson(Map<String, dynamic> data) {
    late List<OrderResponseModel> orders = <OrderResponseModel>[];
    late List<FavoriteResponseModel> favorites = <FavoriteResponseModel>[];

    data['message']['orders'].map((e) {
      orders.add(OrderResponseModel.fromJson(e));
    }).toList();

    data['message']['favorites'].map((e) {
      favorites.add(FavoriteResponseModel.fromJson(e));
    }).toList();

    return MyPageBaseResponseModel(
      status: data["status"],
      orders: orders,
      favorites: favorites,
    );
  }
}

class OrderResponseModel {
  late int idx;
  late int storeIdx;
  late String storeName;
  late int price;
  late String address;
  late String detail;
  late String status;
  late int orderCount;
  late DateTime orderAt;
  late bool favorite;

  OrderResponseModel({
    required this.idx,
    required this.storeIdx,
    required this.storeName,
    required this.price,
    required this.address,
    required this.detail,
    required this.status,
    required this.orderCount,
    required this.orderAt,
    required this.favorite,
  });

  factory OrderResponseModel.fromJson(Map<String, dynamic> data) {
    return OrderResponseModel(
      idx: data['idx'],
      storeIdx: data['store_idx'],
      storeName: data['store_name'],
      price: data['price'],
      address: data['address'] != null ? data['address'] : "",
      detail: data['detail'] != null ? data['detail'] : "",
      status: data['status'],
      orderCount: data['order_count'],
      orderAt: DateTime.parse(data['ordered_at']),
      favorite: data['favorite'],
    );
  }
}

class FavoriteResponseModel {
  late int idx;
  late String name;
  late String deliveryTime;
  late bool favorite;
  late double score;
  late int reviewCount;

  FavoriteResponseModel({
    required this.idx,
    required this.name,
    required this.deliveryTime,
    required this.favorite,
    required this.score,
    required this.reviewCount,
  });

  factory FavoriteResponseModel.fromJson(Map<String, dynamic> data) {
    return FavoriteResponseModel(
      idx: data['idx'],
      name: data['name'],
      deliveryTime: data['delivery_time'],
      favorite: data.containsKey('favorite') ? data['favorite'] : false,
      score: data['review'].length > 0
          ? data['review'].map((e) => e['score']).reduce((a, b) => a + b) /
              data['review'].length
          : 0,
      reviewCount: data['review'].length,
    );
  }
}

class OrderHistoryBaseResponseModel {
  late String? status;
  late OrderHisotryResponseModel orderHistory;

  OrderHistoryBaseResponseModel({
    required this.status,
    required this.orderHistory,
  });

  factory OrderHistoryBaseResponseModel.fromJson(Map<String, dynamic> data) {
    return OrderHistoryBaseResponseModel(
        status: data["status"],
        orderHistory: OrderHisotryResponseModel.fromJson(
            data["message"]["orderHistory"]));
  }
}

class OrderHisotryResponseModel {
  late int idx;
  late int storeIdx;
  late String storeName;
  late String memName;
  late String memPhoto;
  late int price;
  late String address;
  late String detail;
  late String status;
  late String deliveryTime;
  late int deliveryFee;
  late int orderCount;
  late DateTime orderAt;
  late List<OrderDetailResponseModel> orderDetails =
      <OrderDetailResponseModel>[];

  OrderHisotryResponseModel({
    required this.idx,
    required this.storeIdx,
    required this.storeName,
    required this.memName,
    required this.memPhoto,
    required this.price,
    required this.address,
    required this.detail,
    required this.status,
    required this.deliveryTime,
    required this.deliveryFee,
    required this.orderCount,
    required this.orderAt,
    required this.orderDetails,
  });

  factory OrderHisotryResponseModel.fromJson(Map<String, dynamic> data) {
    late List<OrderDetailResponseModel> orderDetails =
        <OrderDetailResponseModel>[];

    data["orderDetail"]
        .map((e) => orderDetails.add(OrderDetailResponseModel.fromJson(e)))
        .toList();

    return OrderHisotryResponseModel(
      idx: data['idx'],
      storeIdx: data['store_idx'],
      storeName: data['store_name'],
      memName: data['mem_name'],
      memPhoto: data['mem_photo'],
      price: data['price'],
      address: data['address'] != null ? data['address'] : "",
      detail: data['detail'] != null ? data['detail'] : "",
      status: data['status'],
      deliveryTime: data['delivery_time'],
      deliveryFee: data['delivery_fee'],
      orderCount: data['order_count'],
      orderAt: DateTime.parse(data['ordered_at']),
      orderDetails: orderDetails,
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
