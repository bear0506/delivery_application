import 'dart:convert';

import 'package:intl/intl.dart';

// delivery
class RoomsBaseResponseModel {
  late String? status;
  late List<RoomResponseModel> rooms = <RoomResponseModel>[];
  late List<Map<String, dynamic>> roomsMap = <Map<String, dynamic>>[];

  RoomsBaseResponseModel.fromJson(Map<String, dynamic> data) {
    status = data["status"];
    data["message"]["room"]
        .map((e) => rooms.add(RoomResponseModel.fromJson(e)))
        .toList();

    data["message"]["room"].map((e) => roomsMap.add(e)).toList();
  }
}

class RoomBaseResponseModel {
  late String? status;
  late RoomResponseModel room;

  RoomBaseResponseModel.fromJson(Map<String, dynamic> data) {
    status = data["status"];
    room = RoomResponseModel.fromJson(data["message"]["room"]);
  }
}

class RoomStatusBaseResponseModel {
  late String? status;
  late RoomResponseModel room;
  late OrderResponseModel order;

  RoomStatusBaseResponseModel.fromJson(Map<String, dynamic> data) {
    status = data["status"];
    room = RoomResponseModel.fromJson(data["message"]["roomStatus"]["room"]);
    order = OrderResponseModel.fromJson(data["message"]["roomStatus"]["order"]);
  }
}

class RoomResponseModel {
  late int idx;
  late int memIdx;
  late String memName;
  late int storeIdx;
  late String storeName;
  late String categoryIdx;
  late String address;
  late String detail;
  late String lat;
  late String lng;
  late String timeLimit;
  late int currentNum;
  late int maximumNum;
  late String deliveryTime;
  late int deliveryFee;
  late bool active;

  RoomResponseModel({
    required this.idx,
    required this.memIdx,
    required this.memName,
    required this.storeIdx,
    required this.storeName,
    required this.categoryIdx,
    required this.address,
    required this.detail,
    required this.lat,
    required this.lng,
    required this.timeLimit,
    required this.currentNum,
    required this.maximumNum,
    required this.deliveryTime,
    required this.deliveryFee,
    required this.active,
  });

  factory RoomResponseModel.fromJson(Map<String, dynamic> data) {
    return RoomResponseModel(
      idx: data['idx'],
      memIdx: data.containsKey('mem_idx') ? data['mem_idx'] : 0,
      memName: data.containsKey('mem_name') ? data['mem_name'] : "",
      storeIdx: data['store_idx'],
      storeName: data.containsKey('store_name') ? data['store_name'] : "",
      categoryIdx: data['category_idx'],
      address: data['address'],
      detail: data['detail'] != null ? data['detail'] : "",
      lat: data['lat'],
      lng: data['lng'],
      timeLimit: data['time_limit'] != null ? data['time_limit'] : "",
      currentNum: data['current_num'],
      maximumNum: data['maximum_num'],
      deliveryTime:
          data.containsKey('delivery_time') ? data['delivery_time'] : "",
      deliveryFee: data['delivery_fee'],
      active: data['active'],
    );
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
  late List<OrderDetailResponseModel> orderDetails =
      <OrderDetailResponseModel>[];

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
    required this.orderDetails,
  });

  factory OrderResponseModel.fromJson(Map<String, dynamic> data) {
    late List<OrderDetailResponseModel> orderDetails =
        <OrderDetailResponseModel>[];

    data["orderDetail"]
        .map((e) => orderDetails.add(OrderDetailResponseModel.fromJson(e)))
        .toList();

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

class RoomAddRequestModel {
  late int orderIdx;
  late int storeIdx;
  late String address;
  late String detail;
  late String lat;
  late String lng;
  late int currentNum;
  late int maximumNum;
  late int deliveryFee;
  late String timeLimit;
  late bool active;

  RoomAddRequestModel({
    required this.orderIdx,
    required this.storeIdx,
    required this.address,
    required this.detail,
    required this.lat,
    required this.lng,
    required this.currentNum,
    required this.maximumNum,
    required this.deliveryFee,
    required this.timeLimit,
    required this.active,
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      "order_idx": orderIdx,
      "store_idx": storeIdx,
      "address": address,
      "detail": detail,
      "lat": lat,
      "lng": lng,
      "current_num": currentNum,
      "maximum_num": maximumNum,
      "delivery_fee": deliveryFee,
      "time_limit": timeLimit,
      "active": active,
    };

    return map;
  }
}
