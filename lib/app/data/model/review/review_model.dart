import 'dart:convert';
import 'package:intl/intl.dart';

// delivery
class ReviewBaseResponseModel {
  late String? status;
  late List<ReviewResponseModel> reviews = <ReviewResponseModel>[];

  ReviewBaseResponseModel.fromJson(Map<String, dynamic> data) {
    status = data["status"];

    data["message"]["review"]
        .map((e) => reviews.add(ReviewResponseModel.fromJson(e)))
        .toList();
  }
}

class ReviewAddBaseResponseModel {
  late String? status;
  late bool result;

  ReviewAddBaseResponseModel.fromJson(Map<String, dynamic> data) {
    status = data["status"];
    result = data["message"]["result"];
  }
}

class ReviewResponseModel {
  late int idx;
  late int memIdx;
  late String memName;
  late int storeIdx;
  late int orderIdx;
  late double score;
  late List<String> photos = <String>[];
  late List<String> menus = <String>[];
  late String comment;
  late DateTime createdAt;

  ReviewResponseModel({
    required this.idx,
    required this.memIdx,
    required this.memName,
    required this.storeIdx,
    required this.orderIdx,
    required this.score,
    required this.photos,
    required this.menus,
    required this.comment,
    required this.createdAt,
  });

  factory ReviewResponseModel.fromJson(Map<String, dynamic> data) {
    late List<String> photos = <String>[];
    late List<String> menus = <String>[];

    if (data['photos'] != null) {
      for (String photo in data['photos'].split(',')) {
        photos.add(photo);
      }
    }

    data['menu'].map((e) => menus.add(e)).toList();

    return ReviewResponseModel(
      idx: data['idx'],
      memIdx: data['mem_idx'],
      memName: data['mem_name'],
      storeIdx: data['store_idx'],
      orderIdx: data['order_idx'],
      score: data['score'],
      photos: photos,
      menus: menus,
      comment: data['comment'],
      createdAt: DateTime.parse(data['created_at']),
    );
  }
}

class ReviewAddRequestModel {
  late int storeIdx;
  late int orderIdx;
  late double score;
  late dynamic photos;
  late String comment;

  ReviewAddRequestModel({
    required this.storeIdx,
    required this.orderIdx,
    required this.score,
    required this.photos,
    required this.comment,
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      "store_idx": storeIdx,
      "order_idx": orderIdx,
      "score": score,
      "photos": photos,
      "comment": comment,
    };

    return map;
  }
}
