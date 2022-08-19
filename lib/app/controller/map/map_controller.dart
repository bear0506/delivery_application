import 'dart:convert';

import 'package:get/get.dart';

import 'package:delivery_service/app/data/provider/room/room_provider.dart';
import 'package:delivery_service/app/data/model/room/room_model.dart';

import 'package:delivery_service/main.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MapController extends GetxController {
  late RxList<RoomResponseModel> rooms = <RoomResponseModel>[].obs;
  late RxList<Map<String, dynamic>> roomsMap = <Map<String, dynamic>>[].obs;

  late Rx<WebViewController> webViewController;

  void initWebViewController(WebViewController controller) {
    webViewController = controller.obs;

    // handleRoomAllProvider();
  }

  RxString kakaoMapKey = 'f764cf6bd69b199f8d3676d70ae1f777'.obs;

  RxDouble mapLat = 37.560202.obs;
  RxDouble mapLng = 126.993718.obs;

  // 조회
  Future<void> handleRoomAllProvider() async {
    try {
      await RoomAllProvider().dio().then((value) {
        if (value.status == "success") {
          roomsMap.addAll(value.roomsMap);
          roomsMap.refresh();

          webViewController.value.runJavascript(
              '''
              var mapMarkers = '${jsonEncode(roomsMap)}';
              mapMarkers = JSON.parse(mapMarkers);

              for(var i = 0; i < mapMarkers.length; i++){
                var marker = new kakao.maps.Marker({
                    map: map, // 마커를 표시할 지도
                    position: eval(mapMarkers[i].latlng) // 마커의 위치
                });

                kakao.maps.event.addListener(marker, 'click', function(num) {
                  return function() {
                    var latlng = mapMarkers[num].latlng;
                    onTapMarker.postMessage(num);

                    map.panTo(eval(latlng));
                  }
                }(i));
              }
            ''');
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

  void setMapLatLng(double Lat, double Lng) {
    mapLat.value = Lat;
    mapLng.value = Lng;

    String mapLatLng = "new kakao.maps.LatLng(" +
        mapLat.toString() +
        ", " +
        mapLng.toString() +
        ")";

    webViewController.value
        .runJavascript('''
        map.setCenter($mapLatLng);
      ''');
  }

  @override
  // ignore: unnecessary_overrides
  void onInit() async {
    // await handleRoomAllProvider();

    super.onInit();
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
  InternalFinalCallback<void> get onStart => super.onStart;

  @override
  // ignore: unnecessary_overrides
  InternalFinalCallback<void> get onDelete => super.onDelete;
}
