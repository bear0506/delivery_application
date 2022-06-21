import 'package:delivery_service/app/controller/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'dart:async';

import 'package:kakaomap_webview/kakaomap_webview.dart';

import 'package:delivery_service/app/controller/map/map_controller.dart';
import 'package:webview_flutter/webview_flutter.dart';

// const String kakaoMapKey = 'f764cf6bd69b199f8d3676d70ae1f777';

// ignore: must_be_immutable, use_key_in_widget_constructors
class MapUi extends GetView<MapController> {
  // ignore: prefer_typing_uninitialized_variables, unused_field
  final MapController _mapController = Get.put(MapController());
  final _homeController = Get.put(HomeController());
  // late WebViewController mapWebViewController;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => KakaoMapView(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        kakaoMapKey: _mapController.kakaoMapKey.value,
        lat: 37.560202,
        lng: 126.993718,
        showMapTypeControl: false,
        showZoomControl: false,
        markerImageURL:
            'https://t1.daumcdn.net/localimg/localimages/07/2012/img/marker_p.png',
        customScript: '''
                    var mapMarkers = '${jsonEncode(_mapController.roomsMap)}';
                    mapMarkers = JSON.parse(mapMarkers);

                    // 인포윈도우를 표시하는 클로저를 만드는 함수입니다
                    function makeOverListener(map, marker, infowindow) {
                        return function() {
                            // onTapMarker.postMessage(JSON.stringify(mapMarkers));
                            // onTapMarker.postMessage(marker.position);
                            infowindow.open(map, marker);
                        };
                    }

                    // 인포윈도우를 닫는 클로저를 만드는 함수입니다
                    function makeOutListener(infowindow) {
                        return function() {
                            infowindow.close();
                        };
                    }

                    kakao.maps.event.addListener(map, 'click', function() {
                      onTapMap.postMessage("Close!");
                    });

                    for(var i = 0; i < mapMarkers.length; i++){
                      var marker = new kakao.maps.Marker({
                          map: map, // 마커를 표시할 지도
                          position: eval(mapMarkers[i].latlng) // 마커의 위치
                      });

                      var infowindow = new kakao.maps.InfoWindow({
                          content: '<div>' + mapMarkers[i].title + '</div>' // 인포윈도우에 표시할 내용
                      });

                      kakao.maps.event.addListener(marker, 'click', function(num) {
                        return function() {
                          var tempTitle = mapMarkers[num].storeName;

                          onTapMarker.postMessage(tempTitle);
                        }
                      }(i));

                      // kakao.maps.event.addListener(marker, 'click', makeOverListener(map, marker, infowindow));
                    }
                ''',
        mapController: (controller) {
          // mapWebViewController = controller;
          _mapController.initwebViewController(controller);
        },
        zoomChanged: (message) {
          debugPrint('current zoom level : ${message.message}');
        },
        onTapMarker: (message) async {
          var tempMessage = '${message.message}';
          print(tempMessage);

          _homeController.TurnOnMapModal(int.parse(tempMessage));
        },
        onTapMap: (message) async {
          var tempMessage = '${message.message}';
          // print(tempMessage);

          _homeController.TurnOffMapModal();
        },
      ),
    );
  }

  // void reloadWebView() {
  //   mapWebViewController?.reload();
  // }
}
