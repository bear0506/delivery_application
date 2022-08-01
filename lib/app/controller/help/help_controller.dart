import 'package:get/get.dart';

class HelpController extends GetxController {
  // 스켈레톤(쉬머)
  RxBool isLoaderVisible = true.obs;

  RxList<dynamic> fqa = [
    {
      "title": "안드로이드 OS 5.1.1 (Lolipop)이하 버전 업데이트 지원 중단 안내",
      "img": "assets/icons/no,ze.png",
      "contentTitle": "# 한 눈에 보기 편해진 방 리스트!!",
      "content": '''기존에 보기 너무 불편했던 방리스트...

여러분들의 의견을 모아 새롭게 바뀌었습니다!

현재 위치에서 가까운 순서대로 자동정렬, 남은 시간이 적은 순으로 정렬도 가능합니다!

보다 쉽고 간편하게 배달띱을 이용해보세요!''',
    },
    {
      "title": "안드로이드 OS 5.1.1 (Lolipop)이하 버전 업데이트 지원 중단 안내",
      "img": "assets/icons/no,ze.png",
      "contentTitle": "# 한 눈에 보기 편해진 방 리스트!!",
      "content": '''기존에 보기 너무 불편했던 방리스트...

여러분들의 의견을 모아 새롭게 바뀌었습니다!

현재 위치에서 가까운 순서대로 자동정렬, 남은 시간이 적은 순으로 정렬도 가능합니다!

보다 쉽고 간편하게 배달띱을 이용해보세요!''',
    },
    {
      "title": "안드로이드 OS 5.1.1 (Lolipop)이하 버전 업데이트 지원 중단 안내",
      "img": "assets/icons/no,ze.png",
      "contentTitle": "# 한 눈에 보기 편해진 방 리스트!!",
      "content": '''기존에 보기 너무 불편했던 방리스트...

여러분들의 의견을 모아 새롭게 바뀌었습니다!

현재 위치에서 가까운 순서대로 자동정렬, 남은 시간이 적은 순으로 정렬도 가능합니다!

보다 쉽고 간편하게 배달띱을 이용해보세요!''',
    },
    {
      "title": "안드로이드 OS 5.1.1 (Lolipop)이하 버전 업데이트 지원 중단 안내",
      "img": "assets/icons/no,ze.png",
      "contentTitle": "# 한 눈에 보기 편해진 방 리스트!!",
      "content": '''기존에 보기 너무 불편했던 방리스트...

여러분들의 의견을 모아 새롭게 바뀌었습니다!

현재 위치에서 가까운 순서대로 자동정렬, 남은 시간이 적은 순으로 정렬도 가능합니다!

보다 쉽고 간편하게 배달띱을 이용해보세요!''',
    },
    {
      "title": "안드로이드 OS 5.1.1 (Lolipop)이하 버전 업데이트 지원 중단 안내",
      "img": "assets/icons/no,ze.png",
      "contentTitle": "# 한 눈에 보기 편해진 방 리스트!!",
      "content": '''기존에 보기 너무 불편했던 방리스트...

여러분들의 의견을 모아 새롭게 바뀌었습니다!

현재 위치에서 가까운 순서대로 자동정렬, 남은 시간이 적은 순으로 정렬도 가능합니다!

보다 쉽고 간편하게 배달띱을 이용해보세요!''',
    },
    {
      "title": "안드로이드 OS 5.1.1 (Lolipop)이하 버전 업데이트 지원 중단 안내",
      "img": "assets/icons/no,ze.png",
      "contentTitle": "# 한 눈에 보기 편해진 방 리스트!!",
      "content": '''기존에 보기 너무 불편했던 방리스트...

여러분들의 의견을 모아 새롭게 바뀌었습니다!

현재 위치에서 가까운 순서대로 자동정렬, 남은 시간이 적은 순으로 정렬도 가능합니다!

보다 쉽고 간편하게 배달띱을 이용해보세요!''',
    },
    {
      "title": "안드로이드 OS 5.1.1 (Lolipop)이하 버전 업데이트 지원 중단 안내",
      "img": "assets/icons/no,ze.png",
      "contentTitle": "# 한 눈에 보기 편해진 방 리스트!!",
      "content": '''기존에 보기 너무 불편했던 방리스트...

여러분들의 의견을 모아 새롭게 바뀌었습니다!

현재 위치에서 가까운 순서대로 자동정렬, 남은 시간이 적은 순으로 정렬도 가능합니다!

보다 쉽고 간편하게 배달띱을 이용해보세요!''',
    },
    {
      "title": "안드로이드 OS 5.1.1 (Lolipop)이하 버전 업데이트 지원 중단 안내",
      "img": "assets/icons/no,ze.png",
      "contentTitle": "# 한 눈에 보기 편해진 방 리스트!!",
      "content": '''기존에 보기 너무 불편했던 방리스트...

여러분들의 의견을 모아 새롭게 바뀌었습니다!

현재 위치에서 가까운 순서대로 자동정렬, 남은 시간이 적은 순으로 정렬도 가능합니다!

보다 쉽고 간편하게 배달띱을 이용해보세요!''',
    },
    {
      "title": "안드로이드 OS 5.1.1 (Lolipop)이하 버전 업데이트 지원 중단 안내",
      "img": "assets/icons/no,ze.png",
      "contentTitle": "# 한 눈에 보기 편해진 방 리스트!!",
      "content": '''기존에 보기 너무 불편했던 방리스트...

여러분들의 의견을 모아 새롭게 바뀌었습니다!

현재 위치에서 가까운 순서대로 자동정렬, 남은 시간이 적은 순으로 정렬도 가능합니다!

보다 쉽고 간편하게 배달띱을 이용해보세요!''',
    },
    {
      "title": "안드로이드 OS 5.1.1 (Lolipop)이하 버전 업데이트 지원 중단 안내",
      "img": "assets/icons/no,ze.png",
      "contentTitle": "# 한 눈에 보기 편해진 방 리스트!!",
      "content": '''기존에 보기 너무 불편했던 방리스트...

여러분들의 의견을 모아 새롭게 바뀌었습니다!

현재 위치에서 가까운 순서대로 자동정렬, 남은 시간이 적은 순으로 정렬도 가능합니다!

보다 쉽고 간편하게 배달띱을 이용해보세요!''',
    },
  ].obs;

  RxList<dynamic> detail = [
    {
      "title": "안드로이드 OS 5.1.1 (Lolipop)이하 버전 업데이트 지원 중단 안내",
      "img": "assets/icons/no,ze.png",
      "contentTitle": "# 한 눈에 보기 편해진 방 리스트!!",
      "content": '''기존에 보기 너무 불편했던 방리스트...

여러분들의 의견을 모아 새롭게 바뀌었습니다!

현재 위치에서 가까운 순서대로 자동정렬, 남은 시간이 적은 순으로 정렬도 가능합니다!

보다 쉽고 간편하게 배달띱을 이용해보세요!''',
    },
    {
      "title": "안드로이드 OS 5.1.1 (Lolipop)이하 버전 업데이트 지원 중단 안내",
      "img": "assets/icons/no,ze.png",
      "contentTitle": "# 한 눈에 보기 편해진 방 리스트!!",
      "content": '''기존에 보기 너무 불편했던 방리스트...

여러분들의 의견을 모아 새롭게 바뀌었습니다!

현재 위치에서 가까운 순서대로 자동정렬, 남은 시간이 적은 순으로 정렬도 가능합니다!

보다 쉽고 간편하게 배달띱을 이용해보세요!''',
    },
    {
      "title": "안드로이드 OS 5.1.1 (Lolipop)이하 버전 업데이트 지원 중단 안내",
      "img": "assets/icons/no,ze.png",
      "contentTitle": "# 한 눈에 보기 편해진 방 리스트!!",
      "content": '''기존에 보기 너무 불편했던 방리스트...

여러분들의 의견을 모아 새롭게 바뀌었습니다!

현재 위치에서 가까운 순서대로 자동정렬, 남은 시간이 적은 순으로 정렬도 가능합니다!

보다 쉽고 간편하게 배달띱을 이용해보세요!''',
    },
    {
      "title": "안드로이드 OS 5.1.1 (Lolipop)이하 버전 업데이트 지원 중단 안내",
      "img": "assets/icons/no,ze.png",
      "contentTitle": "# 한 눈에 보기 편해진 방 리스트!!",
      "content": '''기존에 보기 너무 불편했던 방리스트...

여러분들의 의견을 모아 새롭게 바뀌었습니다!

현재 위치에서 가까운 순서대로 자동정렬, 남은 시간이 적은 순으로 정렬도 가능합니다!

보다 쉽고 간편하게 배달띱을 이용해보세요!''',
    },
    {
      "title": "안드로이드 OS 5.1.1 (Lolipop)이하 버전 업데이트 지원 중단 안내",
      "img": "assets/icons/no,ze.png",
      "contentTitle": "# 한 눈에 보기 편해진 방 리스트!!",
      "content": '''기존에 보기 너무 불편했던 방리스트...

여러분들의 의견을 모아 새롭게 바뀌었습니다!

현재 위치에서 가까운 순서대로 자동정렬, 남은 시간이 적은 순으로 정렬도 가능합니다!

보다 쉽고 간편하게 배달띱을 이용해보세요!''',
    },
    {
      "title": "안드로이드 OS 5.1.1 (Lolipop)이하 버전 업데이트 지원 중단 안내",
      "img": "assets/icons/no,ze.png",
      "contentTitle": "# 한 눈에 보기 편해진 방 리스트!!",
      "content": '''기존에 보기 너무 불편했던 방리스트...

여러분들의 의견을 모아 새롭게 바뀌었습니다!

현재 위치에서 가까운 순서대로 자동정렬, 남은 시간이 적은 순으로 정렬도 가능합니다!

보다 쉽고 간편하게 배달띱을 이용해보세요!''',
    },
    {
      "title": "안드로이드 OS 5.1.1 (Lolipop)이하 버전 업데이트 지원 중단 안내",
      "img": "assets/icons/no,ze.png",
      "contentTitle": "# 한 눈에 보기 편해진 방 리스트!!",
      "content": '''기존에 보기 너무 불편했던 방리스트...

여러분들의 의견을 모아 새롭게 바뀌었습니다!

현재 위치에서 가까운 순서대로 자동정렬, 남은 시간이 적은 순으로 정렬도 가능합니다!

보다 쉽고 간편하게 배달띱을 이용해보세요!''',
    },
    {
      "title": "안드로이드 OS 5.1.1 (Lolipop)이하 버전 업데이트 지원 중단 안내",
      "img": "assets/icons/no,ze.png",
      "contentTitle": "# 한 눈에 보기 편해진 방 리스트!!",
      "content": '''기존에 보기 너무 불편했던 방리스트...

여러분들의 의견을 모아 새롭게 바뀌었습니다!

현재 위치에서 가까운 순서대로 자동정렬, 남은 시간이 적은 순으로 정렬도 가능합니다!

보다 쉽고 간편하게 배달띱을 이용해보세요!''',
    },
    {
      "title": "안드로이드 OS 5.1.1 (Lolipop)이하 버전 업데이트 지원 중단 안내",
      "img": "assets/icons/no,ze.png",
      "contentTitle": "# 한 눈에 보기 편해진 방 리스트!!",
      "content": '''기존에 보기 너무 불편했던 방리스트...

여러분들의 의견을 모아 새롭게 바뀌었습니다!

현재 위치에서 가까운 순서대로 자동정렬, 남은 시간이 적은 순으로 정렬도 가능합니다!

보다 쉽고 간편하게 배달띱을 이용해보세요!''',
    },
    {
      "title": "안드로이드 OS 5.1.1 (Lolipop)이하 버전 업데이트 지원 중단 안내",
      "img": "assets/icons/no,ze.png",
      "contentTitle": "# 한 눈에 보기 편해진 방 리스트!!",
      "content": '''기존에 보기 너무 불편했던 방리스트...

여러분들의 의견을 모아 새롭게 바뀌었습니다!

현재 위치에서 가까운 순서대로 자동정렬, 남은 시간이 적은 순으로 정렬도 가능합니다!

보다 쉽고 간편하게 배달띱을 이용해보세요!''',
    },
  ].obs;

  @override
  // ignore: unnecessary_overrides
  void onInit() {
    // handleInitProvider();
    Future.delayed(
        const Duration(milliseconds: 100), () => isLoaderVisible.value = false);

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
