import 'package:get/get.dart';

import 'package:delivery_service/app/controller/help/help_controller.dart';

class HelpBinding implements Bindings {
  @override
  void dependencies() => Get.lazyPut<HelpController>(
        () => HelpController(),
        fenix: true,
      );
}
