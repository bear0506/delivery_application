import 'package:delivery_service/app/data/model/main/main_model.dart';
import 'package:delivery_service/main.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'package:delivery_service/app/data/provider/main/main_provider.dart';

class MainController extends GetxController {
  RxDouble deviceWidth = (1440.0).obs;
  RxDouble deviceHeight = (3200.0).obs;

  RxBool loginStatus = false.obs;

  Rx<MemberResponseModel> currentMember = MemberResponseModel(
    idx: 0,
    email: "",
    name: "",
    nickname: "",
    phone: "",
    photo: "",
  ).obs;

  // 스토리지에서 토큰 체크
  Future<void> handleInit() async {
    //print(GetStorage().read("token"));

    if (GetStorage().read("token") == null) {
      // handleGetTo(status: false);
      loginStatus.value = false;
    } else {
      await handleInitProvider();
    }
    // handleGetTo(status: false);
  }

  // 유저 조회
  Future<void> handleInitProvider() async {
    try {
      await MainInitProvider().dio().then((value) async {
        if (value.status == "success") {
          loginStatus.value = true;
          currentMember.value = value.member;
        } else {
          loginStatus.value = false;
        }
      });
    } catch (e) {
      logger.d(e);
    }
  }

  @override
  // ignore: unnecessary_overrides
  void onInit() async {
    await handleInit();

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
