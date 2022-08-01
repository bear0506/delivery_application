import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:delivery_service/app/data/model/signin/signin_model.dart';
import 'package:delivery_service/app/data/provider/signin/signin_provider.dart';
import 'package:delivery_service/app/global_widgets/global_toast_widget.dart';
import 'package:delivery_service/main.dart';

class SignInController extends GetxController {
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;

  late FocusScopeNode currentFocus = FocusScopeNode();
  late FocusNode emailFocusNode = FocusNode();
  late FocusNode passwordFocusNode = FocusNode();

  // 로더
  RxBool isLoaderVisible = false.obs;
  // 비밀번호 폼 필드 보기/숨기기
  RxBool isPasswordVisible = true.obs;
  // 비밀번호 정규식
  static RegExp pwRegExp =
      RegExp(r"^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{6,}$");

  void handleEmailOnFieldSubmitted() =>
      EmailValidator.validate(emailController.value.text)
          ? passwordFocusNode.requestFocus()
          : emailFocusNode.requestFocus();

  void handlePasswordOnFieldSubmitted() =>
      pwRegExp.hasMatch(passwordController.value.text)
          ? handleSignInProvider()
          : passwordFocusNode.requestFocus();

  // 폼 텍스트 벨리데이션 체크
  bool handleValidator() {
    bool validatorTemp = true;

    if (emailController.value.text.isEmpty) {
      GlobalToastWidget(message: "이메일을 입력해주세요.");
      return false;
    }

    if (!EmailValidator.validate(emailController.value.text)) {
      GlobalToastWidget(message: "올바른 이메일을 입력해주세요.");
      return false;
    }

    if (passwordController.value.text.isEmpty) {
      GlobalToastWidget(message: "비밀번호를 입력해주세요.");
      return false;
    }

    if (passwordController.value.text.length < 6) {
      GlobalToastWidget(message: "비밀번호를 6자리 이상 입력해주세요.");
      return false;
    }

    if (!pwRegExp.hasMatch(passwordController.value.text)) {
      GlobalToastWidget(message: "대소문자 숫자 특수문자를 입력해주세요.");
      return false;
    }

    return validatorTemp;
  }

  // 로그인
  Future<void> handleSignInProvider() async {
    try {
      // logger.d(emailController.value.text);
      // logger.d(passwordController.value.text);

      if (handleValidator()) {
        Rx<SignInRequestModel> requestModel = SignInRequestModel(
          email: "",
          password: "",
        ).obs;

        requestModel.update((_) {
          _?.email = emailController.value.text;
          _?.password = passwordController.value.text;
        });

        isLoaderVisible.value = true;

        await SignInProvider().dio(requestModel: requestModel).then((value) {
          if (value.status == "success") {
            GetStorage().write("token", value.accessToken);
            Get.offAllNamed("/main");
          } else {
            logger.d(value.message);
            GlobalToastWidget(message: value.message);
          }
        });
      }
    } catch (e) {
      logger.d(e);
    } finally {
      isLoaderVisible.value = false;
    }
  }

  // 임시 로그인
  Future<void> handleTempProvider({required String type}) async {
    try {
      Rx<SignInRequestModel> requestModel = SignInRequestModel(
        email: "",
        password: "",
      ).obs;

      switch (type) {
        case "admin1":
          requestModel.update((_) {
            _?.email = "admin@admin.com";
            _?.password = "Wlqxld1!@#";
          });
          break;
        case "admin2":
          requestModel.update((_) {
            _?.email = "admin2@admin.com";
            _?.password = "Wlqxld1!@#";
          });
          break;
      }

      isLoaderVisible.value = true;

      await SignInProvider().dio(requestModel: requestModel).then((value) {
        if (value.status == "success") {
          GetStorage().write("token", value.accessToken);
          Get.offAllNamed("/main");
        } else {
          logger.d(value.message);
          GlobalToastWidget(message: value.message);
        }
      });
    } catch (e) {
      logger.d(e);
    } finally {
      isLoaderVisible.value = false;
    }
  }

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
    FocusManager.instance.primaryFocus?.unfocus();

    emailFocusNode.dispose();
    passwordFocusNode.dispose();

    super.onClose();
  }

  @override
  // ignore: unnecessary_overrides
  InternalFinalCallback<void> get onStart => super.onStart;

  @override
  // ignore: unnecessary_overrides
  InternalFinalCallback<void> get onDelete => super.onDelete;
}
