import 'package:get/get.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:delivery_service/app/controller/room/room_controller.dart';

class RoomResultUi extends GetView<RoomController> {
  const RoomResultUi({Key? key}) : super(key: key);

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
                pinned: controller.temptemp.value,
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
                        // onPressed: () => Get.toNamed('/main'),
                        onPressed: () => Get.offAllNamed('/main'),
                      ),
                      SizedBox(
                        width: 20.w,
                      ),
                      Expanded(
                        child: Text(
                          "주문완료",
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
                  NoticeMent(),
                  // OrderList(),
                  OrderContent(),
                  Notice(),
                  Divider(
                    color: Color(0xFFECECEC),
                    thickness: 5,
                  ),
                  OrderTime(),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: const BottomOutlinedButtonWidget(),
    );
  }
}

class NoticeMent extends StatelessWidget {
  const NoticeMent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 100.w,
        top: 80.h,
      ),
      width: 1440.w,
      height: 240.h,
      child: Text(
        "방만들기가 완료되었습니다.",
        textAlign: TextAlign.left,
        style: TextStyle(
          color: const Color(0xFF333333),
          fontSize: 60.sp,
          fontFamily: 'Core_Gothic_D7',
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

// class OrderList extends StatefulWidget {
//   const OrderList({Key? key}) : super(key: key);

//   @override
//   State<OrderList> createState() => _OrderListState();
// }

// class _OrderListState extends State<OrderList> {
//   final listKey = GlobalKey<AnimatedListState>();
//   final List<ListItem> items = List.from(listItems);

//   void removeItem(int index) {
//     final removedItem = items[index];

//     items.removeAt(index);
//     listKey.currentState!.removeItem(
//       index,
//       (context, animation) => ListItemWidget(
//         item: removedItem,
//         animation: animation,
//         onClicked: () {},
//       ),
//       duration: const Duration(
//         milliseconds: 200,
//       ),
//     );
//   }

//   void insertItem() {
//     final newIndex = items.length;
//     final newItem = (List.of(listItems)..shuffle()).first;

//     items.insert(newIndex, newItem);
//     listKey.currentState!.insertItem(
//       newIndex,
//       duration: const Duration(
//         milliseconds: 200,
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       constraints: const BoxConstraints(
//         maxHeight: double.infinity,
//       ),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           AnimatedList(
//             physics: const NeverScrollableScrollPhysics(),
//             shrinkWrap: true,
//             key: listKey,
//             initialItemCount: items.length,
//             itemBuilder: (context, index, animation) => ListItemWidget(
//               item: items[index],
//               animation: animation,
//               onClicked: () => removeItem(index),
//             ),
//           ),
//           TextButton(
//             onPressed: () => insertItem(),
//             style: TextButton.styleFrom(
//               splashFactory: NoSplash.splashFactory,
//             ),
//             child: Text(
//               "+ 메뉴 추가하기",
//               style: TextStyle(
//                 color: const Color(0xFFFF8800),
//                 fontSize: 50.sp,
//                 fontFamily: 'Core_Gothic_D5',
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class ListItemWidget extends StatefulWidget {
//   final ListItem item;
//   final Animation<double> animation;
//   final VoidCallback? onClicked;

//   const ListItemWidget({
//     Key? key,
//     required this.item,
//     required this.animation,
//     required this.onClicked,
//   }) : super(key: key);

//   @override
//   State<ListItemWidget> createState() => _ListItemWidgetState();
// }

// class _ListItemWidgetState extends State<ListItemWidget> {
//   int n = 1;

//   void add() {
//     setState(() {
//       n++;
//     });
//   }

//   void minus() {
//     if (n > 1) {
//       setState(() {
//         n--;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) => SizeTransition(
//         sizeFactor: widget.animation,
//         child: SizedBox(
//           height: 360.h,
//           child: Padding(
//             padding: EdgeInsets.only(
//               left: 100.w,
//               right: 100.w,
//             ),
//             child: Column(
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     Text(
//                       widget.item.title,
//                       style: TextStyle(
//                         color: const Color(0xFF333333),
//                         fontSize: 60.sp,
//                         fontFamily: 'Core_Gothic_D5',
//                       ),
//                     ),
//                     IconButton(
//                       splashColor: Colors.transparent,
//                       highlightColor: Colors.transparent,
//                       onPressed: widget.onClicked,
//                       icon: Image.asset(
//                         "assets/icons/x2.png",
//                         width: 30.w,
//                         height: 30.h,
//                       ),
//                     )
//                   ],
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     Text(
//                       widget.item.price,
//                       style: TextStyle(
//                         color: const Color(0xFF333333),
//                         fontSize: 60.sp,
//                         fontFamily: 'Core_Gothic_D5',
//                       ),
//                     ),
//                     SizedBox(
//                       width: 380.w,
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           SizedBox(
//                             width: 120.w,
//                             height: 120.h,
//                             child: IconButton(
//                               splashColor: Colors.transparent,
//                               highlightColor: Colors.transparent,
//                               onPressed: minus,
//                               icon: Image.asset(
//                                 "assets/icons/minus1.png",
//                                 width: 80.w,
//                                 height: 80.h,
//                               ),
//                             ),
//                           ),
//                           Text(
//                             "$n",
//                             style: TextStyle(
//                               color: const Color(0xFF333333),
//                               fontSize: 60.sp,
//                               fontFamily: 'Core_Gothic_D5',
//                             ),
//                           ),
//                           SizedBox(
//                             width: 120.w,
//                             height: 120.h,
//                             child: IconButton(
//                               splashColor: Colors.transparent,
//                               highlightColor: Colors.transparent,
//                               onPressed: add,
//                               icon: Image.asset(
//                                 "assets/icons/plus1.png",
//                                 width: 80.w,
//                                 height: 80.h,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//                 const Divider(
//                   color: Color(0xFFECECEC),
//                   thickness: 1,
//                 )
//               ],
//             ),
//           ),
//         ),
//       );
// }

class OrderContent extends StatefulWidget {
  const OrderContent({Key? key}) : super(key: key);

  @override
  State<OrderContent> createState() => _OrderContentState();
}

class _OrderContentState extends State<OrderContent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 100.w,
      ),
      color: const Color(0xFFF2F2F2),
      width: 1440.w,
      height: 420.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "교촌치킨 약수점",
                style: TextStyle(
                  color: const Color(0xFF333333),
                  fontSize: 60.sp,
                  fontFamily: 'Core_Gothic_D5',
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                "서울 중구 퇴계로36길 2 910호",
                style: TextStyle(
                  color: const Color(0xFF333333),
                  fontSize: 45.sp,
                  fontFamily: 'Core_Gothic_D5',
                ),
              ),
              SizedBox(
                height: 60.h,
              ),
              Text(
                "58,000원",
                style: TextStyle(
                  color: const Color(0xFF333333),
                  fontSize: 45.sp,
                  fontFamily: 'Core_Gothic_D5',
                ),
              ),
            ],
          ),
          Image.asset(
            "assets/icons/c.png",
            width: 300.w,
            height: 300.h,
          ),
        ],
      ),
    );
  }
}

class Notice extends StatelessWidget {
  const Notice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 1440.w,
      height: 302.h,
      child: Padding(
        padding: EdgeInsets.only(
          left: 100.w,
          top: 60.h,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "예상 배달 시간",
              style: TextStyle(
                color: const Color(0xFFB8B8B8),
                fontSize: 50.sp,
                fontFamily: 'Core_Gothic_D4',
              ),
            ),
            Text(
              "21분",
              style: TextStyle(
                color: const Color(0xFF333333),
                fontSize: 60.sp,
                fontFamily: 'Core_Gothic_D5',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OrderTime extends StatelessWidget {
  const OrderTime({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 1440.w,
      height: 300.h,
      child: Padding(
        padding: EdgeInsets.only(
          left: 100.w,
          top: 60.h,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "주문 시간",
              style: TextStyle(
                color: const Color(0xFFB8B8B8),
                fontSize: 50.sp,
                fontFamily: 'Core_Gothic_D4',
              ),
            ),
            Text(
              "16:51",
              style: TextStyle(
                color: const Color(0xFF333333),
                fontSize: 60.sp,
                fontFamily: 'Core_Gothic_D5',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BottomOutlinedButtonWidget extends StatelessWidget {
  const BottomOutlinedButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: 150.h,
        left: 100.w,
        right: 100.w,
      ),
      child: SizedBox(
        width: 1240.w,
        height: 200.h,
        child: OutlinedButton(
          // onPressed: () => Get.toNamed('/main'),
          onPressed: () => Get.offAllNamed('/main'),
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
            "홈으로",
            style: TextStyle(
              color: Colors.white,
              fontSize: 70.sp,
              fontFamily: 'Core_Gothic_D5',
            ),
          ),
        ),
      ),
    );
  }
}
