import 'dart:convert';

import 'package:get/get.dart';
import 'package:delivery_service/app/data/provider/map/map_provider.dart';
import 'package:delivery_service/app/data/model/map/map_model.dart';
import 'package:delivery_service/main.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MapController extends GetxController {
  late RxList<RoomResponseModel> rooms = <RoomResponseModel>[].obs;
  late RxList<Map<String, dynamic>> roomsMap = <Map<String, dynamic>>[].obs;

  late Rx<WebViewController> webViewController;

  void initwebViewController(WebViewController controller) {
    webViewController = controller.obs;
  }

  RxList<Map<String, dynamic>> roomsMap2 = [
    {
      'title': '백암왕순대',
      'latlng': 'new kakao.maps.LatLng(37.5606223, 126.9921053)'
    },
    {
      'title': '한국의 집',
      'latlng': 'new kakao.maps.LatLng(37.5602041, 126.9947198)'
    },
    {
      'title': '필동칼국수',
      'latlng': 'new kakao.maps.LatLng(37.5607595, 126.9938715)'
    },
    {
      'title': '엽기떡볶이',
      'latlng': 'new kakao.maps.LatLng(37.5615698, 126.9949075)'
    },
  ].obs;

  RxString kakaoMapKey = 'f764cf6bd69b199f8d3676d70ae1f777'.obs;

  // 조회
  Future<void> handleInitProvider() async {
    try {
      await MapInitProvider().dio().then((value) {
        if (value.status == "success") {
          print("Success!");

          rooms.addAll(value.rooms);
          rooms.refresh();

          roomsMap.addAll(value.roomsMap);
          roomsMap.refresh();

          webViewController.value.runJavascript('''
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
                    // onTapMarker.postMessage(mapMarkers[num].idx);
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
          () => print("Delay~"));
    }
  }

  @override
  // ignore: unnecessary_overrides
  void onInit() async {
    await handleInitProvider();

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
