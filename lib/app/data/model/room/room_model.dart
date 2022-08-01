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
    // data["message"]["room"]
    //     .map((e) => rooms.add(RoomResponseModel.fromJson(e)))
    //     .toList();

    // data["message"]["room"].map((e) => roomsMap.add(e)).toList();
  }
}

class RoomResponseModel {
  late int idx;
  late int memIdx;
  late String memName;
  late int storeIdx;
  late String storeName;
  late String address;
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
    required this.address,
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
      memIdx: data['mem_idx'],
      memName: data['mem_name'],
      storeIdx: data['store_idx'],
      storeName: data['store_name'],
      address: data['address'],
      lat: data['lat'],
      lng: data['lng'],
      timeLimit: data['time_limit'],
      currentNum: data['current_num'],
      maximumNum: data['maximum_num'],
      deliveryTime:
          data.containsKey('delivery_time') ? data['delivery_time'] : "",
      deliveryFee: data['delivery_fee'],
      active: data['active'],
    );
  }
}