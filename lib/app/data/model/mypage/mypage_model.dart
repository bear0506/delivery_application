import 'package:intl/intl.dart';

/*
*title*: 마이페이지
*description*: 마이페이지 리퀘스트 및 리스폰스 모델 입니다.
*/

DateTime now = DateTime.now();

class MyPageBaseResponseModel {
  late String? status;
  late String? error;
  late Object user = UserResponseModel;
  late List<TradesResponseModel> trades = <TradesResponseModel>[];
  late List<WishlistsResponseModel> wishlists = <WishlistsResponseModel>[];
  late List<SearchRecentsResponseModel> searchRecents =
      <SearchRecentsResponseModel>[];

  MyPageBaseResponseModel.fromJson(Map<String, dynamic> data) {
    status = data["status"];
    error = data["error"];
    user = UserResponseModel.fromJson(data["message"]["user"]);
    data["message"]["trades"]
        .map((e) => trades.add(TradesResponseModel.fromJson(e)))
        .toList();
    data["message"]["wishlists"]
        .map((e) => wishlists.add(WishlistsResponseModel.fromJson(e)))
        .toList();
    data["message"]["search_recents"]
        .map((e) => searchRecents.add(SearchRecentsResponseModel.fromJson(e)))
        .toList();
  }
}

class UserResponseModel {
  late int idx;
  late String name;
  late String nickname;
  late String introduce;
  late int points;
  late String photo;
  late bool userCertified;
  late bool houseCertified;
  late bool vaccineCertified;
  late DateTime createdAt;

  UserResponseModel({
    required this.idx,
    required this.name,
    required this.nickname,
    required this.introduce,
    required this.points,
    required this.photo,
    required this.userCertified,
    required this.houseCertified,
    required this.vaccineCertified,
    required this.createdAt,
  });

  UserResponseModel.fromJson(Map<String, dynamic> data) {
    idx = data['idx'];
    name = data['name'];
    nickname = data['nickname'];
    introduce = data['introduce'];
    points = data['points'];
    photo = data['photo'];
    userCertified = data['user_certified'];
    houseCertified = data['house_certified'];
    vaccineCertified = data['vaccine_certified'];
    createdAt =
        (data['created_at'] != null ? DateTime.parse(data['created_at']) : now);
  }
}

class TradesResponseModel {
  late int idx;
  late int userIdx;
  late String title;
  late String content;
  late String address;
  late String start;
  late String end;
  late int point;
  late bool wishlistCheck;
  late int tradeIdx;
  late List<TradesTagsResponseModel> tags = <TradesTagsResponseModel>[];
  late List<TradesPhotosResponseModel> photos = <TradesPhotosResponseModel>[];
  late DateTime createdAt;

  TradesResponseModel({
    required this.idx,
    required this.userIdx,
    required this.title,
    required this.content,
    required this.address,
    required this.start,
    required this.end,
    required this.point,
    required this.wishlistCheck,
    required this.tradeIdx,
    required this.tags,
    required this.photos,
    required this.createdAt,
  });

  TradesResponseModel.fromJson(Map<String, dynamic> data) {
    idx = data['idx'];
    userIdx = data['user_idx'];
    title = data['title'] ?? "제목";
    content = data['content'] ?? "내용";
    address = data['address'] ?? "주소";
    start =
        DateFormat("MM월 dd일").format(DateTime.parse(data['started_at'] ?? now));
    end = DateFormat("MM월 dd일").format(DateTime.parse(data['ended_at'] ?? now));
    point = data['point'] ?? 0;
    wishlistCheck = data['wishlist_check'] ?? false;
    tradeIdx = data['trade_idx'] ?? 0;
    data["tags"]
        .map((e) => tags.add(TradesTagsResponseModel.fromJson(e)))
        .toList();
    data["photos"]
        .map((e) => photos.add(TradesPhotosResponseModel.fromJson(e)))
        .toList();
    createdAt =
        (data['created_at'] != null ? DateTime.parse(data['created_at']) : now);
  }
}

class TradesTagsResponseModel {
  late int idx;
  late int housesIdx;
  late String tag;
  late DateTime createdAt;

  TradesTagsResponseModel({
    required this.idx,
    required this.housesIdx,
    required this.tag,
    required this.createdAt,
  });

  TradesTagsResponseModel.fromJson(Map<String, dynamic> data) {
    idx = data['idx'];
    housesIdx = data['houses_idx'];
    tag = data['tag'];
    createdAt =
        (data['created_at'] != null ? DateTime.parse(data['created_at']) : now);
  }
}

class TradesPhotosResponseModel {
  late int idx;
  late int housesIdx;
  late String url;
  late DateTime createdAt;

  TradesPhotosResponseModel({
    required this.idx,
    required this.housesIdx,
    required this.url,
    required this.createdAt,
  });

  TradesPhotosResponseModel.fromJson(Map<String, dynamic> data) {
    idx = data['idx'];
    housesIdx = data['houses_idx'];
    url = data['url'];
    createdAt =
        (data['created_at'] != null ? DateTime.parse(data['created_at']) : now);
  }
}

class WishlistsResponseModel {
  late int idx;
  late int userIdx;
  late String title;
  late String content;
  late String address;
  late String start;
  late String end;
  late int point;
  late bool wishlistCheck;
  late List<WishlistsTagsResponseModel> tags = <WishlistsTagsResponseModel>[];
  late List<WishlistsPhotosResponseModel> photos =
      <WishlistsPhotosResponseModel>[];
  late DateTime createdAt;

  WishlistsResponseModel({
    required this.idx,
    required this.userIdx,
    required this.title,
    required this.content,
    required this.address,
    required this.start,
    required this.end,
    required this.point,
    required this.wishlistCheck,
    required this.tags,
    required this.photos,
    required this.createdAt,
  });

  WishlistsResponseModel.fromJson(Map<String, dynamic> data) {
    idx = data['idx'];
    userIdx = data['user_idx'];
    title = data['title'] ?? "제목";
    content = data['content'] ?? "내용";
    address = data['address'] ?? "주소";
    start =
        DateFormat("MM월 dd일").format(DateTime.parse(data['started_at'] ?? now));
    end = DateFormat("MM월 dd일").format(DateTime.parse(data['ended_at'] ?? now));
    point = data['point'] ?? 0;
    wishlistCheck = data['wishlist_check'] ?? false;
    data["tags"]
        .map((e) => tags.add(WishlistsTagsResponseModel.fromJson(e)))
        .toList();
    data["photos"]
        .map((e) => photos.add(WishlistsPhotosResponseModel.fromJson(e)))
        .toList();
    createdAt =
        (data['created_at'] != null ? DateTime.parse(data['created_at']) : now);
  }
}

class WishlistsTagsResponseModel {
  late int idx;
  late int housesIdx;
  late String tag;
  late DateTime createdAt;

  WishlistsTagsResponseModel({
    required this.idx,
    required this.housesIdx,
    required this.tag,
    required this.createdAt,
  });

  WishlistsTagsResponseModel.fromJson(Map<String, dynamic> data) {
    idx = data['idx'];
    housesIdx = data['houses_idx'];
    tag = data['tag'];
    createdAt =
        (data['created_at'] != null ? DateTime.parse(data['created_at']) : now);
  }
}

class WishlistsPhotosResponseModel {
  late int idx;
  late int housesIdx;
  late String url;
  late DateTime createdAt;

  WishlistsPhotosResponseModel({
    required this.idx,
    required this.housesIdx,
    required this.url,
    required this.createdAt,
  });

  WishlistsPhotosResponseModel.fromJson(Map<String, dynamic> data) {
    idx = data['idx'];
    housesIdx = data['houses_idx'];
    url = data['url'];
    createdAt =
        (data['created_at'] != null ? DateTime.parse(data['created_at']) : now);
  }
}

class SearchRecentsResponseModel {
  late int idx;
  late int userIdx;
  late String title;
  late String content;
  late String address;
  late String start;
  late String end;
  late int point;
  late bool wishlistCheck;
  late List<SearchRecentsTagsResponseModel> tags =
      <SearchRecentsTagsResponseModel>[];
  late List<SearchRecentsPhotosResponseModel> photos =
      <SearchRecentsPhotosResponseModel>[];
  late DateTime createdAt;

  SearchRecentsResponseModel({
    required this.idx,
    required this.userIdx,
    required this.title,
    required this.content,
    required this.address,
    required this.start,
    required this.end,
    required this.point,
    required this.wishlistCheck,
    required this.tags,
    required this.photos,
    required this.createdAt,
  });

  SearchRecentsResponseModel.fromJson(Map<String, dynamic> data) {
    idx = data['idx'];
    userIdx = data['user_idx'];
    title = data['title'] ?? "제목";
    content = data['content'] ?? "내용";
    address = data['address'] ?? "주소";
    start =
        DateFormat("MM월 dd일").format(DateTime.parse(data['started_at'] ?? now));
    end = DateFormat("MM월 dd일").format(DateTime.parse(data['ended_at'] ?? now));
    point = data['point'] ?? 0;
    wishlistCheck = data['wishlist_check'] ?? false;
    data["tags"]
        .map((e) => tags.add(SearchRecentsTagsResponseModel.fromJson(e)))
        .toList();
    data["photos"]
        .map((e) => photos.add(SearchRecentsPhotosResponseModel.fromJson(e)))
        .toList();
    createdAt =
        (data['created_at'] != null ? DateTime.parse(data['created_at']) : now);
  }
}

class SearchRecentsTagsResponseModel {
  late int idx;
  late int housesIdx;
  late String tag;
  late DateTime createdAt;

  SearchRecentsTagsResponseModel({
    required this.idx,
    required this.housesIdx,
    required this.tag,
    required this.createdAt,
  });

  SearchRecentsTagsResponseModel.fromJson(Map<String, dynamic> data) {
    idx = data['idx'];
    housesIdx = data['houses_idx'];
    tag = data['tag'];
    createdAt =
        (data['created_at'] != null ? DateTime.parse(data['created_at']) : now);
  }
}

class SearchRecentsPhotosResponseModel {
  late int idx;
  late int housesIdx;
  late String url;
  late DateTime createdAt;

  SearchRecentsPhotosResponseModel({
    required this.idx,
    required this.housesIdx,
    required this.url,
    required this.createdAt,
  });

  SearchRecentsPhotosResponseModel.fromJson(Map<String, dynamic> data) {
    idx = data['idx'];
    housesIdx = data['houses_idx'];
    url = data['url'];
    createdAt =
        (data['created_at'] != null ? DateTime.parse(data['created_at']) : now);
  }
}
