import 'package:intl/intl.dart';

// delivery
class MemberBaseResponseModel {
  late String? status;
  late MemberResponseModel member;

  MemberBaseResponseModel.fromJson(Map<String, dynamic> data) {
    status = data["status"];
    member = MemberResponseModel.fromJson(data["message"]["member"]);
  }
}

class MemberResponseModel {
  late int idx;
  late String email;
  late String name;
  late String nickname;
  late String phone;
  late String photo;

  MemberResponseModel({
    required this.idx,
    required this.email,
    required this.name,
    required this.nickname,
    required this.phone,
    required this.photo,
  });

  factory MemberResponseModel.fromJson(Map<String, dynamic> data) {
    return MemberResponseModel(
      idx: data['idx'],
      email: data['email'],
      name: data['name'],
      nickname: data['nickname'],
      phone: data['phone'],
      photo: data['photo'] != null ? data['photo'] : "",
    );
  }
}
