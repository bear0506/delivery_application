import 'package:get/get.dart';

class SuccessController extends GetxController {
  late Rx<String?> title = Get.parameters["title"].obs;
  late Rx<String?> content = Get.parameters["content"].obs;
  late Rx<String?> action = Get.parameters["action"].obs;

  @override
  // ignore: unnecessary_overrides
  void onInit() async {
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
