import 'package:get/get.dart';

class MainController extends GetxController {
  // RxInt bottomNavigationIndex = 0.obs;
  RxDouble deviceWidth = (1440.0).obs;
  RxDouble deviceHeight = (3200.0).obs;

  @override
  // ignore: unnecessary_overrides
  void onInit() {
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
