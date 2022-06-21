import 'package:get/get.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:delivery_service/app/controller/home/home_controller.dart';

class StoreCategoryListUi extends GetView<HomeController> {
  const StoreCategoryListUi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 1300.h,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              StoreCategory("assets/icons/all.png", "전체"),
              StoreCategory("assets/icons/korean.png", "한식"),
              StoreCategory("assets/icons/snackbar.png", "분식"),
              StoreCategory("assets/icons/chicken.png", "치킨"),
              StoreCategory("assets/icons/pizza.png", "피자"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              StoreCategory("assets/icons/porkcutlets.png", "돈가스"),
              StoreCategory("assets/icons/porkfeet.png", "족/보"),
              StoreCategory("assets/icons/steambath.png", "찜/탕"),
              StoreCategory("assets/icons/grilled.png", "구이"),
              StoreCategory("assets/icons/chinese.png", "중식"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              StoreCategory("assets/icons/japanese.png", "일식"),
              StoreCategory("assets/icons/sashimiseafood.png", "회/해물"),
              StoreCategory("assets/icons/western.png", "양식"),
              StoreCategory("assets/icons/cafe.png", "카페"),
              StoreCategory("assets/icons/dessert.png", "디저트"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              StoreCategory("assets/icons/asian.png", "아시안"),
              StoreCategory("assets/icons/sandwich.png", "샌드위치"),
              StoreCategory("assets/icons/burger.png", "버거"),
              StoreCategory("assets/icons/mexican.png", "멕시칸"),
              StoreCategory("assets/icons/bento.png", "도시락"),
            ],
          ),
        ],
      ),
    );
  }
}

class StoreCategory extends GetView<HomeController> {
  final String iconAsset;
  final String name;

  const StoreCategory(this.iconAsset, this.name, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.toNamed("/home/storeList=1"),
      borderRadius: BorderRadius.circular(20),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
          padding: const EdgeInsets.only(top: 10),
          width: 200.w,
          height: 225.h,
          decoration: BoxDecoration(
            color: const Color(0xFFF9F9F9),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                iconAsset,
                width: 100.w,
                height: 100.h,
              ),
              SizedBox(
                height: 19.h,
              ),
              Text(
                name,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 40.sp,
                  fontFamily: 'Core_Gothic_D7',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
