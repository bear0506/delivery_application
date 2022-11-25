import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:carousel_slider/carousel_slider.dart';

import 'package:delivery_service/app/controller/home/home_controller.dart';
import 'package:delivery_service/app/controller/room/room_controller.dart';

class RoomHorizontalListUi extends GetView<RoomController> {
  RoomHorizontalListUi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 165.h),
            child: Container(
              width: 500.w,
              height: 30.h,
              color: const Color(0xFFFF8800),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 80.h,
              left: 100.w,
            ),
            child: Text(
              "우리 건물에 어떤 주문이?",
              style: TextStyle(
                color: Colors.black,
                fontSize: 80.sp,
                fontFamily: 'Core_Gothic_D7',
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 270.h,
              bottom: 80.h,
            ),
            child: CarouselSlider(
              items: controller.rooms.map(
                (data) {
                  return Builder(
                    builder: (BuildContext context) {
                      return InkWell(
                        onTap: () => {
                          Get.toNamed("/room=${data.idx}"),
                          controller.handleRoomProvider()
                        },
                        child: Container(
                          margin: EdgeInsets.all(10.h),
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 0.3,
                                blurRadius: 5.5,
                                offset: const Offset(0.6, 0.6),
                              ),
                            ],
                            borderRadius:
                                const BorderRadius.all(Radius.circular(30)),
                          ),
                          child: Stack(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage("assets/icons/c.png"),
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(30)),
                                  color: Colors.black,
                                ),
                                width: 600.w,
                                height: 600.h,
                              ),
                              Positioned(
                                bottom: 0.h,
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.only(
                                      bottomLeft: Radius.circular(30),
                                      bottomRight: Radius.circular(30),
                                    ),
                                    color: Colors.grey.withOpacity(0.8),
                                  ),
                                  width: 600.w,
                                  height: 205.h,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        color: Color(0xFFFF7700),
                                        width: 600.w,
                                        height: 5.h,
                                      ),
                                      SizedBox(height: 30.h),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 40.w),
                                        child: Text(
                                          '${data.storeName}',
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 50.sp,
                                            fontFamily: 'Core_Gothic_D5',
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 20.h),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 40.w),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              '${data.memName}',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 40.sp,
                                                fontFamily: 'Core_Gothic_D4',
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(right: 10.w),
                                              child: Row(
                                                children: List.generate(
                                                  data.maximumNum,
                                                  (index) => Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 5.w),
                                                    child: Image.asset(
                                                      "assets/icons/person.png",
                                                      color: index <
                                                              data.currentNum
                                                          ? Color(0xFFFF7700)
                                                          : Color(0xFFFFFFFF),
                                                      width: 40.w,
                                                      height: 40.h,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              // Padding(
                              //   padding: EdgeInsets.only(top: 400.h),
                              //   child: Container(
                              //     color: const Color(0xFFFF7700),
                              //     width: 600.w,
                              //     height: 8.h,
                              //   ),
                              // ),
                              // Padding(
                              //   padding: EdgeInsets.only(top: 408.h),
                              //   child: Container(
                              //     decoration: BoxDecoration(
                              //       borderRadius: const BorderRadius.only(
                              //         bottomLeft: Radius.circular(30),
                              //         bottomRight: Radius.circular(30),
                              //       ),
                              //       color: Colors.grey.withOpacity(0.8),
                              //     ),
                              //     width: 600.w,
                              //     height: 200.h,
                              //   ),
                              // ),
                              // Positioned(
                              //   bottom: 100.h,
                              //   child: Text(
                              //     '${data.storeName}',
                              //     style: TextStyle(
                              //       color: Colors.white,
                              //       fontSize: 50.sp,
                              //       fontFamily: 'Core_Gothic_D5',
                              //     ),
                              //   ),
                              // ),
                              // Padding(
                              //   padding: EdgeInsets.only(
                              //     top: 520.h,
                              //     left: 50.w,
                              //   ),
                              //   child: Text(
                              //     '${data.memName}',
                              //     style: TextStyle(
                              //       color: Colors.white,
                              //       fontSize: 40.sp,
                              //       fontFamily: 'Core_Gothic_D4',
                              //     ),
                              //   ),
                              // ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ).toList(),
              options: CarouselOptions(
                height: 600.h,
                // aspectRatio: 16 / 9,
                enlargeCenterPage: true,
                viewportFraction: 0.45,
              ),
            ),
          )
        ],
      ),
    );
  }
}
