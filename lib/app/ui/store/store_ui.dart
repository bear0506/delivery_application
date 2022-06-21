import 'dart:math';

import 'package:get/get.dart';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:badges/badges.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

import 'package:delivery_service/app/controller/store/store_controller.dart';
// import 'package:delivery_service/app/ui/store/store_data.dart';

class StoreUi extends GetView<StoreController> {
  StoreUi({Key? key}) : super(key: key);

  final storeController = Get.put(StoreController());

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color(0xFFECECEC),
      child: Obx(
        () => Scaffold(
          backgroundColor: const Color(0xFFECECEC),
          body: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            controller: storeController.storeUiScrollController.value,
            slivers: <Widget>[
              SliverPersistentHeader(
                floating: false,
                pinned: true,
                delegate: _SliverPersistentHeaderDelegate(
                  maxHeight: 700.h + AppBar().preferredSize.height,
                  minHeight: 200.h + AppBar().preferredSize.height,
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    const StoreTitleWidget(),
                    const StoreDetailWidget(),
                    RoomListWidget(),
                  ],
                ),
              ),
              SliverPersistentHeader(
                floating: false,
                pinned: true,
                delegate: _SliverTabBarDelegate(
                  TabBar(
                    unselectedLabelColor: const Color(0xFFB8B8B8),
                    labelPadding: EdgeInsets.symmetric(horizontal: 100.w),
                    onTap: storeController.onCategorySelected,
                    controller: storeController.tabController.value,
                    labelColor: Colors.black,
                    indicator: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(5),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          spreadRadius: 0.2,
                          blurRadius: 1,
                          offset: Offset(0.3, 0.3),
                        ),
                      ],
                    ),
                    isScrollable: true,
                    tabs: storeController.tabs
                        .map(
                          (e) => Container(
                            height: 130.h,
                            padding: EdgeInsets.only(
                              top: 30.h,
                            ),
                            child: Text(
                              e.category.name,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 55.sp,
                                fontFamily: 'Core_Gothic_D5',
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final item = storeController.items[index];

                    if (item.isCategory) {
                      return MenuCategoryItem(category: item.category);
                    } else if (item.product?.index == 20) {
                      return MenuProductItem(
                        product: item.product,
                        isLast: true,
                      );
                    } else {
                      return MenuProductItem(
                        product: item.product,
                        isLast: false,
                      );
                    }
                  },
                  childCount: storeController.items.length,
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    const Precaution(),
                  ],
                ),
              ),
            ],
          ),
          floatingActionButton: storeController.count.value >= 1
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    AnimatedOpacity(
                      duration: const Duration(
                          milliseconds: 100), //show/hide animation
                      opacity: storeController.showbtn.value
                          ? 1.0
                          : 0.0, //set obacity to 1 on visible, or hide
                      child: SizedBox(
                        width: 200.w,
                        height: 200.h,
                        child: FittedBox(
                          child: FloatingActionButton(
                            elevation: 0,
                            heroTag: "scrollUp",
                            backgroundColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            onPressed: () {
                              storeController.storeUiScrollController.value
                                  .animateTo(
                                      //go to top of scroll
                                      0, //scroll offset to go
                                      duration: const Duration(
                                          milliseconds:
                                              300), //duration of scroll
                                      curve: Curves.fastOutSlowIn //scroll type
                                      );
                            },
                            child: Image.asset(
                              "assets/icons/scrollToTop.png",
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 50.h,
                    ),
                    AnimatedOpacity(
                      duration: const Duration(
                          milliseconds: 100), //show/hide animation
                      opacity: storeController.count.value >= 1 ? 1.0 : 0.0,
                      child: Badge(
                        badgeColor: Colors.white,
                        borderRadius: BorderRadius.circular(40),
                        badgeContent: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(
                            storeController.count.value.toString(),
                            style: const TextStyle(color: Color(0xFFFF8800)),
                          ),
                        ),
                        position:
                            BadgePosition.bottomEnd(bottom: -20.h, end: 10.w),
                        child: SizedBox(
                          width: 200.w,
                          height: 200.h,
                          child: FittedBox(
                            child: FloatingActionButton(
                              elevation: 0,
                              heroTag: "shoppingBasket",
                              backgroundColor: Colors.transparent,
                              onPressed: () => Get.toNamed(
                                  '/store=${storeController.storeIdx}/storeOrder'),
                              tooltip: 'Increment',
                              child: Image.asset(
                                "assets/icons/shoppingBasket.png",
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              : AnimatedOpacity(
                  duration:
                      const Duration(milliseconds: 100), //show/hide animation
                  opacity: storeController.showbtn.value
                      ? 1.0
                      : 0.0, //set obacity to 1 on visible, or hide
                  child: SizedBox(
                    width: 200.w,
                    height: 200.h,
                    child: FittedBox(
                      child: FloatingActionButton(
                        elevation: 0,
                        heroTag: "scrollUp",
                        backgroundColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        onPressed: () {
                          storeController.storeUiScrollController.value
                              .animateTo(
                                  //go to top of scroll
                                  0, //scroll offset to go
                                  duration: const Duration(
                                      milliseconds: 300), //duration of scroll
                                  curve: Curves.fastOutSlowIn //scroll type
                                  );
                        },
                        child: Image.asset(
                          "assets/icons/scrollToTop.png",
                        ),
                      ),
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}

class _SliverPersistentHeaderDelegate extends SliverPersistentHeaderDelegate {
  _SliverPersistentHeaderDelegate({
    required this.maxHeight,
    required this.minHeight,
  });

  final double maxHeight;
  final double minHeight;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return ConstrainedBox(
      constraints: const BoxConstraints.expand(),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            bottom: 0.0,
            left: 0.0,
            right: 0.0,
            top: 0.0,
            child: Container(
              width: 1440.w,
              decoration: BoxDecoration(
                color: const Color(0xFFFFFFFF),
                image: DecorationImage(
                  opacity: titleOpacity(shrinkOffset),
                  image: const AssetImage("assets/icons/ch2.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            top: AppBar().preferredSize.height,
            child: SizedBox(
              height: 200.h,
              width: 1440.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Image.asset(
                      "assets/icons/back.png",
                      color: Color.lerp(
                        const Color(0xFF333333),
                        const Color(0xFFFFFFFF),
                        titleOpacity(shrinkOffset),
                      ),
                      width: 80.w,
                      height: 60.h,
                    ),
                    onPressed: () => Get.back(),
                  ),
                  Expanded(
                    child: Text(
                      "교촌치킨 약수점",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: Color.lerp(
                          const Color(0xFF333333),
                          const Color(0x00FFFFFF),
                          titleOpacity(shrinkOffset),
                        ),
                        fontSize: 60.sp,
                        fontFamily: 'Core_Gothic_D6',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Image.asset(
                      "assets/icons/heart.png",
                      color: Color.lerp(
                        const Color(0xFFFF2659),
                        const Color(0xFFFFFFFF),
                        titleOpacity(shrinkOffset),
                      ),
                      width: 80.w,
                      height: 80.h,
                    ),
                    onPressed: () => {},
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  OverScrollHeaderStretchConfiguration get stretchConfiguration =>
      OverScrollHeaderStretchConfiguration();

  double titleOpacity(double shrinkOffset) {
    return 1.0 - max(0.0, shrinkOffset) / maxExtent;
  }

  @override
  double get maxExtent => maxHeight;

  @override
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}

class _SliverTabBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverTabBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => 137.h;

  @override
  double get maxExtent => 137.h;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      decoration: BoxDecoration(
          border: Border(top: BorderSide(color: Colors.grey.shade200)),
          color: const Color(0xFFF8F8F8)),
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverTabBarDelegate oldDelegate) {
    return false;
  }
}

class StoreTitleWidget extends StatelessWidget {
  const StoreTitleWidget({Key? key}) : super(key: key);

  // final double expandedHeight;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(bottom: BorderSide(color: Colors.grey.shade200)),
      ),
      width: 1440.w,
      height: 330.h,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "교촌치킨 약수점",
            style: TextStyle(
              color: const Color(0xFF333333),
              fontSize: 80.sp,
              fontFamily: 'Core_Gothic_D6',
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          InkWell(
            onTap: () {},
            child: SizedBox(
              width: 327.w,
              height: 69.h,
              child: Row(
                children: [
                  Image.asset(
                    "assets/icons/favorite.png",
                    width: 50.w,
                    height: 50.h,
                  ),
                  SizedBox(
                    width: 20.w,
                  ),
                  Text(
                    "4.5(159)",
                    style: TextStyle(
                      color: const Color(0xFF333333),
                      fontSize: 50.sp,
                      fontFamily: 'Core_Gothic_D5',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    width: 20.w,
                  ),
                  Image.asset(
                    "assets/icons/details.png",
                    width: 20.w,
                    height: 40.h,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class StoreDetailWidget extends StatelessWidget {
  const StoreDetailWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(color: Colors.grey.shade200),
        ),
      ),
      width: 1440.w,
      height: 464.h,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {},
            child: SizedBox(
              height: 60.h,
              width: 1200.w,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "배달비",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: const Color(0xFFFF8800),
                      fontSize: 50.sp,
                      fontFamily: 'Core_Gothic_D5',
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  SizedBox(
                    width: 96.w,
                  ),
                  Text(
                    "2000원 ~",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: const Color(0xFF333333),
                      fontSize: 50.sp,
                      fontFamily: 'Core_Gothic_D5',
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  SizedBox(
                    width: 70.w,
                  ),
                  Image.asset(
                    "assets/icons/details.png",
                    width: 20.w,
                    height: 40.h,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 40.h,
          ),
          SizedBox(
            height: 60.h,
            width: 1200.w,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "최소주문",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: const Color(0xFFFF8800),
                    fontSize: 50.sp,
                    fontFamily: 'Core_Gothic_D5',
                    fontWeight: FontWeight.w300,
                  ),
                ),
                SizedBox(
                  width: 50.w,
                ),
                Text(
                  "18000원",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: const Color(0xFF333333),
                    fontSize: 50.sp,
                    fontFamily: 'Core_Gothic_D5',
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 40.h,
          ),
          SizedBox(
            height: 60.h,
            width: 1200.w,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "배달시간",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: const Color(0xFFFF8800),
                    fontSize: 50.sp,
                    fontFamily: 'Core_Gothic_D5',
                    fontWeight: FontWeight.w300,
                  ),
                ),
                SizedBox(
                  width: 50.w,
                ),
                Text(
                  "21분 ~ 30분",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: const Color(0xFF333333),
                    fontSize: 50.sp,
                    fontFamily: 'Core_Gothic_D5',
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 40.h,
          ),
          InkWell(
            onTap: () {},
            child: SizedBox(
              height: 60.h,
              width: 1200.w,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "매장정보",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: const Color(0xFF8A8A8A),
                      fontSize: 50.sp,
                      fontFamily: 'Core_Gothic_D5',
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  SizedBox(
                    width: 50.w,
                  ),
                  Image.asset(
                    "assets/icons/details.png",
                    width: 20.w,
                    height: 40.h,
                    color: const Color(0xFF8A8A8A),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class RoomListWidget extends StatelessWidget {
  RoomListWidget({Key? key}) : super(key: key);

  final StoreController _controller = Get.put(StoreController());

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          SizedBox(
            height: 48.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 100.w,
              ),
              Text(
                "너만 기다리고 있어! ",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 70.sp,
                  fontFamily: 'Core_Gothic_D7',
                  fontWeight: FontWeight.bold,
                ),
              ),
              Image.asset(
                "assets/icons/emoji.png",
                width: 80.w,
                height: 80.h,
              ),
            ],
          ),
          SizedBox(
            height: 50.h,
          ),
          CarouselSlider(
            items: _controller.roomInfos.map(
              (data) {
                return Builder(
                  builder: (BuildContext context) {
                    return RoomCard(
                      roomInfo: data,
                    );
                  },
                );
              },
            ).toList(),
            options: CarouselOptions(
              height: 380.h,
              enableInfiniteScroll: false,
              enlargeCenterPage: false,
              viewportFraction: 0.87,
            ),
          ),
          SizedBox(
            height: 110.h,
          ),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class RoomCard extends StatelessWidget {
  dynamic roomInfo;

  RoomCard({required this.roomInfo, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.toNamed("/room=1"),
      child: Container(
        margin: EdgeInsets.all(10.w),
        height: 350.h,
        width: 1200.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          // color: const Color(0xFFF9F9F9),
          color: const Color(0xFFF8F8F8),
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              spreadRadius: 0.1,
              blurRadius: 5,
              offset: Offset(0.3, 0.3),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 5),
              child: Container(
                width: 260.w,
                height: 260.h,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: Image.asset(
                  roomInfo['img'],
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 50.h,
                ),
                Text(
                  roomInfo['user'],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 60.sp,
                    fontFamily: 'Core_Gothic_D6',
                  ),
                ),
                SizedBox(
                  height: 52.h,
                ),
                Text(
                  '배달위치',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: const Color(0xFFACACAC),
                    fontSize: 35.sp,
                    fontFamily: 'Core_Gothic_D4',
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  roomInfo['address'],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 40.sp,
                    fontFamily: 'Core_Gothic_D5',
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                SizedBox(
                  height: 50.h,
                ),
                Container(
                  width: 210.w,
                  height: 70.h,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(36),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        spreadRadius: 0.01,
                        blurRadius: 1,
                        offset: Offset(0.5, 0.5),
                      ),
                    ],
                  ),
                  child: Container(
                    alignment: Alignment.center,
                    child: TweenAnimationBuilder<Duration>(
                      duration: const Duration(minutes: 3),
                      tween: Tween(
                        begin: const Duration(minutes: 3),
                        end: Duration.zero,
                      ),
                      builder: (BuildContext context, Duration value,
                          Widget? child) {
                        final minutes =
                            value.inMinutes.toString().padLeft(2, '0');
                        final seconds =
                            (value.inSeconds % 60).toString().padLeft(2, '0');
                        return Text(
                          '$minutes:$seconds',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 40.sp,
                            fontFamily: 'Core_Gothic_D5',
                          ),
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 131.h,
                ),
                Container(
                  width: 280.w,
                  height: 50.h,
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFB300),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(25),
                    ),
                    border: Border.all(
                      color: const Color(0xFFFFB300),
                    ),
                  ),
                  child: StepProgressIndicator(
                    padding: 1,
                    totalSteps: 4,
                    currentStep: 3,
                    size: 40.h,
                    selectedColor: const Color(0xFFFF4E00),
                    unselectedColor: const Color(0xFFFFFFFF),
                    roundedEdges: const Radius.circular(10),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class MenuCategoryItem extends StatelessWidget {
  const MenuCategoryItem({Key? key, required this.category}) : super(key: key);
  final StoreCategory? category;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: categoryHeight.value,
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Text(
          category!.name,
          style: TextStyle(
            color: const Color(0xFF333333),
            fontSize: 55.sp,
            fontFamily: 'Core_Gothic_D5',
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class MenuProductItem extends StatelessWidget {
  MenuProductItem({Key? key, required this.product, required this.isLast})
      : super(key: key);

  final storeController = Get.put(StoreController());

  final StoreProduct? product;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(
            '/store=${storeController.storeIdx}/storeMenuDetail=${product?.index}');
        storeController.onInitStoreMenuDetailUI();
      },
      child: Container(
        color: Colors.white,
        height: productHeight.value,
        child: Padding(
          padding: const EdgeInsets.all(7),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product!.name,
                          style: TextStyle(
                            color: const Color(0xFF333333),
                            fontSize: 60.sp,
                            fontFamily: 'Core_Gothic_D5',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "\$${product!.price.toString()}",
                          style: TextStyle(
                            color: const Color(0xFF333333),
                            fontSize: 50.sp,
                            fontFamily: 'Core_Gothic_D5',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          product!.decsription,
                          style: TextStyle(
                            color: const Color(0xFF333333),
                            fontSize: 45.sp,
                            fontFamily: 'Core_Gothic_D4',
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      "assets/icons/ch.png",
                      width: 300.w,
                      height: 300.h,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
              if (!isLast)
                const Divider(
                  thickness: 1,
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class Precaution extends StatelessWidget {
  const Precaution({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        color: const Color(0xFFECECEC),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30.h),
            Text(
              "유의사항",
              style: TextStyle(
                color: const Color(0xFF333333),
                fontSize: 50.sp,
                fontFamily: 'Core_Gothic_D5',
              ),
            ),
            SizedBox(height: 30.h),
            Text(
              "* 메뉴 사진은 연출된 이미지로 실제 조리된 음식과 다를 수 있습니다.",
              style: TextStyle(
                color: const Color(0xFF333333),
                fontSize: 45.sp,
                fontFamily: 'Core_Gothic_D4',
              ),
            ),
            SizedBox(height: 20.h),
            Text(
              "* 상단 메뉴 및 가격은 업소에서 제공한 정보를 기준으로 작성되었으며 \n 변동될 수 있습니다.",
              style: TextStyle(
                color: const Color(0xFF333333),
                fontSize: 45.sp,
                fontFamily: 'Core_Gothic_D4',
              ),
            ),
            SizedBox(height: 500.h),
          ],
        ),
      ),
    );
  }
}
