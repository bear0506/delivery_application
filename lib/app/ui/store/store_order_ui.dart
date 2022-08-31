import 'package:delivery_service/app/controller/order/order_controller.dart';
import 'package:get/get.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:delivery_service/app/controller/store/store_controller.dart';
import 'package:delivery_service/app/controller/address/address_controller.dart';
import 'package:delivery_service/app/ui/store/store_order_list_item_data.dart';

class StoreOrderUi extends GetView<StoreController> {
  const StoreOrderUi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: NestedScrollView(
        physics: const ClampingScrollPhysics(),
        controller: controller.scrollController2.value,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            Obx(
              () => SliverAppBar(
                elevation: 0,
                expandedHeight: 200.h,
                collapsedHeight: 200.h,
                automaticallyImplyLeading: false,
                titleSpacing: 0,
                backgroundColor: Colors.white,
                pinned: controller.temptemptemp.value,
                title: Padding(
                  padding: EdgeInsets.only(
                    left: 50.w,
                    top: 50.h,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: Image.asset(
                          "assets/icons/x.png",
                          color: const Color(0xFF333333),
                          width: 60.w,
                          height: 60.h,
                        ),
                        onPressed: () => Get.back(),
                      ),
                      SizedBox(
                        width: 20.w,
                      ),
                      Expanded(
                        child: Text(
                          "주문하기",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: const Color(0xFF333333),
                            fontSize: 60.sp,
                            fontFamily: 'Core_Gothic_D5',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ];
        },
        body: Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.fromSwatch(
              accentColor: Colors.transparent,
            ),
          ),
          child: NotificationListener<OverscrollIndicatorNotification>(
            onNotification: (OverscrollIndicatorNotification? overscroll) {
              overscroll!.disallowIndicator();
              return true;
            },
            child: SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              child: Column(
                children: const [
                  SetAddress(),
                  Divider(
                    color: Color(0xFFECECEC),
                    thickness: 5,
                  ),
                  OrderList(),
                  Divider(
                    color: Color(0xFFECECEC),
                    thickness: 5,
                  ),
                  TotalPrice(),
                  Divider(
                    color: Color(0xFFECECEC),
                    thickness: 5,
                  ),
                  Notice(),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomOutlinedButtonWidget(),
    );
  }
}

class SetAddress extends GetView<StoreController> {
  const SetAddress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(Get.put(AddressController()).currentAddress.value.address +
        ", " +
        Get.put(AddressController()).currentAddress.value.detail);

    return Obx(
      () => Container(
        height: 310.h,
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 100.w,
            vertical: 40.h,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "배달 주소",
                style: TextStyle(
                  color: const Color(0xFFB8B8B8),
                  fontSize: 50.sp,
                  fontFamily: 'Core_Gothic_D4',
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    // Get.put(AddressController()).currentAddress.value.address +
                    //     ", " +
                    //     Get.put(AddressController())
                    //         .currentAddress
                    //         .value
                    //         .detail,
                    "ㅋㅋㅋㅋ",
                    style: TextStyle(
                      color: const Color(0xFF333333),
                      fontSize: 60.sp,
                      fontFamily: 'Core_Gothic_D5',
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      splashFactory: NoSplash.splashFactory,
                    ),
                    child: Text(
                      "변경",
                      style: TextStyle(
                        color: const Color(0xFFFF8800),
                        fontSize: 50.sp,
                        fontFamily: 'Core_Gothic_D5',
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OrderList extends StatefulWidget {
  const OrderList({Key? key}) : super(key: key);

  @override
  State<OrderList> createState() => _OrderListState();
}

class _OrderListState extends State<OrderList> {
  final listKey = GlobalKey<AnimatedListState>();
  final List<ListItem> items = List.from(listItems);

  void removeItem(int index) {
    final removedItem = items[index];

    items.removeAt(index);
    listKey.currentState!.removeItem(
      index,
      (context, animation) => ListItemWidget(
        item: removedItem,
        animation: animation,
        onClicked: () {},
      ),
      duration: const Duration(
        milliseconds: 200,
      ),
    );
  }

  void insertItem() {
    final newIndex = items.length;
    final newItem = (List.of(listItems)..shuffle()).first;

    items.insert(newIndex, newItem);
    listKey.currentState!.insertItem(
      newIndex,
      duration: const Duration(
        milliseconds: 200,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        maxHeight: double.infinity,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AnimatedList(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            key: listKey,
            initialItemCount: items.length,
            itemBuilder: (context, index, animation) => ListItemWidget(
              item: items[index],
              animation: animation,
              onClicked: () => removeItem(index),
            ),
          ),
          TextButton(
            onPressed: () => insertItem(),
            style: TextButton.styleFrom(
              splashFactory: NoSplash.splashFactory,
            ),
            child: Text(
              "+ 메뉴 추가하기",
              style: TextStyle(
                color: const Color(0xFFFF8800),
                fontSize: 50.sp,
                fontFamily: 'Core_Gothic_D5',
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ListItemWidget extends StatefulWidget {
  final ListItem item;
  final Animation<double> animation;
  final VoidCallback? onClicked;

  const ListItemWidget({
    Key? key,
    required this.item,
    required this.animation,
    required this.onClicked,
  }) : super(key: key);

  @override
  State<ListItemWidget> createState() => _ListItemWidgetState();
}

class _ListItemWidgetState extends State<ListItemWidget> {
  int n = 1;

  void add() {
    setState(() {
      n++;
    });
  }

  void minus() {
    if (n > 1) {
      setState(() {
        n--;
      });
    }
  }

  @override
  Widget build(BuildContext context) => SizeTransition(
        sizeFactor: widget.animation,
        child: SizedBox(
          height: 360.h,
          child: Padding(
            padding: EdgeInsets.only(
              left: 100.w,
              right: 100.w,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      widget.item.title,
                      style: TextStyle(
                        color: const Color(0xFF333333),
                        fontSize: 60.sp,
                        fontFamily: 'Core_Gothic_D5',
                      ),
                    ),
                    IconButton(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onPressed: widget.onClicked,
                      icon: Image.asset(
                        "assets/icons/x2.png",
                        width: 30.w,
                        height: 30.h,
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      widget.item.price,
                      style: TextStyle(
                        color: const Color(0xFF333333),
                        fontSize: 60.sp,
                        fontFamily: 'Core_Gothic_D5',
                      ),
                    ),
                    SizedBox(
                      width: 380.w,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 120.w,
                            height: 120.h,
                            child: IconButton(
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onPressed: minus,
                              icon: Image.asset(
                                "assets/icons/minus1.png",
                                width: 80.w,
                                height: 80.h,
                              ),
                            ),
                          ),
                          Text(
                            "$n",
                            style: TextStyle(
                              color: const Color(0xFF333333),
                              fontSize: 60.sp,
                              fontFamily: 'Core_Gothic_D5',
                            ),
                          ),
                          SizedBox(
                            width: 120.w,
                            height: 120.h,
                            child: IconButton(
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onPressed: add,
                              icon: Image.asset(
                                "assets/icons/plus1.png",
                                width: 80.w,
                                height: 80.h,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const Divider(
                  color: Color(0xFFECECEC),
                  thickness: 1,
                )
              ],
            ),
          ),
        ),
      );
}

class TotalPrice extends StatefulWidget {
  const TotalPrice({Key? key}) : super(key: key);

  @override
  State<TotalPrice> createState() => _TotalPriceState();
}

class _TotalPriceState extends State<TotalPrice> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 100.w,
        vertical: 60.h,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "주문금액",
                style: TextStyle(
                  color: const Color(0xFF333333),
                  fontSize: 60.sp,
                  fontFamily: 'Core_Gothic_D5',
                ),
              ),
              Text(
                "56,000원",
                style: TextStyle(
                  color: const Color(0xFF333333),
                  fontSize: 60.sp,
                  fontFamily: 'Core_Gothic_D5',
                ),
              ),
            ],
          ),
          SizedBox(
            height: 50.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "배달비",
                style: TextStyle(
                  color: const Color(0xFF333333),
                  fontSize: 60.sp,
                  fontFamily: 'Core_Gothic_D5',
                ),
              ),
              Text(
                "2,000원",
                style: TextStyle(
                  color: const Color(0xFF333333),
                  fontSize: 60.sp,
                  fontFamily: 'Core_Gothic_D5',
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
          const Divider(
            color: Color(0xFFECECEC),
            thickness: 1,
          ),
          SizedBox(
            height: 20.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "총 금액",
                style: TextStyle(
                  color: const Color(0xFF333333),
                  fontSize: 60.sp,
                  fontFamily: 'Core_Gothic_D6',
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "58,000원",
                style: TextStyle(
                  color: const Color(0xFF333333),
                  fontSize: 60.sp,
                  fontFamily: 'Core_Gothic_D6',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class Notice extends StatelessWidget {
  const Notice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 60.h,
        left: 100.w,
        right: 100.w,
      ),
      child: Text(
        "배달띱은 통신판매중개자로서 통신판매의 당사자가 아니며, 판매자가 등록\n한 상품 정보, 상품의 품질 및 거래에 대해서 일체의 책임을 지지 않습니다.\n 회원은 주문 내용을 확인하였고, 결제에 동의합니다.",
        style: TextStyle(
          color: const Color(0xFFB8B8B8),
          fontSize: 40.sp,
          fontFamily: 'Core_Gothic_D4',
        ),
      ),
    );
  }
}

class BottomOutlinedButtonWidget extends StatelessWidget {
  BottomOutlinedButtonWidget({Key? key}) : super(key: key);

  final storeController = Get.put(StoreController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: 150.h,
        left: 100.w,
        right: 100.w,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 700.w,
            height: 200.h,
            child: OutlinedButton(
              onPressed: () =>
                  Get.toNamed('/store=${storeController.storeIdx}/roomSetting'),
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Color(0xFFFF8800), width: 1),
                backgroundColor: const Color(0xFFFF8800),
                primary: Colors.white,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      50,
                    ),
                  ),
                ),
                elevation: 2,
                shadowColor: Colors.black,
              ),
              child: Text(
                "방 만들기",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 70.sp,
                  fontFamily: 'Core_Gothic_D5',
                ),
              ),
            ),
          ),
          SizedBox(
            width: 490.w,
            height: 200.h,
            child: OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Color(0xFFFF8800), width: 1),
                backgroundColor: Colors.white,
                primary: const Color(0xFFFF8800),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      50,
                    ),
                  ),
                ),
                elevation: 2,
                shadowColor: Colors.black,
              ),
              child: Text(
                "바로 주문",
                style: TextStyle(
                  color: const Color(0xFFFF8800),
                  fontSize: 70.sp,
                  fontFamily: 'Core_Gothic_D5',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
