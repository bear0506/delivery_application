import 'package:get/get.dart';

class SettingController extends GetxController
    with GetTickerProviderStateMixin {
  RxBool orderStatus = true.obs;
  RxBool pushAlarm = false.obs;
  RxBool smsReception = false.obs;
  RxBool emailReception = false.obs;
  RxBool roomAlarm = true.obs;

  RxDouble distance = 300.0.obs;

  RxList<dynamic> switchContent = [
    {
      "title": "주문 현황 알림",
      "isChecked": true.obs,
    },
    {
      "title": "마케팅 정보 수신 및 푸시 알림",
      "isChecked": false.obs,
    },
    {
      "title": "SMS 수신",
      "isChecked": false.obs,
    },
    {
      "title": "이메일 수신",
      "isChecked": false.obs,
    },
    {
      "title": "근처 모임 생성 알림 (단위: m)",
      "isChecked": true.obs,
    },
  ].obs;

  void toggle() {
    orderStatus.value = orderStatus.value ? false : true;
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
    Get.delete<SettingController>();

    super.dispose();
  }

  @override
  // ignore: unnecessary_overrides
  InternalFinalCallback<void> get onStart => super.onStart;

  @override
  // ignore: unnecessary_overrides
  InternalFinalCallback<void> get onDelete => super.onDelete;
}
