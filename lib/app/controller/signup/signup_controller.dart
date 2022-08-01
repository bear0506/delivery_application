import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:delivery_service/app/core/values/colors.dart';
import 'package:delivery_service/app/data/model/signup/signup_model.dart';
import 'package:delivery_service/app/data/provider/send/send_provider.dart';
import 'package:delivery_service/app/data/provider/signup/signup_provider.dart';
import 'package:delivery_service/app/global_widgets/gloabl_snackbar_widget.dart';
import 'package:delivery_service/app/global_widgets/global_dialog_widget.dart';
import 'package:delivery_service/main.dart';

class SignUpController extends GetxController {
  // 로더
  RxBool isLoaderVisible = false.obs;

  // ===== 약관 및 개인정보 처리 방침 =====
  late FocusScopeNode currentFocus;
  late FocusNode allCheckBoxFocusNode;
  late FocusNode termsCheckBoxFocusNode;
  late FocusNode privacyCheckBoxFocusNode;
  late FocusNode termsOutlinedButtonFocusNode;

  RxMap<String, dynamic> isAllCheckBox =
      {"title": "전체 약관에 동의합니다.", "isChecked": false}.obs;

  RxList<dynamic> isCheckbox = [
    {
      "title": "이용약관".obs,
      "content":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
              .obs,
      "isChecked": false.obs
    },
    {
      "title": "개인정보 수집 및 이용 동의".obs,
      "content":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
              .obs,
      "isChecked": false.obs,
    },
  ].obs;

  TextStyle outlinedButtonTextStyle() => isAllCheckBox["isChecked"] == true
      ? TextStyle(
          color: kPrimaryColor, fontSize: 70.sp, fontFamily: 'Core_Gothic_D5')
      : TextStyle(
          color: Colors.grey, fontSize: 70.sp, fontFamily: 'Core_Gothic_D5');

  ButtonStyle outlinedButtonStyle() => isAllCheckBox["isChecked"] == true
      ? OutlinedButton.styleFrom(
          side: const BorderSide(color: kPrimaryColor, width: 1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50.0),
          ),
          backgroundColor: Colors.white,
          elevation: 1.1,
          shadowColor: Colors.black,
        )
      : OutlinedButton.styleFrom(
          side: BorderSide(color: Colors.grey.shade200, width: 1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50.0),
          ),
          backgroundColor: Colors.grey.shade100,
          elevation: 1.1,
          shadowColor: Colors.black,
        );

  Future<dynamic>? outlinedButtonOnPressed() {
    return isAllCheckBox["isChecked"] == true
        ? Get.toNamed("/signup/phone", preventDuplicates: false)
        : null;
  }

  // ===== 핸드폰 인증 =====
  final nameTextFormFieldController = TextEditingController();
  final phoneTextFormFieldController = TextEditingController();
  final phoneVerifyTextFormFieldController = TextEditingController();

  late FocusNode nameTextFormFieldFocusNode;
  late FocusNode phoneTextFormFieldFocusNode;
  late FocusNode phoneOutlinedButtonFocusNode;
  late FocusNode phoneVerifyTextFormFieldFocusNode;
  late FocusNode phoneVerifyOutlinedButtonFocusNode;

  // 이름 필드 텍스트 활성 여부
  RxBool isNameTextFormFieldEnabled = true.obs;
  // 핸드폰 번호 텍스트 필드 활성 여부
  RxBool isPhoneTextFormFieldEnabled = false.obs;
  // 인증번호 발송 버튼 활성 여부
  RxBool isPhoneOutlinedButtonEnabled = false.obs;
  // 인증번호 텍스트 필드 보이기/숨기기
  RxBool isPhoneVerifyTextFormFieldVisible = false.obs;
  // 인증번호 텍스트 필드 활성 여부
  RxBool isPhoneVerifyTextFormFieldEnabled = true.obs;
  // 인증완료 버튼 활성 여부
  RxBool isPhoneVerifyOutlinedButtonEnabled = false.obs;

  // 인증번호 발송 버튼 스타일
  ButtonStyle phoneOutlinedButtonStyle() =>
      isPhoneOutlinedButtonEnabled.value == true
          ? OutlinedButton.styleFrom(
              side: const BorderSide(color: kPrimaryColor, width: 1),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.0),
              ),
              backgroundColor: Colors.white,
              elevation: 1.1,
              shadowColor: Colors.black,
            )
          : OutlinedButton.styleFrom(
              side: BorderSide(color: Colors.grey.shade200, width: 1),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.0),
              ),
              backgroundColor: Colors.grey.shade100,
              elevation: 1.1,
              shadowColor: Colors.black,
            );
  // 인증번호 발송 버튼 텍스트 스타일
  TextStyle phoneOutlinedButtonTextStyle() =>
      isPhoneOutlinedButtonEnabled.value == true
          ? const TextStyle(color: kPrimaryColor, fontWeight: FontWeight.bold)
          : const TextStyle(color: Colors.grey, fontWeight: FontWeight.bold);

  // 인증완료 버튼 스타일
  ButtonStyle phoneVerifyOutlinedButtonStyle() =>
      isPhoneVerifyOutlinedButtonEnabled.value == true
          ? OutlinedButton.styleFrom(
              side: const BorderSide(color: kPrimaryColor, width: 1),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.0),
              ),
              backgroundColor: Colors.white,
              elevation: 1.1,
              shadowColor: Colors.black,
            )
          : OutlinedButton.styleFrom(
              side: BorderSide(color: Colors.grey.shade200, width: 1),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.0),
              ),
              backgroundColor: Colors.grey.shade100,
              elevation: 1.1,
              shadowColor: Colors.black,
            );
  // 인증완료 버튼 텍스트 스타일
  TextStyle phoneVerifyOutlinedButtonTextStyle() =>
      isPhoneVerifyOutlinedButtonEnabled.value == true
          ? TextStyle(
              color: kPrimaryColor,
              fontSize: 60.sp,
              fontWeight: FontWeight.bold)
          : TextStyle(
              color: Colors.grey, fontSize: 60.sp, fontWeight: FontWeight.bold);

  // 이름 키보드 이동(완료) 버튼
  void handleNameOnFieldSubmitted({required dynamic value}) {
    if (value.length >= 2) {
      isPhoneTextFormFieldEnabled.value = true;
      phoneTextFormFieldFocusNode.requestFocus();
    } else {
      isPhoneTextFormFieldEnabled.value = false;
      nameTextFormFieldFocusNode.requestFocus();
    }
  }

  // 이름 텍스트 필드 변경
  void handleNameOnChanged(
      {required dynamic globalFormKey, required dynamic value}) {
    globalFormKey.currentState!.save();

    value.length >= 2
        ? isPhoneTextFormFieldEnabled.value = true
        : isPhoneTextFormFieldEnabled.value = false;

    print(isPhoneTextFormFieldEnabled.value);
  }

  // 핸드폰 번호 텍스트 필드 변경
  void handlePhoneOnChanged(
      {required dynamic globalFormKey, required dynamic value}) {
    globalFormKey.currentState!.save();

    value.length >= 11
        ? isPhoneOutlinedButtonEnabled.value = true
        : isPhoneOutlinedButtonEnabled.value = false;
  }

  // 핸드폰 인증 텍스트 필드 변경
  void handlePhoneVerifyOnChanged(
      {required dynamic globalFormKey, required dynamic value}) {
    globalFormKey.currentState!.save();

    value.length >= 6
        ? isPhoneVerifyOutlinedButtonEnabled.value = true
        : isPhoneVerifyOutlinedButtonEnabled.value = false;
  }

  // 벨리데이션
  String? handlePhoneValidator({required String type, required dynamic value}) {
    switch (type) {
      case "name":
        if (value!.isEmpty) {
          return "이름을 입력해주세요.";
        }

        if (value.length < 2) {
          return "이름을 입력해주세요.";
        }
        break;
      case "phone":
        if (value!.isEmpty) {
          return "핸드폰 번호를 입력해주세요.";
        }

        if (value.length < 11) {
          return "올바른 핸드폰 번호를 입력해주세요.";
        }
        break;
      case "phoneVerify":
        if (value!.isEmpty) {
          return "인증번호를 입력해주세요.";
        }

        if (value.length != 6) {
          return "인증번호 6자리를 입력해주세요.";
        }
        break;
    }

    return null;
  }

  void handlePhoneChangeState({
    bool isPhoneTextFormFieldEnabled = true,
    bool isPhoneOutlinedButtonEnabled = true,
    bool isPhoneVerifyTextFormFieldVisible = true,
    bool isLoaderVisible = false,
  }) {
    this.isPhoneTextFormFieldEnabled.value = isPhoneTextFormFieldEnabled;
    this.isPhoneOutlinedButtonEnabled.value = isPhoneOutlinedButtonEnabled;
    this.isPhoneVerifyTextFormFieldVisible.value =
        isPhoneVerifyTextFormFieldVisible;
    this.isLoaderVisible.value = isLoaderVisible;

    update();
  }

  void handlePhoneVerifyChangeState({
    bool isPhoneVerifyTextFormFieldEnabled = true,
    bool isPhoneVerifyOutlinedButtonEnabled = false,
    bool isLoaderVisible = false,
  }) {
    this.isPhoneVerifyTextFormFieldEnabled.value =
        isPhoneVerifyTextFormFieldEnabled;
    this.isPhoneVerifyOutlinedButtonEnabled.value =
        isPhoneVerifyOutlinedButtonEnabled;
    this.isLoaderVisible.value = isLoaderVisible;

    update();
  }

  Rx<PhoneRequestModel> phoneRequestModel = PhoneRequestModel(
    name: "",
    phone: "",
  ).obs;

  void handlePhoneRequestUpdate() {
    phoneRequestModel.update((_) {
      _?.name = nameTextFormFieldController.text;
      _?.phone = phoneTextFormFieldController.text;
    });
  }

  Rx<PhoneVerifyRequestModel> phoneVerifyRequestModel = PhoneVerifyRequestModel(
    phone: "",
    number: "",
  ).obs;

  void handlePhoneVerifyRequestUpdate() {
    phoneVerifyRequestModel.update((_) {
      _?.phone = phoneTextFormFieldController.text;
      _?.number = phoneVerifyTextFormFieldController.text;
    });
  }

  // 핸드폰 인증번호 발송
  Future<void> handlePhoneProvider() async {
    try {
      if (isPhoneOutlinedButtonEnabled.value == true &&
          phoneTextFormFieldController.text.length >= 11) {
        handlePhoneRequestUpdate();
        handlePhoneChangeState(
            isPhoneTextFormFieldEnabled: true,
            isPhoneOutlinedButtonEnabled: false,
            isPhoneVerifyTextFormFieldVisible: true,
            isLoaderVisible: true);

        await SendSignupProvider()
            .dio(requestModel: phoneRequestModel)
            .then((value) {
          handlePhoneChangeState(
              isPhoneTextFormFieldEnabled:
                  value.status != "success" ? false : true,
              isPhoneOutlinedButtonEnabled:
                  value.status != "success" ? true : false,
              isPhoneVerifyTextFormFieldVisible:
                  value.status != "success" ? false : true,
              isLoaderVisible: false);

          if (value.status == "success") {
            Future.delayed(const Duration(milliseconds: 100),
                () => phoneVerifyTextFormFieldFocusNode.requestFocus());
          } else {
            globalSnackBarWidget(message: value.message);
            Future.delayed(const Duration(milliseconds: 100),
                () => phoneTextFormFieldFocusNode.requestFocus());
          }
        });
      } else {
        phoneTextFormFieldFocusNode.requestFocus();
      }
    } catch (e) {
      logger.d(e);
      globalSnackBarWidget(message: "인증번호를 다시 요청해주세요.");
      handlePhoneChangeState(
          isPhoneTextFormFieldEnabled: false,
          isPhoneOutlinedButtonEnabled: true,
          isPhoneVerifyTextFormFieldVisible: false,
          isLoaderVisible: false);
    }
  }

  // 핸드폰 인증번호 인증
  Future<void> handlePhoneVerifyProvider() async {
    try {
      if (isPhoneVerifyOutlinedButtonEnabled.value == true &&
          phoneVerifyTextFormFieldController.text.length >= 6) {
        handlePhoneVerifyRequestUpdate();
        handlePhoneVerifyChangeState(
            isPhoneVerifyTextFormFieldEnabled: false,
            isPhoneVerifyOutlinedButtonEnabled: false,
            isLoaderVisible: true);

        await SendSignupVerifyProvider()
            .dio(requestModel: phoneVerifyRequestModel)
            .then((value) {
          handlePhoneVerifyChangeState(
              isPhoneVerifyTextFormFieldEnabled:
                  value.status != "success" ? true : false,
              isPhoneVerifyOutlinedButtonEnabled:
                  value.status != "success" ? true : false,
              isLoaderVisible: false);

          if (value.status == "success") {
            Get.toNamed("/signup/info", preventDuplicates: false);
          } else {
            globalSnackBarWidget(message: value.message);
            Future.delayed(const Duration(milliseconds: 100),
                () => phoneVerifyTextFormFieldFocusNode.requestFocus());
          }
        });
      } else {
        phoneVerifyTextFormFieldFocusNode.requestFocus();
      }
    } catch (e) {
      logger.d(e);
      globalSnackBarWidget(message: "인증하기를 다시 요청해주세요.");
      handlePhoneVerifyChangeState(
          isPhoneVerifyTextFormFieldEnabled: false,
          isPhoneVerifyOutlinedButtonEnabled: false,
          isLoaderVisible: false);
    }
  }

  // ===== 정보 입력 =====
  final SignUpInfoProvider signUpInfoProvider = SignUpInfoProvider();

  final nickNameTextFormFieldController = TextEditingController();
  final emailTextFormFieldController = TextEditingController();

  late FocusNode nickNameTextFormFieldFocusNode;
  late FocusNode emailTextFormFieldFocusNode;
  late FocusNode infoOutlinedButtonFocusNode;

  // 닉네임 폼 필드 활성 여부
  RxBool isNickNameTextFormFieldEnabled = true.obs;
  // 이메일 폼 필드 활성 여부
  RxBool isEmailTextFormFieldEnabled = false.obs;
  // 다음 버튼 활성 여부
  RxBool isInfoOutlinedButtonEnabled = false.obs;

  Rx<InfoRequestModel> infoRequestModel = InfoRequestModel(
    email: "",
    nickname: "",
  ).obs;

  TextStyle infoOutlinedButtonTextStyle() =>
      isInfoOutlinedButtonEnabled.value == true
          ? TextStyle(
              color: kPrimaryColor,
              fontSize: 50.sp,
              fontWeight: FontWeight.bold)
          : TextStyle(
              color: Colors.grey, fontSize: 50.sp, fontWeight: FontWeight.bold);

  ButtonStyle infoOutlinedButtonStyle() =>
      isInfoOutlinedButtonEnabled.value == true
          ? OutlinedButton.styleFrom(
              side: const BorderSide(color: kPrimaryColor, width: 1),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.0),
              ),
              backgroundColor: Colors.white,
              elevation: 1.1,
              shadowColor: Colors.black,
            )
          : OutlinedButton.styleFrom(
              side: BorderSide(color: Colors.grey.shade200, width: 1),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.0),
              ),
              backgroundColor: Colors.grey.shade100,
              elevation: 1.1,
              shadowColor: Colors.black,
            );

  // 닉네임
  void handleNickNameOnFieldSubmitted({required dynamic value}) {
    if (value.length <= 8 && value.length >= 3) {
      emailTextFormFieldFocusNode.requestFocus();
    } else {
      nickNameTextFormFieldFocusNode.requestFocus();
    }
  }

  // 닉네임
  void handleNickNameOnChanged(
      {required dynamic globalFormKey, required dynamic value}) {
    globalFormKey.currentState!.save();

    value.length <= 8 && value.length >= 3
        ? isEmailTextFormFieldEnabled.value = true
        : isEmailTextFormFieldEnabled.value = false;
  }

  // 이메일
  void handleEmailOnChanged(
      {required dynamic globalFormKey, required dynamic value}) {
    globalFormKey.currentState!.save();

    EmailValidator.validate(value) == true
        ? isInfoOutlinedButtonEnabled.value = true
        : isInfoOutlinedButtonEnabled.value = false;
  }

  // 벨리데이션
  String? handleInfoValidator({required String type, required dynamic value}) {
    switch (type) {
      case "nickname":
        if (value!.isEmpty) {
          return "닉네임을 입력해주세요.";
        }

        if (value.length < 3) {
          return "닉네임을 3자리 이상 입력해주세요.";
        }

        if (value.length > 8) {
          return "닉네임을 8자리 이하로 입력해주세요.";
        }
        break;
      case "email":
        if (value!.isEmpty) {
          return "이메일 주소를 입력해주세요.";
        }

        if (!EmailValidator.validate(value)) {
          return "올바른 이메일 주소를 입력해주세요.";
        }
        break;
    }

    return null;
  }

  void handleInfoRequestModel() {
    infoRequestModel.update((_) {
      _?.nickname = nickNameTextFormFieldController.text;
      _?.email = emailTextFormFieldController.text;
    });
  }

  void handleInfoChangeState({
    bool isNickNameTextFormFieldEnabled = true,
    bool isEmailTextFormFieldEnabled = false,
    bool isInfoOutlinedButtonEnabled = false,
    bool isLoaderVisible = false,
  }) {
    this.isNickNameTextFormFieldEnabled.value = isNickNameTextFormFieldEnabled;
    this.isEmailTextFormFieldEnabled.value = isEmailTextFormFieldEnabled;
    this.isInfoOutlinedButtonEnabled.value = isInfoOutlinedButtonEnabled;
    this.isLoaderVisible.value = isLoaderVisible;

    update();
  }

  Future<void> handleInfoProvider() async {
    try {
      if (EmailValidator.validate(emailTextFormFieldController.text)) {
        handleInfoRequestModel();
        handleInfoChangeState(
            isNickNameTextFormFieldEnabled: false,
            isEmailTextFormFieldEnabled: false,
            isInfoOutlinedButtonEnabled: true,
            isLoaderVisible: true);

        await signUpInfoProvider
            .dio(requestModel: infoRequestModel)
            .then((value) {
          handleInfoChangeState(
              isNickNameTextFormFieldEnabled:
                  value.status != "success" ? true : false,
              isEmailTextFormFieldEnabled:
                  value.status != "success" ? true : false,
              isInfoOutlinedButtonEnabled:
                  value.status != "success" ? false : true,
              isLoaderVisible: false);

          print(value);

          if (value.status == "success") {
            Get.toNamed("/signup/password", preventDuplicates: false);
          } else if (value.status == "nickname_duplication") {
            globalSnackBarWidget(message: value.message);
            Future.delayed(const Duration(milliseconds: 100),
                () => nickNameTextFormFieldFocusNode.requestFocus());
          } else if (value.status == "email_duplication") {
            globalSnackBarWidget(message: value.message);
            Future.delayed(const Duration(milliseconds: 100),
                () => emailTextFormFieldFocusNode.requestFocus());
          } else {
            globalSnackBarWidget(message: value.message);
          }
        });
      } else {
        emailTextFormFieldFocusNode.requestFocus();
      }
    } catch (e) {
      logger.d(e);
      handleInfoChangeState(
          isNickNameTextFormFieldEnabled: true,
          isEmailTextFormFieldEnabled: true,
          isInfoOutlinedButtonEnabled: false,
          isLoaderVisible: false);
      globalSnackBarWidget(message: "잠시 후 다시시도해주세요.");
    }
  }

  //=====비밀번호 입력 =====
  final SignUpProvider signUpProvider = SignUpProvider();

  final passwordTextFormFieldController = TextEditingController();
  final passwordReTextFormFieldController = TextEditingController();

  late FocusNode passwordTextFormFieldFocusNode;
  late FocusNode passwordReTextFormFieldFocusNode;
  late FocusNode passwordOutlinedButtonFocusNode;

  // 비밀번호 폼 필드 활성 여부
  RxBool isPasswordTextFormFieldEnabled = true.obs;
  // 비밀번호 보이기/숨기기
  RxBool isPasswordHideVisible = true.obs;
  // 비밀번호 확인 폼 필드 활성 여부
  RxBool isPasswordReTextFormFieldEnabled = true.obs;
  // 비밀번호 확인 보이기/숨기기
  RxBool isPasswordReHideVisible = true.obs;
  // 회원가입 버튼 활성 여부
  RxBool isPasswordOutlinedButtonEnabled = false.obs;

  RegExp pwRegExp =
      RegExp(r"^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{6,}$");

  Rx<SignUpRequestModel> signUpRequestModel = SignUpRequestModel(
    email: "",
    name: "",
    nickname: "",
    phone: "",
    password: "",
  ).obs;

  TextStyle passwordOutlinedButtonTextStyle() =>
      isPasswordOutlinedButtonEnabled.value == true
          ? TextStyle(
              color: kPrimaryColor,
              fontSize: 50.sp,
              fontWeight: FontWeight.bold)
          : TextStyle(
              color: Colors.grey, fontSize: 50.sp, fontWeight: FontWeight.bold);

  ButtonStyle passwordOutlinedButtonStyle() =>
      isPasswordOutlinedButtonEnabled.value == true
          ? OutlinedButton.styleFrom(
              side: const BorderSide(color: kPrimaryColor, width: 1),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.0),
              ),
              backgroundColor: Colors.white,
              elevation: 1.1,
              shadowColor: Colors.black,
            )
          : OutlinedButton.styleFrom(
              side: BorderSide(color: Colors.grey.shade200, width: 1),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.0),
              ),
              backgroundColor: Colors.grey.shade100,
              elevation: 1.1,
              shadowColor: Colors.black,
            );

  void handlePasswordOnFieldSubmitted({required dynamic value}) {
    if (pwRegExp.hasMatch(value)) {
      passwordReTextFormFieldFocusNode.requestFocus();
    } else {
      passwordTextFormFieldFocusNode.requestFocus();
    }
  }

  void handlePasswordOnChanged({required dynamic globalFormKey}) {
    globalFormKey.currentState!.save();
  }

  void handlePasswordReOnChanged(
      {required dynamic globalFormKey, required dynamic value}) {
    globalFormKey.currentState!.save();

    pwRegExp.hasMatch(value) && passwordTextFormFieldController.text == value
        ? isPasswordOutlinedButtonEnabled.value = true
        : isPasswordOutlinedButtonEnabled.value = false;
  }

  // 벨리데이션
  String? handlePasswordValidator(
      {required String type, required dynamic value}) {
    switch (type) {
      case "password":
        if (value!.isEmpty) {
          return "비밀번호를 입력해주세요.";
        }

        if (value.length < 6) {
          return "비밀번호를 6자리 이상 입력해주세요.";
        }

        if (!pwRegExp.hasMatch(value)) {
          return "대소문자 숫자 특수문자를 입력해주세요.";
        }
        break;
      case "passwordRe":
        if (value!.isEmpty) {
          return "비밀번호를 입력해주세요.";
        }

        if (value.length < 6) {
          return "비밀번호를 6자리 이상 입력해주세요.";
        }

        if (!pwRegExp.hasMatch(value)) {
          return "대소문자 숫자 특수문자를 입력해주세요.";
        }

        if (passwordTextFormFieldController.text != value) {
          return "비밀번호가 일치하지 않습니다.";
        }
        break;
    }

    return null;
  }

  void handlePasswordRequestModel() {
    signUpRequestModel.update((_) {
      _?.email = emailTextFormFieldController.text;
      _?.name = nameTextFormFieldController.text;
      _?.nickname = nickNameTextFormFieldController.text;
      _?.phone = phoneTextFormFieldController.text;
      _?.password = passwordTextFormFieldController.text;
    });
  }

  void handlePasswordChangeState({
    bool isPasswordTextFormFieldEnabled = true,
    bool isPasswordReTextFormFieldEnabled = false,
    bool isPasswordOutlinedButtonEnabled = false,
    bool isLoaderVisible = false,
  }) {
    this.isPasswordTextFormFieldEnabled.value = isPasswordTextFormFieldEnabled;
    this.isPasswordReTextFormFieldEnabled.value =
        isPasswordReTextFormFieldEnabled;
    this.isPasswordOutlinedButtonEnabled.value =
        isPasswordOutlinedButtonEnabled;
    this.isLoaderVisible.value = isLoaderVisible;

    update();
  }

  Future<void> handlePasswordProvider() async {
    try {
      if (pwRegExp.hasMatch(passwordReTextFormFieldController.text) &&
          passwordTextFormFieldController.text ==
              passwordReTextFormFieldController.text) {
        handlePasswordRequestModel();
        handlePasswordChangeState(
            isPasswordTextFormFieldEnabled: false,
            isPasswordReTextFormFieldEnabled: false,
            isPasswordOutlinedButtonEnabled: true,
            isLoaderVisible: true);

        await signUpProvider
            .dio(requestModel: signUpRequestModel)
            .then((value) {
          handlePasswordChangeState(
              isPasswordTextFormFieldEnabled:
                  value.status != "success" ? true : false,
              isPasswordReTextFormFieldEnabled:
                  value.status != "success" ? true : false,
              isPasswordOutlinedButtonEnabled:
                  value.status != "success" ? false : true,
              isLoaderVisible: false);

          if (value.status == "success") {
            Get.offAllNamed(
                "/success?title=회원가입 완료&content=회원가입을 축하합니다! 이제 배달띱을 즐겨보세요!&action=signin");
          } else {
            globalSnackBarWidget(message: value.message);
          }
        });
      } else {
        passwordTextFormFieldFocusNode.requestFocus();
      }
    } catch (e) {
      logger.d(e);
      handlePasswordChangeState(
          isPasswordTextFormFieldEnabled: true,
          isPasswordReTextFormFieldEnabled: true,
          isPasswordOutlinedButtonEnabled: false,
          isLoaderVisible: false);
      globalSnackBarWidget(message: "회원가입을 다시 요청해주세요.");
    }
  }

  Future<bool> handleWillPopScopeAction() async {
    globalWillPopScopeDialogWidget();
    return false;
  }

  @override
  void onInit() {
    // ===== 약관 및 개인정보 처리 방침 =====
    allCheckBoxFocusNode = FocusNode();
    termsCheckBoxFocusNode = FocusNode();
    privacyCheckBoxFocusNode = FocusNode();
    termsOutlinedButtonFocusNode = FocusNode();

    // ===== 핸드폰 인증 =====
    nameTextFormFieldFocusNode = FocusNode();
    phoneTextFormFieldFocusNode = FocusNode();
    phoneOutlinedButtonFocusNode = FocusNode();
    phoneVerifyTextFormFieldFocusNode = FocusNode();
    phoneVerifyOutlinedButtonFocusNode = FocusNode();

    // ===== 정보 입력 =====
    nickNameTextFormFieldFocusNode = FocusNode();
    emailTextFormFieldFocusNode = FocusNode();
    infoOutlinedButtonFocusNode = FocusNode();

    //=====비밀번호 입력 =====
    passwordTextFormFieldFocusNode = FocusNode();
    passwordReTextFormFieldFocusNode = FocusNode();
    passwordOutlinedButtonFocusNode = FocusNode();

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
    // ===== 약관 및 개인정보 처리 방침 =====
    allCheckBoxFocusNode.dispose();
    termsCheckBoxFocusNode.dispose();
    privacyCheckBoxFocusNode.dispose();
    termsOutlinedButtonFocusNode.dispose();

    // ===== 핸드폰 인증 =====
    nameTextFormFieldController.dispose();
    phoneTextFormFieldController.dispose();
    phoneVerifyTextFormFieldController.dispose();

    nameTextFormFieldFocusNode.dispose();
    phoneTextFormFieldFocusNode.dispose();
    phoneOutlinedButtonFocusNode.dispose();
    phoneVerifyTextFormFieldFocusNode.dispose();
    phoneVerifyOutlinedButtonFocusNode.dispose();

    // ===== 정보 입력 =====
    nickNameTextFormFieldController.dispose();
    emailTextFormFieldController.dispose();

    nickNameTextFormFieldFocusNode.dispose();
    emailTextFormFieldFocusNode.dispose();
    infoOutlinedButtonFocusNode.dispose();

    //=====비밀번호 입력 =====
    passwordTextFormFieldController.dispose();
    passwordReTextFormFieldController.dispose();

    passwordTextFormFieldFocusNode.dispose();
    passwordReTextFormFieldFocusNode.dispose();
    passwordOutlinedButtonFocusNode.dispose();

    super.onClose();
  }

  @override
  // ignore: unnecessary_overrides
  InternalFinalCallback<void> get onStart => super.onStart;

  @override
  // ignore: unnecessary_overrides
  InternalFinalCallback<void> get onDelete => super.onDelete;
}
