import 'package:get/get.dart';
import 'package:intl/intl.dart';

// delivery
class StoreBaseResponseModel {
  late String? status;
  late List<StoreResponseModel> stores = <StoreResponseModel>[];

  StoreBaseResponseModel.fromJson(Map<String, dynamic> data) {
    status = data["status"];
    // data["message"]["store"]
    //     .map((e) => stores.add(StoreResponseModel.fromJson(e)))
    //     .toList();
    stores.add(StoreResponseModel.fromJson(data["message"]["store"]));
  }
}

class StoreFavoriteResponseModel {
  late String? status;
  late bool result;

  StoreFavoriteResponseModel.fromJson(Map<String, dynamic> data) {
    status = data["status"];
    result = data["message"]["result"];
  }
}

class CategoryBaseResponseModel {
  late String? status;
  late List<CategoryResponseModel> categories = <CategoryResponseModel>[];

  CategoryBaseResponseModel.fromJson(Map<String, dynamic> data) {
    status = data["status"];

    data["message"]["category"]
        .map((e) => categories.add(CategoryResponseModel.fromJson(e)))
        .toList();
  }
}

class MenuBaseResponseModel {
  late String? status;
  late StoreMenuResponseModel menu;

  MenuBaseResponseModel.fromJson(Map<String, dynamic> data) {
    status = data["status"];

    menu = StoreMenuResponseModel.fromJson(data["message"]["menu"]);
  }
}

class CategoryResponseModel {
  late int idx;
  late String name;
  late List<StoreResponseModel> stores = <StoreResponseModel>[];

  CategoryResponseModel({
    required this.idx,
    required this.name,
    required this.stores,
  });

  factory CategoryResponseModel.fromJson(Map<String, dynamic> data) {
    late List<StoreResponseModel> stores = <StoreResponseModel>[];

    data['stores'].map((e) {
      stores.add(StoreResponseModel.fromJson(e));
    }).toList();

    return CategoryResponseModel(
      idx: data["idx"],
      name: data["name"],
      stores: stores,
    );
  }
}

class StoreResponseModel {
  late int idx;
  late String categoryIdx;
  late String name;
  late String address;
  late String deliveryFee;
  late String deliveryTime;
  late String minimumOrder;
  late String information;
  late List<StoreTabResponseModel> tab = <StoreTabResponseModel>[];
  late bool active;
  late bool favorite;
  late double score;
  late int reviewCount;

  StoreResponseModel({
    required this.idx,
    required this.categoryIdx,
    required this.name,
    required this.address,
    required this.deliveryFee,
    required this.deliveryTime,
    required this.minimumOrder,
    required this.information,
    required this.tab,
    required this.active,
    required this.favorite,
    required this.score,
    required this.reviewCount,
  });

  factory StoreResponseModel.fromJson(Map<String, dynamic> data) {
    late List<StoreTabResponseModel> tabs = <StoreTabResponseModel>[];

    if (data.containsKey('tab')) {
      data['tab']
          .map((e) => tabs.add(StoreTabResponseModel.fromJson(e)))
          .toList();
    }

    return StoreResponseModel(
      idx: data['idx'],
      categoryIdx: data['category_idx'],
      name: data['name'],
      address: data['address'],
      deliveryFee: data['delivery_fee'],
      deliveryTime: data['delivery_time'],
      minimumOrder: data['minimum_order'],
      information: data['information'] == null ? "" : data['information'],
      tab: tabs,
      active: data['active'],
      favorite: data.containsKey('favorite') ? data['favorite'] : false,
      score: data.containsKey('review')
          ? (data['review'].length > 0
              ? data['review'].map((e) => e['score']).reduce((a, b) => a + b) /
                  data['review'].length
              : 0.0)
          : 0.0,
      reviewCount: data.containsKey('review') ? data['review'].length : 0,
    );
  }
}

class StoreTabResponseModel {
  late int idx;
  late int storeIdx;
  late String name;
  late List<StoreMenuResponseModel> menu;

  StoreTabResponseModel({
    required this.idx,
    required this.storeIdx,
    required this.name,
    required this.menu,
  });

  factory StoreTabResponseModel.fromJson(Map<String, dynamic> data) {
    late List<StoreMenuResponseModel> menus = <StoreMenuResponseModel>[];

    data['menu']
        .map((e) => menus.add(StoreMenuResponseModel.fromJson(e)))
        .toList();

    return StoreTabResponseModel(
      idx: data['idx'],
      storeIdx: data['store_idx'],
      name: data['name'],
      menu: menus,
    );
  }
}

class StoreMenuResponseModel {
  late int idx;
  late int storeIdx;
  late String tabIdx;
  late String name;
  late int price;
  late RxInt count;
  late String info;
  late bool active;
  late List<StoreMenuOptionTabResponseModel> menuOptionTab =
      <StoreMenuOptionTabResponseModel>[];

  StoreMenuResponseModel({
    required this.idx,
    required this.storeIdx,
    required this.tabIdx,
    required this.name,
    required this.price,
    required this.count,
    required this.info,
    required this.active,
    required this.menuOptionTab,
  });

  factory StoreMenuResponseModel.fromJson(Map<String, dynamic> data) {
    late List<StoreMenuOptionTabResponseModel> menuOptionTabs =
        <StoreMenuOptionTabResponseModel>[];

    if (data.containsKey('menuOptionTabs')) {
      data['menuOptionTabs']
          .map((e) =>
              menuOptionTabs.add(StoreMenuOptionTabResponseModel.fromJson(e)))
          .toList();
    }

    return StoreMenuResponseModel(
      idx: data['idx'],
      storeIdx: data['store_idx'],
      tabIdx: data['tab_idx'],
      name: data['name'],
      price: data['price'],
      count: 1.obs,
      info: data['info'] == null ? "" : data['info'],
      active: data['active'],
      menuOptionTab: menuOptionTabs,
    );
  }
}

class StoreMenuOptionTabResponseModel {
  late int idx;
  late int storeIdx;
  late String menuIdx;
  late String name;
  late bool active;
  late List<StoreMenuOptionResponseModel> menuOption =
      <StoreMenuOptionResponseModel>[];

  StoreMenuOptionTabResponseModel({
    required this.idx,
    required this.storeIdx,
    required this.menuIdx,
    required this.name,
    required this.active,
    required this.menuOption,
  });

  factory StoreMenuOptionTabResponseModel.fromJson(Map<String, dynamic> data) {
    late List<StoreMenuOptionResponseModel> menuOptions =
        <StoreMenuOptionResponseModel>[];

    data['menuOptions']
        .map((e) => menuOptions.add(StoreMenuOptionResponseModel.fromJson(e)))
        .toList();

    return StoreMenuOptionTabResponseModel(
      idx: data['idx'],
      storeIdx: data['store_idx'],
      menuIdx: data['menu_idx'],
      name: data['name'],
      active: data['active'],
      menuOption: menuOptions,
    );
  }
}

class StoreMenuOptionResponseModel {
  late int idx;
  late int storeIdx;
  late int tabIdx;
  late String name;
  late int price;
  late RxBool check;
  late bool active;

  StoreMenuOptionResponseModel({
    required this.idx,
    required this.storeIdx,
    required this.tabIdx,
    required this.name,
    required this.price,
    required this.check,
    required this.active,
  });

  factory StoreMenuOptionResponseModel.fromJson(Map<String, dynamic> data) {
    return StoreMenuOptionResponseModel(
      idx: data['idx'],
      storeIdx: data['store_idx'],
      tabIdx: data['tab_idx'],
      name: data['name'],
      price: data['price'],
      check: false.obs,
      active: data['active'],
    );
  }
}
