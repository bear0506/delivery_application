import 'package:get/get.dart';
import 'package:intl/intl.dart';

// delivery
class AddressStatusResponseModel {
  late String? status;

  AddressStatusResponseModel.fromJson(Map<String, dynamic> data) {
    status = data["status"];
  }
}

class AddressAllBaseResponseModel {
  late String? status;
  late List<AddressResponseModel> addresses = <AddressResponseModel>[];

  AddressAllBaseResponseModel.fromJson(Map<String, dynamic> data) {
    status = data["status"];
    data["message"]["address"]
        .map((e) => addresses.add(AddressResponseModel.fromJson(e)))
        .toList();
  }
}

class AddressBaseResponseModel {
  late String? status;
  late AddressResponseModel address;

  AddressBaseResponseModel.fromJson(Map<String, dynamic> data) {
    status = data["status"];
    address = AddressResponseModel.fromJson(data["message"]["address"]);
  }
}

class AddressResponseModel {
  late int idx;
  late int memIdx;
  late String name;
  late String address;
  late String detail;
  late String lat;
  late String lng;
  late bool active;

  AddressResponseModel({
    required this.idx,
    required this.memIdx,
    required this.name,
    required this.address,
    required this.detail,
    required this.lat,
    required this.lng,
    required this.active,
  });

  factory AddressResponseModel.fromJson(Map<String, dynamic> data) {
    return AddressResponseModel(
      idx: data['idx'],
      memIdx: data['mem_idx'],
      name: data['name'],
      address: data['address'],
      detail: data['detail'],
      lat: data['lat'],
      lng: data['lng'],
      active: data['active'],
    );
  }
}

class AddressAddRequestModel {
  late String name;
  late String address;
  late String detail;
  late String lat;
  late String lng;
  late bool active;

  AddressAddRequestModel({
    required this.name,
    required this.address,
    required this.detail,
    required this.lat,
    required this.lng,
    required this.active,
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      "name": name,
      "address": address,
      "detail": detail,
      "lat": lat,
      "lng": lng,
      "active": active,
    };

    return map;
  }
}
