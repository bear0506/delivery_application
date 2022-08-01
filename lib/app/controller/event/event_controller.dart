import 'package:get/get.dart';

class EventController extends GetxController with GetTickerProviderStateMixin {
  RxList<dynamic> events = [
    {
      "idx": "1",
      "title": "이런 나쁜 거짓말쟁이! 만우절 쿠폰 이벤트!",
      "date": "기간 : 2022.04.01 ~ 2022.04.30",
      "img": "assets/icons/event1.png",
      "content": "assets/icons/event_content_detail.png",
    },
    {
      "idx": "2",
      "title": "배달띱X볼빨간사춘기 선착순 한정 사인 CD 추첨 이벤트!",
      "date": "기간 : 2022.03.25 ~ 2022.04.15",
      "img": "assets/icons/event2.png",
      "content": "assets/icons/event_content_detail.png",
    },
    {
      "idx": "3",
      "title": "발렌타인데이...우리가 챙겨줄게 걱정하지마🎈",
      "date": "기간 : 2022.04.01 ~ 2022.04.30",
      "img": "assets/icons/event3.png",
      "content": "assets/icons/event_content_detail.png",
    },
  ].obs;

  late Rx<dynamic> eventIdx = Get.parameters["eventIdx"].obs;

  void onChangeEventIdx() {
    eventIdx.value = Get.parameters["eventIdx"];
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
  void dispose() {
    Get.delete<EventController>();

    super.dispose();
  }

  @override
  // ignore: unnecessary_overrides
  InternalFinalCallback<void> get onStart => super.onStart;

  @override
  // ignore: unnecessary_overrides
  InternalFinalCallback<void> get onDelete => super.onDelete;
}
