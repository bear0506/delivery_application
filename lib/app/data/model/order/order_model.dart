import 'dart:convert';

import 'package:intl/intl.dart';

// delivery
class CartBaseResponseModel {
  late String? status;
  late List<OrderDetailResponseModel> orderDetails =
      <OrderDetailResponseModel>[];

  CartBaseResponseModel.fromJson(Map<String, dynamic> data) {
    status = data["status"];

    data["message"]["cart"]
        .map((e) => orderDetails.add(OrderDetailResponseModel.fromJson(e)))
        .toList();
  }
}

class MenuResponseModel {
  late int idx;
  late int storeIdx;
  late int memIdx;
  late int price;
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
