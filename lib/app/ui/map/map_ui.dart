import 'package:delivery_service/app/controller/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:convert';

import 'package:kakaomap_webview/kakaomap_webview.dart';

import 'package:delivery_service/app/controller/map/map_controller.dart';
import 'package:webview_flutter/webview_flutter.dart';

// const String kakaoMapKey = 'f764cf6bd69b199f8d3676d70ae1f777';

// ignore: must_be_immutable, use_key_in_widget_constructors
class MapUi extends GetView<MapController> {
  // ignore: prefer_typing_uninitialized_variables, unused_field
  final MapController mapController = Get.put(MapController());
  final HomeController homeController = Get.put(HomeController());
  // late WebViewController mapWebViewController;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => KakaoMapView(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        kakaoMapKey: mapController.kakaoMapKey.value,
        lat: controller.mapLat.value,
        lng: controller.mapLng.value,
        showMapTypeControl: false,
        showZoomControl: false,
        markerImageURL:
            'https://t1.daumcdn.net/localimg/localimages/07/2012/img/marker_p.png',
        customScript:
            '''

                    kakao.maps.event.addListener(map, 'click', function() {
                      onTapMap.postMessage("Close!");
                    });
                    
                    kakao.maps.load(function() {
                      onGetMessage.postMessage("COMPLETE");
                    });
                    
                ''',
        mapController: (controller) {
          // mapWebViewController = controller;
          mapController.initWebViewController(controller);
        },
        zoomChanged: (message) {
          debugPrint('current zoom level : ${message.message}');
        },
        onTapMarker: (message) async {
          var tempMessage = message.message;

          homeController.TurnOnMapModal(int.parse(tempMessage));
        },
        onTapMap: (message) async {
          var tempMessage = message.message;

          homeController.TurnOffMapModal();
        },
        onGetMessage: (message) async {
          if (message.message == "COMPLETE") {
            mapController.handleRoomAllProvider();
          }
        },
      ),
    );
  }

  // void reloadWebView() {
  //   mapWebViewController?.reload();
  // }
}
