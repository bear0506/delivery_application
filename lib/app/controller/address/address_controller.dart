import 'package:delivery_service/main.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:delivery_service/app/data/provider/address/address_provider.dart';
import 'package:delivery_service/app/data/model/address/address_model.dart';

import 'package:delivery_service/app/controller/map/map_controller.dart';

class AddressController extends GetxController {
  Rx<ScrollController> listScrollController = ScrollController().obs;
  Rx<ScrollController> scrollController = ScrollController().obs;

  RxString temp1 = "주소 설정".obs;
  RxString temp2 = "주소 입력".obs;
  RxString temp3 = "상세 주소 입력".obs;

  late RxList<AddressResponseModel> addresses = <AddressResponseModel>[].obs;
  Rx<AddressResponseModel> currentAddress = AddressResponseModel(
    idx: 0,
    memIdx: 0,
    name: "",
    address: "",
    detail: "",
    lat: "",
    lng: "",
    active: false,
  ).obs;

  final addressTextFormFieldController = TextEditingController();
  final addressDetailTextFormFieldController = TextEditingController();
  final addressNameTextFormFieldController = TextEditingController();

  RxBool addressDetailCheck = true.obs;
  RxBool addressNameCheck = true.obs;

  RxBool isChecked = false.obs;
  RxString addressLat = "".obs;
  RxString addressLng = "".obs;

  // 주소 추가
  Rx<AddressAddRequestModel> addressAddRequestModel = AddressAddRequestModel(
    name: "",
    address: "",
    detail: "",
    lat: "",
    lng: "",
    active: false,
  ).obs;

  void handleAddressAddRequestModel({
    required String name,
    required String address,
    required String detail,
    required String lat,
    required String lng,
    required bool active,
  }) {
    addressAddRequestModel.update((_) {
      _?.name = name;
      _?.address = address;
      _?.detail = detail;
      _?.lat = lat;
      _?.lng = lng;
      _?.active = active;
    });
  }

  // 전체 주소 조회
  Future<void> handleAddressAllInitProvider() async {
    try {
      await AddressAllInitProvider().dio().then((value) {
        if (value.status == "success") {
          print("주소 전체 조회 성공");
          addresses.assignAll(value.addresses);
          addresses.refresh();
        } else {
          print("주소 전체 조회 실패");
        }
      });
    } catch (e) {
      logger.d(e);
    } finally {
      Future.delayed(
          const Duration(milliseconds: 500),
          // ignore: avoid_print
          () {});
    }
  }

  // 주소 조회
  Future<void> handleAddressInitProvider() async {
    try {
      await AddressInitProvider().dio().then((value) {
        if (value.status == "success") {
          print("주소 조회 성공");

          currentAddress.value = value.address;
        } else {
          print("주소 조회 실패");
        }
      });
    } catch (e) {
      logger.d(e);
    } finally {
      Future.delayed(
          const Duration(milliseconds: 500),
          // ignore: avoid_print
          () {});
    }
  }

  // 주소 추가
  Future<void> handleAddressAddProvider() async {
    if (addressNameTextFormFieldController.text.length == 0)
      addressNameCheck.value = false;
    else
      addressNameCheck.value = true;

    if (addressDetailTextFormFieldController.text.length == 0)
      addressDetailCheck.value = false;
    else
      addressDetailCheck.value = true;

    if (addressNameCheck.value && addressDetailCheck.value) {
      handleAddressAddRequestModel(
        name: addressNameTextFormFieldController.text,
        address: addressTextFormFieldController.text,
        detail: addressDetailTextFormFieldController.text,
        lat: addressLat.value,
        lng: addressLng.value,
        active: isChecked.value,
      );

      try {
        await AddressAddProvider()
            .dio(requestModel: addressAddRequestModel)
            .then((value) {
          if (value.status == "success") {
            print("주소 추가 성공");

            Get.until((route) => Get.currentRoute == "/address");

            isChecked.value = false;
            addressTextFormFieldController.text = "";
            addressDetailTextFormFieldController.text = "";
            addressNameTextFormFieldController.text = "";

            handleAddressAllInitProvider();
          } else {
            print("주소 추가 실패");
          }
        });
      } catch (e) {
        logger.d(e);
      } finally {
        Future.delayed(
            const Duration(milliseconds: 500),
            // ignore: avoid_print
            () {});
      }
    }
  }

  // 주소 선택
  Future<void> handleAddressSelectProvider(int idx) async {
    try {
      await AddressSelectProvider().dio(idx: idx).then((value) {
        if (value.status == "success") {
          print("주소 선택 성공");

          currentAddress.value = value.address;
          Get.put(MapController()).setMapLatLng(
              double.parse(currentAddress.value.lat),
              double.parse(currentAddress.value.lng));

          handleAddressAllInitProvider();
        } else {
          print("주소 선택 실패");
        }
      });
    } catch (e) {
      logger.d(e);
    } finally {
      Future.delayed(
          const Duration(milliseconds: 500),
          // ignore: avoid_print
          () {});
    }
  }

  // 주소 삭제
  Future<void> handleAddressDeleteProvider(int idx) async {
    try {
      await AddressDeleteProvider().dio(idx: idx).then((value) {
        if (value.status == "success") {
          print("주소 삭제 성공");

          handleAddressAllInitProvider();
        } else {
          print("주소 삭제 실패");
        }
      });
    } catch (e) {
      logger.d(e);
    } finally {
      Future.delayed(
          const Duration(milliseconds: 500),
          // ignore: avoid_print
          () {});
    }
  }

  @override
  // ignore: unnecessary_overrides
  void onInit() async {
    handleAddressAllInitProvider();
    handleAddressInitProvider();

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
