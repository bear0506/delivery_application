import 'package:get/get.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:delivery_service/app/controller/address/address_controller.dart';
import 'package:intl/intl.dart';
import 'package:kpostal/kpostal.dart';

class AddressDetailUi extends GetView<AddressController> {
  AddressDetailUi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: NestedScrollView(
        physics: const ClampingScrollPhysics(),
        controller: controller.scrollController.value,
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
                pinned: true,
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
                          width: 80.w,
                          height: 60.h,
                        ),
                        onPressed: () => Get.back(),
                      ),
                      SizedBox(
                        width: 20.w,
                      ),
                      Expanded(
                        child: Text(
                          controller.temp2.value,
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: const Color(0xFF333333),
                            fontSize: 60.sp,
                            fontFamily: 'Core_Gothic_D6',
                            fontWeight: FontWeight.bold,
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
                children: [
                  // TimeInformation(),
                  // StoreInformation(),
                  Column(
                    children: [
                      SizedBox(height: 30.h),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 50.w),
                        width: 1240.w,
                        height: 140.h,
                        decoration: BoxDecoration(
                          color: Color(0xFFE0E0E0),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: InkWell(
                          onTap: () => Get.to(
                            () => KpostalView(
                              callback: (Kpostal result) {
                                print(result.address);
                                print(result.latitude.toString());
                                print(result.longitude.toString());
                              },
                            ),
                          ),
                          child: Row(
                            children: [
                              Image.asset(
                                "assets/icons/search.png",
                                color: const Color(0xFF333333),
                                width: 60.w,
                                height: 60.h,
                              ),
                              SizedBox(width: 50.w),
                              Text(
                                "지번, 도로명, 건물명으로 검색",
                                style: TextStyle(
                                  color: const Color(0xFFA1A1A1),
                                  fontSize: 55.sp,
                                  fontFamily: 'Core_Gothic_D5',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 60.h),
                    ],
                  ),
                  Container(
                    height: 20.h,
                    color: Color(0xFFECECEC),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      // bottomNavigationBar: const BottomOutlinedButtonWidget(),
    );
  }
}
