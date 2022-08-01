import 'dart:io';
import 'dart:convert';

import 'package:delivery_service/app/controller/main/main_controller.dart';
import 'package:delivery_service/app/global_widgets/gloabl_snackbar_widget.dart';
import 'package:get/get.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';

import 'package:delivery_service/main.dart';
import 'package:delivery_service/app/controller/mypage/mypage_controller.dart';
import 'package:delivery_service/app/data/model/mypage/mypage_user_model.dart';
import 'package:delivery_service/app/data/provider/mypage/mypage_user_provider.dart';

import 'package:delivery_service/app/data/provider/main/main_provider.dart';

class MyPageUserUpdateController extends GetxController {
  RxList<dynamic> users = [
    {
      "update": "프로필 사진 변경",
      "img": "assets/icons/min.png",
      "nickname": "Mini_mee",
      "name": "김민니",
      "email": "asdf1234@naver.com",
      "phoneNumber": "010-1234-5678",
      "logout": "로그아웃",
    },
  ].obs;

  final GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();

  final ImagePicker picker = ImagePicker();

  final nicknameTextFormFieldController = TextEditingController();
  // final introduceTextFormFieldController = TextEditingController();

  late FocusScopeNode currentFocus;
  late FocusNode nicknameTextFormFieldFocusNode;
  late FocusNode introduceTextFormFieldFocusNode;
  late FocusNode outlinedButtonFocusNode;

  // 스켈레톤(쉬머)
  RxBool isLoaderVisible = true.obs;
  // 리퀘스트 오류 메세지
  RxString reqeustMessage = "".obs;
  // 이미지
  RxList imageList = [].obs;
  // 수정 버튼 활성 여부
  RxBool isoutlinedButtonEnabled = true.obs;
  // 수정 성공 여부
  RxBool isUpdateProvider = false.obs;

  TextStyle outlinedButtonTextStyle() => isoutlinedButtonEnabled.value == true
      ? const TextStyle(color: Colors.red, fontWeight: FontWeight.bold)
      : const TextStyle(color: Colors.grey, fontWeight: FontWeight.bold);

  ButtonStyle outlinedButtonStyle() => isoutlinedButtonEnabled.value == true
      ? OutlinedButton.styleFrom(
          side: const BorderSide(color: Colors.red, width: 1),
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

  // 이미지 선택시
  Future<void> handleSelectImage() async {
    final XFile? selectedImages =
        await picker.pickImage(source: ImageSource.gallery);

    if (selectedImages != null) {
      imageList.clear();

      imageList.add({
        "type": "local",
        "path": selectedImages.path,
        "base64": handleBase64Format(selectedImages.path)
      });

      logger.d(imageList);
    }
  }

  // Base64 변환
  String handleBase64Format(String path) {
    File file = File(path);
    List<int> fileInByte = file.readAsBytesSync();
    return base64Encode(fileInByte);
  }

  // NetWork Base64 변환
  Future<String> handleNetworkBase64Format(String path) async {
    http.Response response = await http.get(Uri.parse(path));
    return base64Encode(response.bodyBytes);
  }

  // 이미지 배열 삭제
  void handleImageDelete({required int index}) {
    imageList.removeAt(index);
  }

  // 폼 텍스트 다음 포커스 체크
  void handleNextFocusNode({String? type, String? value}) {
    switch (type) {
      case "nickname":
        if (value!.length >= 6) {
          return introduceTextFormFieldFocusNode.requestFocus();
        } else {
          return nicknameTextFormFieldFocusNode.requestFocus();
        }
      case "introduce":
        if (value!.length >= 6) {
          return introduceTextFormFieldFocusNode.requestFocus();
        } else {
          handleUpdateProvider();
        }
        break;
      default:
        return;
    }
  }

  // 폼 텍스트 벨리데이션 체크
  dynamic handleValidator({String? type, String? value}) {
    switch (type) {
      case "nickname":
        if (value!.isEmpty) {
          return "닉네임을 입력해주세요.";
        }
        // 3자리 이상
        if (value.length < 3) {
          return "닉네임을 3자리 이상 입력해주세요.";
        }

        // 8자리 이하 확인
        if (value.length > 8) {
          return "닉네임을 8자리 이하로 입력해주세요.";
        }
        break;
      // case "introduce":
      //   if (value!.isEmpty) {
      //     return "자기소개를 입력해주세요.";
      //   }

      //   // 6자리 이상
      //   if (value.length < 6) {
      //     return "자기소개를 6자리 이상 입력해주세요.";
      //   }
      //   break;
      default:
        return null;
    }

    return null;
  }

  // 리퀘스트 모델(데이터 넘기기)
  Rx<MyPageMemberUpdateRequestModel> updateRequestModel =
      MyPageMemberUpdateRequestModel(
    images: [],
    nickname: "",
  ).obs;

  void handleUpdateRequestModel({
    required dynamic images,
    required String nickname,
  }) {
    updateRequestModel.update((_) {
      _?.images = imageList;
      _?.nickname = nickname;
    });
  }

  // // 조회
  // Future<void> handleInitProvider() async {
  //   try {
  //     await MyPageUserReadProvider().dio().then((value) async {
  //       if (value.status == "success") {
  //         nicknameTextFormFieldController.text = value.user.nickname;
  //         // introduceTextFormFieldController.text = value.user.introduce;

  //         final imageBase64 = await handleNetworkBase64Format(value.user.photo);

  //         imageList.add({
  //           "type": "network",
  //           "path": value.user.photo,
  //           "base64": imageBase64,
  //         });

  //         logger.d(imageList);
  //       } else {
  //         logger.d(value.message);
  //       }
  //     });
  //   } catch (e) {
  //     logger.d(e);
  //   } finally {
  //     isLoaderVisible.value = false;
  //   }
  // }

  // 조회
  Future<void> handleInitProvider() async {
    try {
      await MainInitProvider().dio().then((value) async {
        if (value.status == "success") {
          nicknameTextFormFieldController.text = value.member.nickname;
          // introduceTextFormFieldController.text = value.user.introduce;

          final imageBase64 =
              await handleNetworkBase64Format(value.member.photo);

          imageList.add({
            "type": "network",
            "path": value.member.photo,
            "base64": imageBase64,
          });

          // logger.d(imageList);
        } else {
          logger.d(value.message);
        }
      });
    } catch (e) {
      logger.d(e);
    } finally {
      isLoaderVisible.value = false;
    }
  }

  // 수정
  Future<void> handleUpdateProvider() async {
    try {
      handleUpdateRequestModel(
        images: imageList,
        nickname: nicknameTextFormFieldController.text,
      );

      if (nicknameTextFormFieldController.text.length >= 3 &&
          nicknameTextFormFieldController.text.length <= 8) {
        await MyPageUserUpdateProvider()
            .dio(requestModel: updateRequestModel)
            .then((value) {
          if (value.status == "success") {
            print("Success!");
            isUpdateProvider(true);

            Get.put(MainController()).currentMember.value = value.member;

            // Get.find<MyPageController>().handleInitProvider();
          } else {
            print("Fail!");

            isUpdateProvider(false);
            globalSnackBarWidget(message: value.message);
            reqeustMessage.value = value.message;
          }
        });
      } else {
        globalSnackBarWidget(message: "닉네임을 다시 입력해주세요.");
      }
    } catch (e) {
      logger.d(e);
    }
  }

  @override
  // ignore: unnecessary_overrides
  void onInit() {
    nicknameTextFormFieldFocusNode = FocusNode();
    introduceTextFormFieldFocusNode = FocusNode();
    outlinedButtonFocusNode = FocusNode();

    handleInitProvider();

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
    nicknameTextFormFieldController.dispose();
    // introduceTextFormFieldController.dispose();

    nicknameTextFormFieldFocusNode.dispose();
    introduceTextFormFieldFocusNode.dispose();
    outlinedButtonFocusNode.dispose();

    super.onClose();
  }

  @override
  // ignore: unnecessary_overrides
  InternalFinalCallback<void> get onStart => super.onStart;

  @override
  // ignore: unnecessary_overrides
  InternalFinalCallback<void> get onDelete => super.onDelete;
}
