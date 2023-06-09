import 'package:intl/intl.dart';

// DateTime now = DateTime.now();

// class HomeBaseResponseModel {
//   String? status;
//   String? error;
//   List banners;
//   List houses;
//   List advertisedHouses;

//   HomeBaseResponseModel({
//     this.status,
//     this.error,
//     required this.banners,
//     required this.houses,
//     required this.advertisedHouses,
//   });

//   factory HomeBaseResponseModel.fromJson(Map<String, dynamic> data) {
//     return HomeBaseResponseModel(
//       status: data["status"],
//       error: data["error"],
//       banners: List<HomeBannersResponseModel>.from(data["message"]["banners"]
//           .map((e) => HomeBannersResponseModel.fromJson(e))),
//       houses: List<HomeHouseResponseModel>.from(data["message"]["houses"]
//           .map((e) => HomeHouseResponseModel.fromJson(e))),
//       advertisedHouses: List<HomeAdvertisedResponseModel>.from(data["message"]
//               ["advertised_houses"]
//           .map((e) => HomeAdvertisedResponseModel.fromJson(e))),
//     );
//   }
// }

// class HomeBannersResponseModel {
//   int idx;
//   String url;
//   DateTime createdAt;

//   HomeBannersResponseModel({
//     required this.idx,
//     required this.url,
//     required this.createdAt,
//   });

//   factory HomeBannersResponseModel.fromJson(Map<String, dynamic> data) {
//     return HomeBannersResponseModel(
//       idx: data['idx'],
//       url: data['url'],
//       createdAt: (data['created_at'] != null
//           ? DateTime.parse(data['created_at'])
//           : null)!,
//     );
//   }
// }

// class HomeHouseResponseModel {
//   int idx;
//   int userIdx;
//   String title;
//   String content;
//   String address;
//   String start;
//   String end;
//   int point;
//   bool wishlistCheck;
//   List photos;
//   DateTime createdAt;

//   HomeHouseResponseModel({
//     required this.idx,
//     required this.userIdx,
//     required this.title,
//     required this.content,
//     required this.address,
//     required this.start,
//     required this.end,
//     required this.point,
//     required this.photos,
//     required this.wishlistCheck,
//     required this.createdAt,
//   });

//   factory HomeHouseResponseModel.fromJson(Map<String, dynamic> data) {
//     return HomeHouseResponseModel(
//       idx: data['idx'],
//       userIdx: data['user_idx'],
//       title: data['title'] ?? "제목",
//       content: data['content'] ?? "내용",
//       address: data['address'] ?? "주소",
//       start: DateFormat("MM월 dd일")
//           .format(DateTime.parse(data['started_at'] ?? now)),
//       end:
//           DateFormat("MM월 dd일").format(DateTime.parse(data['ended_at'] ?? now)),
//       point: data['point'] ?? 0,
//       wishlistCheck: data['wishlist_check'] ?? false,
//       photos: List<PhotosResponseModel>.from(
//           data["photos"].map((e) => PhotosResponseModel.fromJson(e))),
//       createdAt: (data['created_at'] != null
//           ? DateTime.parse(data['created_at'])
//           : now),
//     );
//   }
// }

// class HomeAdvertisedResponseModel {
//   late int idx;
//   late int userIdx;
//   late String title;
//   late String content;
//   late String address;
//   late String start;
//   late String end;
//   late int point;
//   late bool wishlistCheck;
//   late List photos;
//   late DateTime createdAt;

//   HomeAdvertisedResponseModel({
//     required this.idx,
//     required this.userIdx,
//     required this.title,
//     required this.content,
//     required this.address,
//     required this.start,
//     required this.end,
//     required this.point,
//     required this.photos,
//     required this.wishlistCheck,
//     required this.createdAt,
//   });

//   factory HomeAdvertisedResponseModel.fromJson(Map<String, dynamic> data) {
//     return HomeAdvertisedResponseModel(
//       idx: data['idx'],
//       userIdx: data['user_idx'],
//       title: data['title'] ?? "제목",
//       content: data['content'] ?? "내용",
//       address: data['address'] ?? "주소",
//       start: DateFormat("MM월 dd일")
//           .format(DateTime.parse(data['started_at'] ?? now)),
//       end:
//           DateFormat("MM월 dd일").format(DateTime.parse(data['ended_at'] ?? now)),
//       point: data['point'] ?? 0,
//       wishlistCheck: data['wishlist_check'] ?? false,
//       photos: List<PhotosResponseModel>.from(
//           data["photos"].map((e) => PhotosResponseModel.fromJson(e))),
//       createdAt: (data['created_at'] != null
//           ? DateTime.parse(data['created_at'])
//           : now),
//     );
//   }
// }

// class PhotosResponseModel {
//   late int idx;
//   late int housesIdx;
//   late String url;
//   late DateTime createdAt;

//   PhotosResponseModel({
//     required this.idx,
//     required this.housesIdx,
//     required this.url,
//     required this.createdAt,
//   });

//   factory PhotosResponseModel.fromJson(Map<String, dynamic> data) {
//     return PhotosResponseModel(
//       idx: data['idx'],
//       housesIdx: data['houses_idx'],
//       url: data['url'],
//       createdAt: (data['created_at'] != null
//           ? DateTime.parse(data['created_at'])
//           : now),
//     );
//   }
// }

// delivery

