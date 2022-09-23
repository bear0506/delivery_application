import 'dart:convert';

import 'package:delivery_service/app/controller/room/room_controller.dart';
import 'package:delivery_service/main.dart';
import 'package:get/get.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:delivery_service/app/data/provider/store/store_provider.dart';
import 'package:delivery_service/app/data/model/store/store_model.dart';
import 'package:get_storage/get_storage.dart';

RxDouble categoryHeight = 20.h.obs;
RxDouble productHeight = 423.h.obs;

class StoreCategory {
  StoreCategory({
    required this.name,
    required this.products,
  });

  final String name;
  final List<StoreProduct> products;
}

class StoreMenuTab {
  StoreMenuTab({
    required this.name,
    required this.menus,
  });

  final String name;
  final List<StoreMenuResponseModel> menus;
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

class StoreMenu {
  StoreMenu({
    required this.idx,
    required this.name,
    required this.info,
    required this.price,
    required this.image,
    required this.isLast,
  });

  final int idx;
  final String name;
  final String info;
  final double price;
  final String image;
  final bool isLast;
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

class StoreMenuTabModel {
  StoreMenuTabModel({
    required this.menuTab,
    required this.selected,
    required this.offsetFrom,
    required this.offsetTo,
  });

  StoreMenuTabModel copyWith(bool selected) => StoreMenuTabModel(
        menuTab: menuTab,
        selected: selected,
        offsetFrom: offsetFrom,
        offsetTo: offsetTo,
      );

  final StoreMenuTab menuTab;
  final bool selected;
  final double offsetFrom;
  final double offsetTo;
}

class StoreItem {
  StoreItem({
    required this.menuTab,
    required this.menu,
  });

  final StoreMenuTab menuTab;
  final StoreMenu menu;

  bool get isMenuTab => menuTab.name != "";
}

class StoreController extends GetxController with GetTickerProviderStateMixin {
  // Rx<Sort> sort = Sort.popularity.obs;
  Rx<Color> tempColor = const Color(0xFFF8F8F8).obs;

  late Rx<dynamic> storeIdx, menuIdx;

  late RxString categoryTabName = "전체".obs;

  late RxList<CategoryResponseModel> categories = <CategoryResponseModel>[].obs;
  late RxList<StoreResponseModel> stores = <StoreResponseModel>[].obs;
  late Rx<StoreResponseModel> store = StoreResponseModel(
    idx: 0,
    categoryIdx: "",
    name: "",
    address: "",
    deliveryFee: "",
    deliveryTime: "",
    minimumOrder: "",
    information: "",
    tab: <StoreTabResponseModel>[],
    active: false,
    favorite: false,
  ).obs;

  late Rx<StoreMenuResponseModel> currentMenu = StoreMenuResponseModel(
    idx: 0,
    storeIdx: 0,
    tabIdx: "",
    name: "",
    price: 0,
    count: 0.obs,
    info: "",
    active: false,
    menuOptionTab: <StoreMenuOptionTabResponseModel>[],
  ).obs;

  late RxInt menuCount;
  RxInt menuPrice = 0.obs;
  RxList<int> menuOptions = <int>[].obs;

  // 전체 카테고리 조회
  Future<void> handleCategoryAllProvider() async {
    try {
      await CategoryAllProvider().dio().then((value) {
        if (value.status == "success") {
          print("전체 카테고리 조회 성공");
          categories.assignAll(value.categories);
          categories.refresh();

          initStoreListTab();
        } else {
          print("전체 카테고리 조회 실패");
        }
      });
    } catch (e) {
      logger.d(e);
    } finally {
      Future.delayed(
          const Duration(milliseconds: 500),
          // ignore: avoid_print
          () {});
    }
  }

  // 전체 가게 조회
  Future<void> handleStoreAllProvider() async {
    try {
      await StoreAllProvider().dio().then((value) {
        if (value.status == "success") {
          print("전체 가게 조회 성공");

          stores.addAll(value.stores);
          stores.refresh();
        } else {
          print("전체 가게 조회 실패");
        }
      });
    } catch (e) {
      logger.d(e);
    } finally {
      Future.delayed(
          const Duration(milliseconds: 500),
          // ignore: avoid_print
          () {});
    }
  }

  // 가게 즐겨찾기 추가or취소
  Future<void> handleStoreFavoriteProvider() async {
    storeIdx = Get.parameters["storeIdx"].obs;

    try {
      await StoreFavoriteProvider()
          .dio(storeIdx: int.parse(storeIdx.value))
          .then((value) {
        if (value.status == "success") {
          print("가게 즐겨찾기 성공");

          store.value.favorite = value.result;
          store.refresh();

          handleCategoryAllProvider();
          categoryTabName.value = "전체";
        } else {
          print("가게 즐겨찾기 실패");
        }
      });
    } catch (e) {
      logger.d(e);
    } finally {
      Future.delayed(
          const Duration(milliseconds: 500),
          // ignore: avoid_print
          () {});
    }
  }

  // 특정 가게 조회
  Future<void> handleStoreInitProvider() async {
    storeMenuTabs.clear();
    items.clear();
    storeUITabController.value = TabController(length: 0, vsync: this);

    storeIdx = Get.parameters["storeIdx"].obs;

    print(storeIdx);

    try {
      await StoreInitProvider()
          .dio(idx: int.parse(storeIdx.value))
          .then((value) {
        if (value.status == "success") {
          store.value = value.stores[0];
          store.refresh();

          initStoreTabMenu();
          Get.put(RoomController()).handleRoomsInStoreProvider();
        } else {
          print("else");
        }
      });
    } catch (e) {
      logger.d(e);
    } finally {
      Future.delayed(
          const Duration(milliseconds: 500),
          // ignore: avoid_print
          () {});
    }
  }

  // 특정 메뉴 조회
  Future<void> handleMenuInitProvider() async {
    menuIdx = Get.parameters["menuIdx"].obs;

    try {
      await MenuInitProvider().dio(idx: int.parse(menuIdx.value)).then((value) {
        if (value.status == "success") {
          currentMenu.value = value.menu;
          currentMenu.refresh;

          onInitStoreMenuDetailUI();
        } else {
          print("else");
        }
      });
    } catch (e) {
      logger.d(e);
    } finally {
      Future.delayed(
          const Duration(milliseconds: 500),
          // ignore: avoid_print
          () {});
    }
  }

  Rx<ScrollController> scrollController = ScrollController().obs;
  Rx<ScrollController> scrollController2 = ScrollController().obs;
  Rx<ScrollController> scrollController3 = ScrollController().obs;

  Rx<ScrollController> storeUIScrollController = ScrollController().obs;

  late Rx<TabController> storeUITabController = TabController(
    length: 0,
    vsync: this,
  ).obs;

  late Rx<TabController> storeListUITabController = TabController(
    length: 0,
    vsync: this,
  ).obs;

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

  // 0629
  RxList<StoreMenuTabModel> storeMenuTabs = <StoreMenuTabModel>[].obs;
  late RxList<StoreItem> items = <StoreItem>[].obs;

  late FocusScopeNode currentFocus;
  late FocusNode menusCheckBoxFocusNode;
  late FocusNode privacyCheckBoxFocusNode;
  late FocusNode menusOutlinedButtonFocusNode;

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
    maxExtent.value = storeUIScrollController.value.offset;
  }

  @override
  void onInit() async {
    // await handleStoreAllProvider();
    await handleCategoryAllProvider();

    super.onInit();

    scrollController.value.addListener(getCurrentExtent);
    scrollController.value.addListener(isSliverAppBarExpanded);
    storeUIScrollController.value.addListener(getCurrentExtent2);

    storeUIScrollController.value.addListener(() {
      double showoffset =
          10.0; //Back to top botton will show on scroll offset 10.0

      if (storeUIScrollController.value.offset > showoffset) {
        showbtn.value = true;
      } else {
        showbtn.value = false;
      }
    });

    menusCheckBoxFocusNode = FocusNode();
    privacyCheckBoxFocusNode = FocusNode();
    menusOutlinedButtonFocusNode = FocusNode();
  }

  void initStoreListTab() {
    storeListUITabController.value =
        TabController(length: categories.length, vsync: this);

    storeListUITabController.value.addListener(_onTabControllListner);
  }

  void initStoreTabMenu() {
    var storeTabsResponse = store.value.tab;

    double offsetFrom = 1940.0.h;
    double offsetTo = 1940.0.h;

    for (int i = 0; i < storeTabsResponse.length; i++) {
      var storeTab = storeTabsResponse[i];

      if (i > 0) {
        offsetFrom +=
            storeTabsResponse[i - 1].menu.length * productHeight.value;
      }

      if (i < storeTabsResponse.length - 1) {
        offsetTo =
            offsetFrom + storeTabsResponse[i].menu.length * productHeight.value;
      } else {
        offsetTo = double.infinity;
      }

      storeMenuTabs.add(
        StoreMenuTabModel(
            menuTab: StoreMenuTab(
              name: storeTab.name,
              menus: storeTab.menu,
            ),
            selected: (i == 0),
            offsetFrom: categoryHeight * i + offsetFrom,
            offsetTo: offsetTo),
      );

      storeMenuTabs.refresh();

      storeUITabController.value =
          TabController(length: storeMenuTabs.length, vsync: this);

      items.add(
        StoreItem(
          menuTab: StoreMenuTab(
            name: storeTab.name,
            menus: storeTab.menu,
          ),
          menu: StoreMenu(
            idx: 0,
            name: "",
            info: "",
            price: 0,
            image: "",
            isLast: false,
          ),
        ),
      );

      for (int j = 0; j < storeTab.menu.length; j++) {
        var menu = storeTab.menu[j];

        items.add(
          StoreItem(
            menuTab: StoreMenuTab(
              name: "",
              menus: <StoreMenuResponseModel>[],
            ),
            menu: StoreMenu(
              idx: menu.idx,
              name: menu.name,
              info: menu.info,
              price: menu.price.toDouble(),
              image: "asssets/icons/ch.png",
              isLast: j == storeTab.menu.length - 1 ? true : false,
            ),
          ),
        );
      }

      items.refresh();

      storeUIScrollController.value.addListener(_onScrollListner);
    }
  }

  void _onScrollListner() {
    for (int i = 0; i < storeMenuTabs.length; i++) {
      final menuTab = storeMenuTabs[i];
      if (storeUIScrollController.value.offset >= menuTab.offsetFrom &&
          storeUIScrollController.value.offset <= menuTab.offsetTo &&
          !menuTab.selected) {
        onCategorySelected(i, animationRequired: false);
        storeUITabController.value.animateTo(i);
        break;
      }
    }
  }

  void _onTabControllListner() {
    if (!storeListUITabController.value.indexIsChanging) {
      categoryTabName.value =
          categories[storeListUITabController.value.index].name;
    }
  }

  void onCategorySelected(int index, {bool animationRequired = true}) {
    var selected = storeMenuTabs[index];

    for (int i = 0; i < storeMenuTabs.length; i++) {
      storeMenuTabs[i] = storeMenuTabs[i]
          .copyWith(selected.menuTab == storeMenuTabs[i].menuTab);
    }
    update();

    if (animationRequired) {
      storeUIScrollController.value.animateTo(
        selected.offsetFrom,
        duration: const Duration(
          microseconds: 500,
        ),
        curve: Curves.linear,
      );
    }
  }

  void onInitStoreMenuDetailUI() {
    // menuCount = 1.obs;
    onChangeMenuPrice();
  }

  void onChangeMenuPrice() {
    menuOptions.clear();

    menuPrice.value = currentMenu.value.price;

    for (int i = 0; i < currentMenu.value.menuOptionTab.length; i++) {
      var optionTab = currentMenu.value.menuOptionTab[i];

      for (int j = 0; j < optionTab.menuOption.length; j++) {
        var option = optionTab.menuOption[j];

        if (option.check.value == true) {
          menuPrice.value += option.price;
          menuOptions.add(option.idx);
        }
      }
    }

    menuPrice.value = menuPrice.value * currentMenu.value.count.value;
  }

  void onClickMenuCountPlus() {
    currentMenu.value.count.value = currentMenu.value.count.value + 1;
    onChangeMenuPrice();
  }

  void onClickMenuCountMinus() {
    if (currentMenu.value.count.value > 1) {
      currentMenu.value.count.value = currentMenu.value.count.value - 1;
    }
    onChangeMenuPrice();
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

    storeUIScrollController.value.removeListener(_onScrollListner);
    storeUIScrollController.value.removeListener(getCurrentExtent2);

    storeListUITabController.value.removeListener(_onTabControllListner);

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
