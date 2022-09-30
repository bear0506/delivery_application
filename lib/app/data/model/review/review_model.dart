import 'dart:convert';

import 'package:intl/intl.dart';

// delivery
class ReviewBaseResponseModel {
  late String? status;
  late bool result;

  ReviewBaseResponseModel.fromJson(Map<String, dynamic> data) {
    status = data["status"];
    result = data["message"]["result"];
  }
}

class ReviewResponseModel {
  late int idx;
  late int memIdx;
  late int storeIdx;
  late double score;
  late List<String> photos = <String>[];
  late String comment;

  ReviewResponseModel({
    required this.idx,
    required this.memIdx,
    required this.storeIdx,
    required this.score,
    required this.photos,
    required this.comment,
  });

  factory ReviewResponseModel.fromJson(Map<String, dynamic> data) {
    return ReviewResponseModel(
      idx: data['idx'],
      memIdx: data['mem_idx'],
      storeIdx: data['store_idx'],
      score: data['score'],
      photos: data['photos'],
      comment: data['comment'],
    );
  }
}

class ReviewAddRequestModel {
  late int storeIdx;
  late double score;
  late dynamic photos;
  late String comment;

  ReviewAddRequestModel({
    required this.storeIdx,
    required this.score,
    required this.photos,
    required this.comment,
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      "store_idx": storeIdx,
      "score": score,
      "photos": photos,
      "comment": comment,
    };

    return map;
  }
}
