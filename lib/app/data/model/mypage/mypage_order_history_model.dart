import 'package:intl/intl.dart';

/*
*title*: 현재 교환 상태
*description*: 현재 교환 상태 리퀘스트 및 리스폰스 모델 입니다.
*/

DateTime now = DateTime.now();

class MyPageOrderBaseResponseModel {
  late String? status;
  late String? error;
  late dynamic message;

  MyPageOrderBaseResponseModel.fromJson(Map<String, dynamic> data) {
    status = data["status"];
    error = data["error"];
    message = data["message"];
  }
}

class MyPageOrderAllBaseResponseModel {
  late String? status;
  late String? error;
  late List<MyPageOrderAllResponseModel> trades =
      <MyPageOrderAllResponseModel>[];
  late List<MyPageSingleAllResponseModel> singles =
      <MyPageSingleAllResponseModel>[];

  MyPageOrderAllBaseResponseModel.fromJson(Map<String, dynamic> data) {
    status = data["status"];
    error = data["error"];
    data["message"]["trades"]
        .map((e) => trades.add(MyPageOrderAllResponseModel.fromJson(e)))
        .toList();
    data["message"]["single"]
        .map((e) => singles.add(MyPageSingleAllResponseModel.fromJson(e)))
        .toList();
  }
}

class MyPageOrderAllResponseModel {
  late int idx;
  late int userIdx;
  late int houseTradeIdx;
  late String title;
  late String content;
  late String address;
  late String startedAt;
  late String endedAt;
  late int point;
  late bool wishlistCheck;
  late dynamic tradeIdx;
  late String tradeIsReason;
  late List<MyPageOrderAllTagsResponseModel> tags =
      <MyPageOrderAllTagsResponseModel>[];
  late List<MyPageOrderAllPhotosResponseModel> photos =
      <MyPageOrderAllPhotosResponseModel>[];
  late DateTime createdAt;

  MyPageOrderAllResponseModel({
    required this.idx,
    required this.userIdx,
    required this.houseTradeIdx,
    required this.title,
    required this.content,
    required this.address,
    required this.startedAt,
    required this.endedAt,
    required this.point,
    required this.wishlistCheck,
    required this.tradeIdx,
    required this.tradeIsReason,
    required this.tags,
    required this.photos,
    required this.createdAt,
  });

  MyPageOrderAllResponseModel.fromJson(Map<String, dynamic> data) {
    idx = data['idx'];
    userIdx = data['user_idx'];
    houseTradeIdx = data['house_trade_idx'] ?? 0;
    title = data['title'] ?? "제목";
    content = data['content'] ?? "내용";
    address = data['address'] ?? "주소";
    startedAt =
        DateFormat("MM월 dd일").format(DateTime.parse(data['started_at'] ?? now));
    endedAt =
        DateFormat("MM월 dd일").format(DateTime.parse(data['ended_at'] ?? now));
    point = data['point'] ?? 0;
    wishlistCheck = data['wishlist_check'] ?? false;
    tradeIdx = data['trade_idx'] ?? false;
    tradeIsReason = data['trade_is_reason'];
    data["tags"]
        .map((e) => tags.add(MyPageOrderAllTagsResponseModel.fromJson(e)))
        .toList();
    data["photos"]
        .map((e) => photos.add(MyPageOrderAllPhotosResponseModel.fromJson(e)))
        .toList();
    createdAt =
        (data['created_at'] != null ? DateTime.parse(data['created_at']) : now);
  }
}

class MyPageSingleAllResponseModel {
  late int idx;
  late int userIdx;
  late int houseTradeIdx;
  late String title;
  late String content;
  late String address;
  late String startedAt;
  late String endedAt;
  late int point;
  late bool wishlistCheck;
  late dynamic tradeIdx;
  late String tradeIsReason;
  late List<MyPageOrderAllTagsResponseModel> tags =
      <MyPageOrderAllTagsResponseModel>[];
  late List<MyPageOrderAllPhotosResponseModel> photos =
      <MyPageOrderAllPhotosResponseModel>[];
  late DateTime createdAt;

  MyPageSingleAllResponseModel({
    required this.idx,
    required this.userIdx,
    required this.houseTradeIdx,
    required this.title,
    required this.content,
    required this.address,
    required this.startedAt,
    required this.endedAt,
    required this.point,
    required this.wishlistCheck,
    required this.tradeIdx,
    required this.tradeIsReason,
    required this.tags,
    required this.photos,
    required this.createdAt,
  });

  MyPageSingleAllResponseModel.fromJson(Map<String, dynamic> data) {
    idx = data['idx'];
    userIdx = data['user_idx'];
    houseTradeIdx = data['house_trade_idx'] ?? 0;
    title = data['title'] ?? "제목";
    content = data['content'] ?? "내용";
    address = data['address'] ?? "주소";
    startedAt =
        DateFormat("MM월 dd일").format(DateTime.parse(data['started_at'] ?? now));
    endedAt =
        DateFormat("MM월 dd일").format(DateTime.parse(data['ended_at'] ?? now));
    point = data['point'] ?? 0;
    wishlistCheck = data['wishlist_check'] ?? false;
    tradeIdx = data['trade_single_idx'] ?? false;
    tradeIsReason = data['trade_single_is_reason'];
    data["tags"]
        .map((e) => tags.add(MyPageOrderAllTagsResponseModel.fromJson(e)))
        .toList();
    data["photos"]
        .map((e) => photos.add(MyPageOrderAllPhotosResponseModel.fromJson(e)))
        .toList();
    createdAt =
        (data['created_at'] != null ? DateTime.parse(data['created_at']) : now);
  }
}

class MyPageOrderAllTagsResponseModel {
  late int idx;
  late int housesIdx;
  late String tag;
  late DateTime createdAt;

  MyPageOrderAllTagsResponseModel({
    required this.idx,
    required this.housesIdx,
    required this.tag,
    required this.createdAt,
  });

  MyPageOrderAllTagsResponseModel.fromJson(Map<String, dynamic> data) {
    idx = data['idx'];
    housesIdx = data['houses_idx'];
    tag = data['tag'];
    createdAt =
        (data['created_at'] != null ? DateTime.parse(data['created_at']) : now);
  }
}

class MyPageOrderAllPhotosResponseModel {
  late int idx;
  late int housesIdx;
  late String url;
  late DateTime createdAt;

  MyPageOrderAllPhotosResponseModel({
    required this.idx,
    required this.housesIdx,
    required this.url,
    required this.createdAt,
  });

  MyPageOrderAllPhotosResponseModel.fromJson(Map<String, dynamic> data) {
    idx = data['idx'];
    housesIdx = data['houses_idx'];
    url = data['url'];
    createdAt =
        (data['created_at'] != null ? DateTime.parse(data['created_at']) : now);
  }
}

class MyPageOrderRequestModel {
  dynamic type;
  int? tradeIdx;
  int? houseIdx;

  MyPageOrderRequestModel({
    type,
    tradeIdx,
    houseIdx,
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      "type": type,
      "trade_idx": tradeIdx,
      "house_idx": houseIdx,
    };
    return map;
  }
}
