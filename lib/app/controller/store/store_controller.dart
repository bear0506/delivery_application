import 'dart:convert';

import 'package:get/get.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum Sort {
  popularity,
  newOrder,
  quickTimeOrder,
  delieveryCostMuch,
  delieveryCostLess,
  numberOfPeople,
}

RxDouble categoryHeight = 120.h.obs;
RxDouble productHeight = 450.h.obs;

class StoreCategory {
  StoreCategory({
    required this.name,
    required this.products,
  });

  final String name;
  final List<StoreProduct> products;
}

class StoreProduct {
  StoreProduct({
    required this.index,
    required this.name,
    required this.decsription,
    required this.price,
    required this.image,
    required this.additionalProducts,
  });

  final int index;
  final String name;
  final String decsription;
  final double price;
  final String image;
  final List<StoreAdditionalProduct> additionalProducts;
}

class StoreAdditionalProduct {
  StoreAdditionalProduct({
    required this.name,
    required this.price,
    required this.isChecked,
  });

  final String name;
  final double price;
  late RxBool isChecked;
}

class StoreTabCategory {
  StoreTabCategory({
    required this.category,
    required this.selected,
    required this.offsetFrom,
    required this.offsetTo,
  });

  StoreTabCategory copyWith(bool selected) => StoreTabCategory(
        category: category,
        selected: selected,
        offsetFrom: offsetFrom,
        offsetTo: offsetTo,
      );

  final StoreCategory category;
  final bool selected;
  final double offsetFrom;
  final double offsetTo;
}

class StoreItem {
  StoreItem({
    required this.category,
    required this.product,
  });

  final StoreCategory? category;
  final StoreProduct? product;

  bool get isCategory => category != null;
}

class StoreController extends GetxController with GetTickerProviderStateMixin {
  Rx<Sort> sort = Sort.popularity.obs;
  late Rx<dynamic> storeIdx = Get.parameters["storeIdx"].obs;

  final RxList<Tab> myTabs = <Tab>[
    const Tab(text: "전체"),
    const Tab(text: "한식"),
    const Tab(text: "분식"),
    const Tab(text: "치킨"),
    const Tab(text: "피자"),
    const Tab(text: "돈까스"),
  ].obs;

  RxList<dynamic> myTabsData = [
    {
      "img": "assets/icons/meat_store.png".obs,
      "storeName": "성민이네 엘스점".obs,
      "time": "20분 ~ 30분".obs,
      "starScore": "4.5".obs,
      "reviewNumber": "[159]".obs,
      "price": "3,000원".obs,
    },
    {
      "img": "assets/icons/salad_store.png".obs,
      "storeName": "성민이네 리센츠점".obs,
      "time": "20분 ~ 30분".obs,
      "starScore": "4.5".obs,
      "reviewNumber": "[159]".obs,
      "price": "3,000원".obs,
    },
    {
      "img": "assets/icons/chicken_store.png".obs,
      "storeName": "성민이네 트리지움점".obs,
      "time": "20분 ~ 30분".obs,
      "starScore": "4.5".obs,
      "reviewNumber": "[159]".obs,
      "price": "3,000원".obs,
    },
    {
      "img": "assets/icons/pizza_store.png".obs,
      "storeName": "성민이네 파크리오점".obs,
      "time": "20분 ~ 30분".obs,
      "starScore": "4.5".obs,
      "reviewNumber": "[159]".obs,
      "price": "3,000원".obs,
    },
    {
      "img": "assets/icons/meat_store.png".obs,
      "storeName": "성민이네 잠실5단지점".obs,
      "time": "20분 ~ 30분".obs,
      "starScore": "4.5".obs,
      "reviewNumber": "[159]".obs,
      "price": "3,000원".obs,
    },
    {
      "img": "assets/icons/salad_store.png".obs,
      "storeName": "성민이네 잠실본동점".obs,
      "time": "20분 ~ 30분".obs,
      "starScore": "4.5".obs,
      "reviewNumber": "[159]".obs,
      "price": "3,000원".obs,
    },
  ].obs;

  final RxList<SingleChildScrollView> myTabViews = <SingleChildScrollView>[
    SingleChildScrollView(
      child: Container(
        color: Colors.blue,
      ),
    )
  ].obs;

  Rx<ScrollController> scrollController = ScrollController().obs;
  Rx<ScrollController> scrollController2 = ScrollController().obs;
  Rx<ScrollController> scrollController3 = ScrollController().obs;

  Rx<ScrollController> storeUiScrollController = ScrollController().obs;

  late Rx<TabController> tabController = TabController(
    length: tabs.length,
    vsync: this,
  ).obs;

  late Rx<TabController> tabController2 = TabController(
    length: myTabs.length,
    vsync: this,
    initialIndex: 0,
  ).obs;

  RxInt count = 1.obs;

  RxInt selectedTab = 0.obs;

  RxDouble currentExtent = 0.0.obs;
  RxDouble maxExtent = 9999.0.obs;
  RxDouble extentRatio = 0.0.obs;

  RxDouble offsetFrom = (1800.h + AppBar().preferredSize.height).obs;
  RxDouble offsetTo = (1800.0.h + AppBar().preferredSize.height).obs;

  RxBool temptemptemp = true.obs;

  RxBool temptemp = false.obs;

  RxBool showbtn = false.obs;

  RxBool showBackToTopButton = false.obs;

  RxBool isLoaderVisible = false.obs;

  RxBool scrollBool = false.obs;

  RxList<StoreTabCategory> tabs = <StoreTabCategory>[].obs;
  RxList<StoreItem> items = <StoreItem>[].obs;

  late FocusScopeNode currentFocus;
  late FocusNode menusCheckBoxFocusNode;
  late FocusNode privacyCheckBoxFocusNode;
  late FocusNode menusOutlinedButtonFocusNode;

  RxList<StoreCategory> storeCategories = [
    StoreCategory(
      name: "치킨",
      products: [
        StoreProduct(
          index: 1,
          name: "발사믹치킨",
          decsription: "발사믹 비네거의 깊은 풍미와 달콤함이 어우러진 달콤쌈콤 치킨",
          price: 22000,
          image: "asssets/icons/ch.png",
          additionalProducts: [
            StoreAdditionalProduct(
                name: "칩카사바", price: 1500, isChecked: false.obs),
            StoreAdditionalProduct(
                name: "리얼치킨버거", price: 4900, isChecked: false.obs),
            StoreAdditionalProduct(
                name: "교촌칠리포테이토", price: 4000, isChecked: false.obs),
          ],
        ),
        StoreProduct(
          index: 2,
          name: "황금올리브",
          decsription: "발사믹 비네거의 깊은 풍미와 달콤함이 어우러진 달콤쌈콤 치킨",
          price: 22000,
          image: "asssets/icons/ch.png",
          additionalProducts: [
            StoreAdditionalProduct(
                name: "칩카사바", price: 1500, isChecked: false.obs),
            StoreAdditionalProduct(
                name: "리얼치킨버거", price: 4900, isChecked: false.obs),
            StoreAdditionalProduct(
                name: "교촌칠리포테이토", price: 4000, isChecked: false.obs),
          ],
        ),
        StoreProduct(
          index: 3,
          name: "레드콤보",
          decsription: "발사믹 비네거의 깊은 풍미와 달콤함이 어우러진 달콤쌈콤 치킨",
          price: 22000,
          image: "asssets/icons/ch.png",
          additionalProducts: [
            StoreAdditionalProduct(
                name: "칩카사바", price: 1500, isChecked: false.obs),
            StoreAdditionalProduct(
                name: "리얼치킨버거", price: 4900, isChecked: false.obs),
            StoreAdditionalProduct(
                name: "교촌칠리포테이토", price: 4000, isChecked: false.obs),
          ],
        ),
        StoreProduct(
          index: 4,
          name: "허니콤보",
          decsription: "발사믹 비네거의 깊은 풍미와 달콤함이 어우러진 달콤쌈콤 치킨",
          price: 22000,
          image: "asssets/icons/ch.png",
          additionalProducts: [
            StoreAdditionalProduct(
                name: "칩카사바", price: 1500, isChecked: false.obs),
            StoreAdditionalProduct(
                name: "리얼치킨버거", price: 4900, isChecked: false.obs),
            StoreAdditionalProduct(
                name: "교촌칠리포테이토", price: 4000, isChecked: false.obs),
          ],
        ),
      ],
    ),
    StoreCategory(
      name: '피자',
      products: [
        StoreProduct(
          index: 5,
          name: "치즈피자",
          decsription: "발사믹 비네거의 깊은 풍미와 달콤함이 어우러진 달콤쌈콤 치킨",
          price: 22000,
          image: "asssets/icons/ch.png",
          additionalProducts: [
            StoreAdditionalProduct(
                name: "칩카사바", price: 1500, isChecked: false.obs),
            StoreAdditionalProduct(
                name: "리얼치킨버거", price: 4900, isChecked: false.obs),
            StoreAdditionalProduct(
                name: "교촌칠리포테이토", price: 4000, isChecked: false.obs),
          ],
        ),
        StoreProduct(
          index: 6,
          name: "포테이토피자",
          decsription: "발사믹 비네거의 깊은 풍미와 달콤함이 어우러진 달콤쌈콤 치킨",
          price: 22000,
          image: "asssets/icons/ch.png",
          additionalProducts: [
            StoreAdditionalProduct(
                name: "칩카사바", price: 1500, isChecked: false.obs),
            StoreAdditionalProduct(
                name: "리얼치킨버거", price: 4900, isChecked: false.obs),
            StoreAdditionalProduct(
                name: "교촌칠리포테이토", price: 4000, isChecked: false.obs),
          ],
        ),
        StoreProduct(
          index: 7,
          name: "하와이안피자",
          decsription: "발사믹 비네거의 깊은 풍미와 달콤함이 어우러진 달콤쌈콤 치킨",
          price: 22000,
          image: "asssets/icons/ch.png",
          additionalProducts: [
            StoreAdditionalProduct(
                name: "칩카사바", price: 1500, isChecked: false.obs),
            StoreAdditionalProduct(
                name: "리얼치킨버거", price: 4900, isChecked: false.obs),
            StoreAdditionalProduct(
                name: "교촌칠리포테이토", price: 4000, isChecked: false.obs),
          ],
        ),
        StoreProduct(
          index: 8,
          name: "콤비네이션피자",
          decsription: "발사믹 비네거의 깊은 풍미와 달콤함이 어우러진 달콤쌈콤 치킨",
          price: 22000,
          image: "asssets/icons/ch.png",
          additionalProducts: [
            StoreAdditionalProduct(
                name: "칩카사바", price: 1500, isChecked: false.obs),
            StoreAdditionalProduct(
                name: "리얼치킨버거", price: 4900, isChecked: false.obs),
            StoreAdditionalProduct(
                name: "교촌칠리포테이토", price: 4000, isChecked: false.obs),
          ],
        ),
      ],
    ),
    StoreCategory(
      name: '햄버거',
      products: [
        StoreProduct(
          index: 9,
          name: "빅맥",
          decsription: "발사믹 비네거의 깊은 풍미와 달콤함이 어우러진 달콤쌈콤 치킨",
          price: 22000,
          image: "asssets/icons/ch.png",
          additionalProducts: [
            StoreAdditionalProduct(
                name: "칩카사바", price: 1500, isChecked: false.obs),
            StoreAdditionalProduct(
                name: "리얼치킨버거", price: 4900, isChecked: false.obs),
            StoreAdditionalProduct(
                name: "교촌칠리포테이토", price: 4000, isChecked: false.obs),
          ],
        ),
        StoreProduct(
          index: 10,
          name: "1955",
          decsription: "발사믹 비네거의 깊은 풍미와 달콤함이 어우러진 달콤쌈콤 치킨",
          price: 22000,
          image: "asssets/icons/ch.png",
          additionalProducts: [
            StoreAdditionalProduct(
                name: "칩카사바", price: 1500, isChecked: false.obs),
            StoreAdditionalProduct(
                name: "리얼치킨버거", price: 4900, isChecked: false.obs),
            StoreAdditionalProduct(
                name: "교촌칠리포테이토", price: 4000, isChecked: false.obs),
          ],
        ),
        StoreProduct(
          index: 11,
          name: "치즈버거",
          decsription: "발사믹 비네거의 깊은 풍미와 달콤함이 어우러진 달콤쌈콤 치킨",
          price: 22000,
          image: "asssets/icons/ch.png",
          additionalProducts: [
            StoreAdditionalProduct(
                name: "칩카사바", price: 1500, isChecked: false.obs),
            StoreAdditionalProduct(
                name: "리얼치킨버거", price: 4900, isChecked: false.obs),
            StoreAdditionalProduct(
                name: "교촌칠리포테이토", price: 4000, isChecked: false.obs),
          ],
        ),
        StoreProduct(
          index: 12,
          name: "상하이",
          decsription: "발사믹 비네거의 깊은 풍미와 달콤함이 어우러진 달콤쌈콤 치킨",
          price: 22000,
          image: "asssets/icons/ch.png",
          additionalProducts: [
            StoreAdditionalProduct(
                name: "칩카사바", price: 1500, isChecked: false.obs),
            StoreAdditionalProduct(
                name: "리얼치킨버거", price: 4900, isChecked: false.obs),
            StoreAdditionalProduct(
                name: "교촌칠리포테이토", price: 4000, isChecked: false.obs),
          ],
        ),
      ],
    ),
    StoreCategory(
      name: '음료',
      products: [
        StoreProduct(
          index: 13,
          name: "콜라",
          decsription: "발사믹 비네거의 깊은 풍미와 달콤함이 어우러진 달콤쌈콤 치킨",
          price: 22000,
          image: "asssets/icons/ch.png",
          additionalProducts: [
            StoreAdditionalProduct(
                name: "칩카사바", price: 1500, isChecked: false.obs),
            StoreAdditionalProduct(
                name: "리얼치킨버거", price: 4900, isChecked: false.obs),
            StoreAdditionalProduct(
                name: "교촌칠리포테이토", price: 4000, isChecked: false.obs),
          ],
        ),
        StoreProduct(
          index: 14,
          name: "사이다",
          decsription: "발사믹 비네거의 깊은 풍미와 달콤함이 어우러진 달콤쌈콤 치킨",
          price: 22000,
          image: "asssets/icons/ch.png",
          additionalProducts: [
            StoreAdditionalProduct(
                name: "칩카사바", price: 1500, isChecked: false.obs),
            StoreAdditionalProduct(
                name: "리얼치킨버거", price: 4900, isChecked: false.obs),
            StoreAdditionalProduct(
                name: "교촌칠리포테이토", price: 4000, isChecked: false.obs),
          ],
        ),
        StoreProduct(
          index: 15,
          name: "소주",
          decsription: "발사믹 비네거의 깊은 풍미와 달콤함이 어우러진 달콤쌈콤 치킨",
          price: 22000,
          image: "asssets/icons/ch.png",
          additionalProducts: [
            StoreAdditionalProduct(
                name: "칩카사바", price: 1500, isChecked: false.obs),
            StoreAdditionalProduct(
                name: "리얼치킨버거", price: 4900, isChecked: false.obs),
            StoreAdditionalProduct(
                name: "교촌칠리포테이토", price: 4000, isChecked: false.obs),
          ],
        ),
        StoreProduct(
          index: 16,
          name: "맥주",
          decsription: "발사믹 비네거의 깊은 풍미와 달콤함이 어우러진 달콤쌈콤 치킨",
          price: 22000,
          image: "asssets/icons/ch.png",
          additionalProducts: [
            StoreAdditionalProduct(
                name: "칩카사바", price: 1500, isChecked: false.obs),
            StoreAdditionalProduct(
                name: "리얼치킨버거", price: 4900, isChecked: false.obs),
            StoreAdditionalProduct(
                name: "교촌칠리포테이토", price: 4000, isChecked: false.obs),
          ],
        ),
      ],
    ),
    StoreCategory(
      name: '사이드',
      products: [
        StoreProduct(
          index: 17,
          name: "웨지감자",
          decsription: "발사믹 비네거의 깊은 풍미와 달콤함이 어우러진 달콤쌈콤 치킨",
          price: 22000,
          image: "asssets/icons/ch.png",
          additionalProducts: [
            StoreAdditionalProduct(
                name: "칩카사바", price: 1500, isChecked: false.obs),
            StoreAdditionalProduct(
                name: "리얼치킨버거", price: 4900, isChecked: false.obs),
            StoreAdditionalProduct(
                name: "교촌칠리포테이토", price: 4000, isChecked: false.obs),
          ],
        ),
        StoreProduct(
          index: 18,
          name: "핫윙",
          decsription: "발사믹 비네거의 깊은 풍미와 달콤함이 어우러진 달콤쌈콤 치킨",
          price: 22000,
          image: "asssets/icons/ch.png",
          additionalProducts: [
            StoreAdditionalProduct(
                name: "칩카사바", price: 1500, isChecked: false.obs),
            StoreAdditionalProduct(
                name: "리얼치킨버거", price: 4900, isChecked: false.obs),
            StoreAdditionalProduct(
                name: "교촌칠리포테이토", price: 4000, isChecked: false.obs),
          ],
        ),
        StoreProduct(
          index: 19,
          name: "치즈볼",
          decsription: "발사믹 비네거의 깊은 풍미와 달콤함이 어우러진 달콤쌈콤 치킨",
          price: 22000,
          image: "asssets/icons/ch.png",
          additionalProducts: [
            StoreAdditionalProduct(
                name: "칩카사바", price: 1500, isChecked: false.obs),
            StoreAdditionalProduct(
                name: "리얼치킨버거", price: 4900, isChecked: false.obs),
            StoreAdditionalProduct(
                name: "교촌칠리포테이토", price: 4000, isChecked: false.obs),
          ],
        ),
        StoreProduct(
          index: 20,
          name: "치즈스틱",
          decsription: "발사믹 비네거의 깊은 풍미와 달콤함이 어우러진 달콤쌈콤 치킨",
          price: 22000,
          image: "asssets/icons/ch.png",
          additionalProducts: [
            StoreAdditionalProduct(
                name: "칩카사바", price: 1500, isChecked: false.obs),
            StoreAdditionalProduct(
                name: "리얼치킨버거", price: 4900, isChecked: false.obs),
            StoreAdditionalProduct(
                name: "교촌칠리포테이토", price: 4000, isChecked: false.obs),
          ],
        ),
      ],
    ),
  ].obs;

  RxMap<String, StoreProduct> storeTempMenus = {
    "1": StoreProduct(
      index: 1,
      name: "발사믹치킨",
      decsription: "발사믹 비네거의 깊은 풍미와 달콤함이 어우러진 달콤쌈콤 치킨",
      price: 22000,
      image: "asssets/icons/ch.png",
      additionalProducts: [
        StoreAdditionalProduct(name: "칩카사바", price: 1500, isChecked: false.obs),
        StoreAdditionalProduct(
            name: "리얼치킨버거", price: 4900, isChecked: false.obs),
        StoreAdditionalProduct(
            name: "교촌칠리포테이토", price: 4000, isChecked: false.obs),
      ],
    ),
    "2": StoreProduct(
      index: 2,
      name: "황금올리브",
      decsription: "발사믹 비네거의 깊은 풍미와 달콤함이 어우러진 달콤쌈콤 치킨ㅋㅋㅋㅋ",
      price: 22000,
      image: "asssets/icons/ch.png",
      additionalProducts: [
        StoreAdditionalProduct(name: "칩카사바", price: 1500, isChecked: false.obs),
        StoreAdditionalProduct(
            name: "리얼치킨버거", price: 4900, isChecked: false.obs),
        StoreAdditionalProduct(
            name: "교촌칠리포테이토", price: 4000, isChecked: false.obs),
      ],
    ),
    "3": StoreProduct(
      index: 3,
      name: "레드콤보",
      decsription: "발사믹 비네거의 깊은 풍미와 달콤함이 어우러진 달콤쌈콤 치킨",
      price: 22000,
      image: "asssets/icons/ch.png",
      additionalProducts: [
        StoreAdditionalProduct(name: "칩카사바", price: 1500, isChecked: false.obs),
        StoreAdditionalProduct(
            name: "리얼치킨버거", price: 4900, isChecked: false.obs),
        StoreAdditionalProduct(
            name: "교촌칠리포테이토", price: 4000, isChecked: false.obs),
      ],
    ),
    "4": StoreProduct(
      index: 4,
      name: "허니콤보",
      decsription: "발사믹 비네거의 깊은 풍미와 달콤함이 어우러진 달콤쌈콤 치킨",
      price: 22000,
      image: "asssets/icons/ch.png",
      additionalProducts: [
        StoreAdditionalProduct(name: "칩카사바", price: 1500, isChecked: false.obs),
        StoreAdditionalProduct(
            name: "리얼치킨버거", price: 4900, isChecked: false.obs),
        StoreAdditionalProduct(
            name: "교촌칠리포테이토", price: 4000, isChecked: false.obs),
      ],
    ),
    "5": StoreProduct(
      index: 5,
      name: "치즈피자",
      decsription: "발사믹 비네거의 깊은 풍미와 달콤함이 어우러진 달콤쌈콤 치킨",
      price: 22000,
      image: "asssets/icons/ch.png",
      additionalProducts: [
        StoreAdditionalProduct(name: "칩카사바", price: 1500, isChecked: false.obs),
        StoreAdditionalProduct(
            name: "리얼치킨버거", price: 4900, isChecked: false.obs),
        StoreAdditionalProduct(
            name: "교촌칠리포테이토", price: 4000, isChecked: false.obs),
      ],
    ),
    "6": StoreProduct(
      index: 6,
      name: "포테이토피자",
      decsription: "발사믹 비네거의 깊은 풍미와 달콤함이 어우러진 달콤쌈콤 치킨",
      price: 22000,
      image: "asssets/icons/ch.png",
      additionalProducts: [
        StoreAdditionalProduct(name: "칩카사바", price: 1500, isChecked: false.obs),
        StoreAdditionalProduct(
            name: "리얼치킨버거", price: 4900, isChecked: false.obs),
        StoreAdditionalProduct(
            name: "교촌칠리포테이토", price: 4000, isChecked: false.obs),
      ],
    ),
    "7": StoreProduct(
      index: 7,
      name: "하와이안피자",
      decsription: "발사믹 비네거의 깊은 풍미와 달콤함이 어우러진 달콤쌈콤 치킨",
      price: 22000,
      image: "asssets/icons/ch.png",
      additionalProducts: [
        StoreAdditionalProduct(name: "칩카사바", price: 1500, isChecked: false.obs),
        StoreAdditionalProduct(
            name: "리얼치킨버거", price: 4900, isChecked: false.obs),
        StoreAdditionalProduct(
            name: "교촌칠리포테이토", price: 4000, isChecked: false.obs),
      ],
    ),
    "8": StoreProduct(
      index: 8,
      name: "콤비네이션피자",
      decsription: "발사믹 비네거의 깊은 풍미와 달콤함이 어우러진 달콤쌈콤 치킨",
      price: 22000,
      image: "asssets/icons/ch.png",
      additionalProducts: [
        StoreAdditionalProduct(name: "칩카사바", price: 1500, isChecked: false.obs),
        StoreAdditionalProduct(
            name: "리얼치킨버거", price: 4900, isChecked: false.obs),
        StoreAdditionalProduct(
            name: "교촌칠리포테이토", price: 4000, isChecked: false.obs),
      ],
    ),
    "9": StoreProduct(
      index: 9,
      name: "빅맥",
      decsription: "발사믹 비네거의 깊은 풍미와 달콤함이 어우러진 달콤쌈콤 치킨",
      price: 22000,
      image: "asssets/icons/ch.png",
      additionalProducts: [
        StoreAdditionalProduct(name: "칩카사바", price: 1500, isChecked: false.obs),
        StoreAdditionalProduct(
            name: "리얼치킨버거", price: 4900, isChecked: false.obs),
        StoreAdditionalProduct(
            name: "교촌칠리포테이토", price: 4000, isChecked: false.obs),
      ],
    ),
    "10": StoreProduct(
      index: 10,
      name: "1955",
      decsription: "발사믹 비네거의 깊은 풍미와 달콤함이 어우러진 달콤쌈콤 치킨",
      price: 22000,
      image: "asssets/icons/ch.png",
      additionalProducts: [
        StoreAdditionalProduct(name: "칩카사바", price: 1500, isChecked: false.obs),
        StoreAdditionalProduct(
            name: "리얼치킨버거", price: 4900, isChecked: false.obs),
        StoreAdditionalProduct(
            name: "교촌칠리포테이토", price: 4000, isChecked: false.obs),
      ],
    ),
    "11": StoreProduct(
      index: 11,
      name: "치즈버거",
      decsription: "발사믹 비네거의 깊은 풍미와 달콤함이 어우러진 달콤쌈콤 치킨",
      price: 22000,
      image: "asssets/icons/ch.png",
      additionalProducts: [
        StoreAdditionalProduct(name: "칩카사바", price: 1500, isChecked: false.obs),
        StoreAdditionalProduct(
            name: "리얼치킨버거", price: 4900, isChecked: false.obs),
        StoreAdditionalProduct(
            name: "교촌칠리포테이토", price: 4000, isChecked: false.obs),
      ],
    ),
    "12": StoreProduct(
      index: 12,
      name: "상하이",
      decsription: "발사믹 비네거의 깊은 풍미와 달콤함이 어우러진 달콤쌈콤 치킨",
      price: 22000,
      image: "asssets/icons/ch.png",
      additionalProducts: [
        StoreAdditionalProduct(name: "칩카사바", price: 1500, isChecked: false.obs),
        StoreAdditionalProduct(
            name: "리얼치킨버거", price: 4900, isChecked: false.obs),
        StoreAdditionalProduct(
            name: "교촌칠리포테이토", price: 4000, isChecked: false.obs),
      ],
    ),
    "13": StoreProduct(
      index: 13,
      name: "콜라",
      decsription: "발사믹 비네거의 깊은 풍미와 달콤함이 어우러진 달콤쌈콤 치킨",
      price: 22000,
      image: "asssets/icons/ch.png",
      additionalProducts: [
        StoreAdditionalProduct(name: "칩카사바", price: 1500, isChecked: false.obs),
        StoreAdditionalProduct(
            name: "리얼치킨버거", price: 4900, isChecked: false.obs),
        StoreAdditionalProduct(
            name: "교촌칠리포테이토", price: 4000, isChecked: false.obs),
      ],
    ),
    "14": StoreProduct(
      index: 14,
      name: "사이다",
      decsription: "발사믹 비네거의 깊은 풍미와 달콤함이 어우러진 달콤쌈콤 치킨",
      price: 22000,
      image: "asssets/icons/ch.png",
      additionalProducts: [
        StoreAdditionalProduct(name: "칩카사바", price: 1500, isChecked: false.obs),
        StoreAdditionalProduct(
            name: "리얼치킨버거", price: 4900, isChecked: false.obs),
        StoreAdditionalProduct(
            name: "교촌칠리포테이토", price: 4000, isChecked: false.obs),
      ],
    ),
    "15": StoreProduct(
      index: 15,
      name: "소주",
      decsription: "발사믹 비네거의 깊은 풍미와 달콤함이 어우러진 달콤쌈콤 치킨",
      price: 22000,
      image: "asssets/icons/ch.png",
      additionalProducts: [
        StoreAdditionalProduct(name: "칩카사바", price: 1500, isChecked: false.obs),
        StoreAdditionalProduct(
            name: "리얼치킨버거", price: 4900, isChecked: false.obs),
        StoreAdditionalProduct(
            name: "교촌칠리포테이토", price: 4000, isChecked: false.obs),
      ],
    ),
    "16": StoreProduct(
      index: 16,
      name: "맥주",
      decsription: "발사믹 비네거의 깊은 풍미와 달콤함이 어우러진 달콤쌈콤 치킨",
      price: 22000,
      image: "asssets/icons/ch.png",
      additionalProducts: [
        StoreAdditionalProduct(name: "칩카사바", price: 1500, isChecked: false.obs),
        StoreAdditionalProduct(
            name: "리얼치킨버거", price: 4900, isChecked: false.obs),
        StoreAdditionalProduct(
            name: "교촌칠리포테이토", price: 4000, isChecked: false.obs),
      ],
    ),
    "17": StoreProduct(
      index: 17,
      name: "웨지감자",
      decsription: "발사믹 비네거의 깊은 풍미와 달콤함이 어우러진 달콤쌈콤 치킨",
      price: 22000,
      image: "asssets/icons/ch.png",
      additionalProducts: [
        StoreAdditionalProduct(name: "칩카사바", price: 1500, isChecked: false.obs),
        StoreAdditionalProduct(
            name: "리얼치킨버거", price: 4900, isChecked: false.obs),
        StoreAdditionalProduct(
            name: "교촌칠리포테이토", price: 4000, isChecked: false.obs),
      ],
    ),
    "18": StoreProduct(
      index: 18,
      name: "핫윙",
      decsription: "발사믹 비네거의 깊은 풍미와 달콤함이 어우러진 달콤쌈콤 치킨",
      price: 22000,
      image: "asssets/icons/ch.png",
      additionalProducts: [
        StoreAdditionalProduct(name: "칩카사바", price: 1500, isChecked: false.obs),
        StoreAdditionalProduct(
            name: "리얼치킨버거", price: 4900, isChecked: false.obs),
        StoreAdditionalProduct(
            name: "교촌칠리포테이토", price: 4000, isChecked: false.obs),
      ],
    ),
    "19": StoreProduct(
      index: 19,
      name: "치즈볼",
      decsription: "발사믹 비네거의 깊은 풍미와 달콤함이 어우러진 달콤쌈콤 치킨",
      price: 22000,
      image: "asssets/icons/ch.png",
      additionalProducts: [
        StoreAdditionalProduct(name: "칩카사바", price: 1500, isChecked: false.obs),
        StoreAdditionalProduct(
            name: "리얼치킨버거", price: 4900, isChecked: false.obs),
        StoreAdditionalProduct(
            name: "교촌칠리포테이토", price: 4000, isChecked: false.obs),
      ],
    ),
    "20": StoreProduct(
      index: 20,
      name: "치즈스틱",
      decsription: "발사믹 비네거의 깊은 풍미와 달콤함이 어우러진 달콤쌈콤 치킨",
      price: 22000,
      image: "asssets/icons/ch.png",
      additionalProducts: [
        StoreAdditionalProduct(name: "칩카사바", price: 1500, isChecked: false.obs),
        StoreAdditionalProduct(
            name: "리얼치킨버거", price: 4900, isChecked: false.obs),
        StoreAdditionalProduct(
            name: "교촌칠리포테이토", price: 4000, isChecked: false.obs),
      ],
    ),
  }.obs;

  RxList<dynamic> isCheckbox = [
    {
      "title": "칩카사바".obs,
      "price": "+1500원".obs,
      "isChecked": false.obs,
    },
    {
      "title": "리얼치킨버거".obs,
      "price": "+4900원".obs,
      "isChecked": false.obs,
    },
    {
      "title": "교촌칠리포테이토".obs,
      "price": "+4000원".obs,
      "isChecked": false.obs,
    },
  ].obs;

  RxList roomInfos = [
    jsonDecode(
        '{"idx":1,"name":"","img":"assets/icons/noze.png","user":"♡zi존성민1♡","address":"서울 중구 퇴계로36길 2","deliveryFee":"2,000원","time":"09:27","distance":"0.7km","capacity":"3"}'),
    jsonDecode(
        '{"idx":2,"name":"","img":"assets/icons/noze.png","user":"♡zi존성민2♡","address":"서울 중구 퇴계로36길 2","deliveryFee":"2,000원","time":"09:27","distance":"0.7km","capacity":"3"}'),
    jsonDecode(
        '{"idx":3,"name":"","img":"assets/icons/noze.png","user":"♡zi존성민3♡","address":"서울 중구 퇴계로36길 2","deliveryFee":"2,000원","time":"09:27","distance":"0.7km","capacity":"3"}'),
  ].obs;

  isSliverAppBarExpanded() {
    temptemp = (scrollController.value.hasClients &&
            scrollController.value.offset > (820.h - kToolbarHeight))
        .obs;
  }

  getCurrentExtent() {
    currentExtent.value = scrollController.value.offset;
    maxExtent.value = scrollController.value.position.maxScrollExtent;

    extentRatio.value = currentExtent.value / maxExtent.value;
  }

  void getCurrentExtent2() {
    maxExtent.value = storeUiScrollController.value.offset;
  }

  @override
  void onInit() {
    super.onInit();

    scrollController.value.addListener(getCurrentExtent);
    scrollController.value.addListener(isSliverAppBarExpanded);

    storeUiScrollController.value.addListener(getCurrentExtent2);

    storeUiScrollController.value.addListener(() {
      //scroll listener
      double showoffset =
          10.0; //Back to top botton will show on scroll offset 10.0

      if (storeUiScrollController.value.offset > showoffset) {
        showbtn.value = true;
      } else {
        showbtn.value = false;
      }
    });

    menusCheckBoxFocusNode = FocusNode();
    privacyCheckBoxFocusNode = FocusNode();
    menusOutlinedButtonFocusNode = FocusNode();

    // double offsetFrom = 0.0;
    double offsetFrom = 1800.h + AppBar().preferredSize.height;
    double offsetTo = 1800.0.h + AppBar().preferredSize.height;

    for (int i = 0; i < storeCategories.length; i++) {
      final category = storeCategories[i];

      if (i > 0) {
        offsetFrom +=
            storeCategories[i - 1].products.length * productHeight.value;
      }

      if (i < storeCategories.length - 1) {
        offsetTo = offsetFrom +
            storeCategories[i + 1].products.length * productHeight.value;
      } else {
        offsetTo = double.infinity;
      }

      // ignore: avoid_print
      print("offsetFrom : $offsetFrom");
      // ignore: avoid_print
      print("offsetTo : $offsetTo");

      tabs.add(
        StoreTabCategory(
          category: category,
          selected: (i == 0),
          offsetFrom: categoryHeight * i + offsetFrom,
          offsetTo: offsetTo,
        ),
      );

      items.add(
        StoreItem(category: category, product: null),
      );

      for (int j = 0; j < category.products.length; j++) {
        final product = category.products[j];
        items.add(
          StoreItem(
            category: null,
            product: product,
          ),
        );
      }
    }

    storeUiScrollController.value.addListener(_onScrollListner);

    tabController2.value.addListener(_onTabControllListner);
  }

  void _onScrollListner() {
    for (int i = 0; i < tabs.length; i++) {
      final tab = tabs[i];
      if (storeUiScrollController.value.offset >= tab.offsetFrom &&
          storeUiScrollController.value.offset <= tab.offsetTo &&
          !tab.selected) {
        onCategorySelected(i, animationRequired: false);
        tabController.value.animateTo(i);
        break;
      }
    }
  }

  void _onTabControllListner() {
    if (!tabController2.value.indexIsChanging) {
      selectedTab = tabController2.value.index.obs;
      update();
    }
  }

  void onCategorySelected(int index, {bool animationRequired = true}) {
    final selected = tabs[index];

    for (int i = 0; i < tabs.length; i++) {
      tabs[i] =
          tabs[i].copyWith(selected.category.name == tabs[i].category.name);
    }
    update();

    if (animationRequired) {
      storeUiScrollController.value.animateTo(
        selected.offsetFrom,
        duration: const Duration(
          microseconds: 500,
        ),
        curve: Curves.linear,
      );
    }
  }

  void onInitStoreMenuDetailUI() {
    storeTempMenus.forEach((key, value) {
      for (int i = 0; i < storeTempMenus[key]!.additionalProducts.length; i++) {
        storeTempMenus[key]!.additionalProducts[i].isChecked = false.obs;
      }
    });
  }

  @override
  // ignore: unnecessary_overrides
  void onReady() {
    super.onReady();
  }

  @override
  // ignore: unnecessary_overrides
  void onClose() {
    super.onClose();
  }

  @override
  // ignore: unnecessary_overrides
  void dispose() {
    Get.delete<StoreController>();

    storeUiScrollController.value.removeListener(_onScrollListner);
    tabController2.value.removeListener(_onTabControllListner);
    menusCheckBoxFocusNode.dispose();
    privacyCheckBoxFocusNode.dispose();
    menusOutlinedButtonFocusNode.dispose();

    super.dispose();
  }

  @override
  // ignore: unnecessary_overrides
  InternalFinalCallback<void> get onStart => super.onStart;

  @override
  // ignore: unnecessary_overrides
  InternalFinalCallback<void> get onDelete => super.onDelete;
}
