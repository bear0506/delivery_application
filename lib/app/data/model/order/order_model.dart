import 'package:intl/intl.dart';

// delivery
class CartBaseResponseModel {
  late String? status;
  late List<OrderDetailResponseModel> orderDetails = <OrderDetailResponseModel>[];

  CartBaseResponseModel.fromJson(Map<String, dynamic> data) {
    status = data["status"];
    orderDetails.add(OrderDetailResponseModel.fromJson(data["message"]["orderDetail"]));
  }
}

class OrderDetailResponseModel {
  late int idx;
  late int orderIdx;
  late int menuIdx;
  late String menuOptions;
  late int count;
  late int price;

  OrderDetailResponseModel({
    required this.idx,
    required this.orderIdx,
    required this.menuIdx,
    required this.menuOptions,
    required this.count,
    required this.price,
  });

  factory OrderDetailResponseModel.fromJson(Map<String, dynamic> data) {
    return OrderDetailResponseModel(
      idx: data['idx'],
      orderIdx: data['order_idx'],
      menuIdx: data['menu_idx'],
      menuOptions: data['menu_options'],
      count: data['count'],
      price: data['price'],
    );
  }
}