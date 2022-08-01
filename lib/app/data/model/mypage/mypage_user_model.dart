/*
*title*: 프로필 관리
*description*: 프로필 관리 리퀘스트 및 리스폰스 모델 입니다.
*/

import 'package:delivery_service/app/data/model/main/main_model.dart';

DateTime now = DateTime.now();

// class MyPageMemberBaseResponseModel {
//   late String? status;
//   late String? error;
//   late dynamic message;

//   MyPageMemberBaseResponseModel.fromJson(Map<String, dynamic> data) {
//     status = data["status"];
//     error = data["error"];
//     message = data["message"];
//   }
// }

class MyPageMemberUpdateBaseResponseModel {
  late String? status;
  late String? error;
  late dynamic message;
  late MemberResponseModel member;

  MyPageMemberUpdateBaseResponseModel.fromJson(Map<String, dynamic> data) {
    status = data["status"];
    error = data["error"];
    message = data["message"];
    member = MemberResponseModel.fromJson(data["message"]["member"]);
  }
}

// class MyPageMemberResponseModel {
//   late int idx;
//   late String name;
//   late String nickname;
//   late String photo;
//   late DateTime createdAt;

//   MyPageMemberResponseModel({
//     required this.idx,
//     required this.name,
//     required this.nickname,
//     required this.photo,
//     required this.createdAt,
//   });

//   MyPageMemberResponseModel.fromJson(Map<String, dynamic> data) {
//     idx = data['idx'];
//     name = data['name'];
//     nickname = data['nickname'];
//     photo = data['photo'];
//     createdAt =
//         (data['created_at'] != null ? DateTime.parse(data['created_at']) : now);
//   }
// }

class UpdatedMemberResponseModel {
  late int idx;
  late String email;
  late String name;
  late String nickname;
  late String phone;
  late String photo;

  UpdatedMemberResponseModel({
    required this.idx,
    required this.email,
    required this.name,
    required this.nickname,
    required this.phone,
    required this.photo,
  });

  factory UpdatedMemberResponseModel.fromJson(Map<String, dynamic> data) {
    return UpdatedMemberResponseModel(
      idx: data['idx'],
      email: data['email'],
      name: data['name'],
      nickname: data['nickname'],
      phone: data['phone'],
      photo: data['photo'] != null ? data['photo'] : "",
    );
  }
}

class MyPageMemberUpdateRequestModel {
  dynamic images;
  String? nickname;

  MyPageMemberUpdateRequestModel({
    required dynamic images,
    required String nickname,
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      "images": images,
      "nickname": nickname,
    };

    return map;
  }
}
