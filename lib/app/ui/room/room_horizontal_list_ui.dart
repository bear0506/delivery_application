import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:carousel_slider/carousel_slider.dart';

import 'package:delivery_service/app/controller/home/home_controller.dart';

class RoomHorizontalListUi extends GetView<HomeController> {
  RoomHorizontalListUi({Key? key}) : super(key: key);

  final HomeController _controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Stack(
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
            items: _controller.roomInfos.map(
              (data) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
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
                                image: AssetImage(data['img']),
                                fit: BoxFit.cover,
                              ),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(30)),
                              color: Colors.black,
                            ),
                            width: 600.w,
                            height: 600.h,
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 400.h),
                            child: Container(
                              color: const Color(0xFFFF7700),
                              width: 600.w,
                              height: 8.h,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 408.h),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(30),
                                    bottomRight: Radius.circular(30),
                                  ),
                                  color: Colors.grey.withOpacity(0.8)),
                              width: 600.w,
                              height: 200.h,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              top: 430.h,
                              left: 50.w,
                            ),
                            child: Text(
                              '${data['name']}',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 50.sp,
                                fontFamily: 'Core_Gothic_D5',
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              top: 520.h,
                              left: 50.w,
                            ),
                            child: Text(
                              '${data['user']}',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 40.sp,
                                fontFamily: 'Core_Gothic_D4',
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ).toList(),
            options: CarouselOptions(
              height: 600.h,
              enlargeCenterPage: true,
              viewportFraction: 0.45,
              aspectRatio: 8 / 3,
            ),
          ),
        )
      ],
    );
  }
}
