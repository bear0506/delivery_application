// import 'package:get/get.dart';

// import 'package:delivery_service/app/ui/splash/splash_ui.dart';
// import 'package:delivery_service/app/binding/splash/splash_binding.dart';

// import 'package:delivery_service/app/ui/main/main_ui.dart';
// import 'package:delivery_service/app/binding/main/main_binding.dart';

// import 'package:delivery_service/app/ui/signin/signin_ui.dart';
// import 'package:delivery_service/app/binding/signin/signin_binding.dart';

// import 'package:delivery_service/app/ui/success/success_ui.dart';
// import 'package:delivery_service/app/binding/success/success_binding.dart';

// import 'package:delivery_service/app/ui/signup/signup_terms_ui.dart';
// import 'package:delivery_service/app/ui/signup/signup_phone_ui.dart';
// import 'package:delivery_service/app/ui/signup/signup_info_ui.dart';
// import 'package:delivery_service/app/ui/signup/signup_password_ui.dart';
// import 'package:delivery_service/app/binding/signup/signup_binding.dart';

// import 'package:delivery_service/app/ui/store/store_list_ui.dart';
// import 'package:delivery_service/app/ui/store/store_ui.dart';
// import 'package:delivery_service/app/ui/store/store_menu_detail_ui.dart';
// import 'package:delivery_service/app/ui/store/store_order_ui.dart';
// import 'package:delivery_service/app/binding/store/store_binding.dart';

// import 'package:delivery_service/app/ui/room/room_setting_ui.dart';
// import 'package:delivery_service/app/ui/room/room_ui.dart';
// import 'package:delivery_service/app/binding/room/room_binding.dart';

// import 'package:delivery_service/app/routes/route.dart';

// class Pages {
//   static final routes = [
//     GetPage(
//       title: "스플래시 화면",
//       name: Routes.splash,
//       page: () => const SplashUi(),
//       binding: SplashBinding(),
//     ),
//     GetPage(
//       title: "메인 화면",
//       name: Routes.main,
//       page: () => const MainUi(),
//       binding: MainBinding(),
//     ),
//     GetPage(
//       title: "로그인 화면",
//       name: Routes.signin,
//       page: () => const SignInUi(),
//       binding: SignInBinding(),
//     ),
//     GetPage(
//       title: "개인정보처리방침 및 약관동의",
//       name: Routes.signupTerms,
//       page: () => const SignUpTermsUi(),
//       binding: SignUpBinding(),
//     ),
//     GetPage(
//       title: "핸드폰 인증",
//       name: Routes.signupPhone,
//       page: () => const SignUpPhoneUi(),
//       binding: SignUpBinding(),
//     ),
//     GetPage(
//       title: "닉네임 및 이메일 정보 입력",
//       name: Routes.signupInfo,
//       page: () => SignUpInfoUi(),
//       binding: SignUpBinding(),
//     ),
//     GetPage(
//       title: "비밀번호 설정 후 회원가입 완료",
//       name: Routes.signupPassword,
//       page: () => SignUpPasswordUi(),
//       binding: SignUpBinding(),
//     ),
//     GetPage(
//       title: "가게 리스트 화면",
//       name: Routes.store,
//       page: () => StoreUi(),
//       binding: StoreBinding(),
//     ),
//     GetPage(
//       title: "가게 정보",
//       name: Routes.storeList,
//       page: () => StoreListUi(),
//       binding: StoreBinding(),
//     ),
//     GetPage(
//       title: "가게 메뉴",
//       name: Routes.storeMenuDetail,
//       page: () => StoreMenuDetailUi(),
//       binding: StoreBinding(),
//     ),
//     GetPage(
//       title: "메뉴 주문",
//       name: Routes.storeOrder,
//       page: () => const StoreOrderUi(),
//       binding: StoreBinding(),
//     ),
//     GetPage(
//       title: "방 만들기",
//       name: Routes.roomSetting,
//       page: () => const RoomSettingUi(),
//       binding: RoomBinding(),
//     ),
//     GetPage(
//       title: "방 정보",
//       name: Routes.room,
//       page: () => RoomUi(),
//       binding: RoomBinding(),
//     ),
//     // GetPage(
//     //   title: "이메일 및 비밀번호 찾기 화면",
//     //   name: Routes.find,
//     //   page: () => const FindUi(),
//     //   binding: FindBinding(),
//     // ),
//     // GetPage(
//     //   title: "메인 화면",
//     //   name: Routes.main,
//     //   page: () => const MainUi(),
//     //   binding: MainBinding(),
//     // ),
//     // GetPage(
//     //   title: "매물 화면",
//     //   name: Routes.house,
//     //   page: () => const HouseUi(),
//     //   binding: HouseBinding(),
//     // ),
//     // GetPage(
//     //   title: "매물 -> 상호교환 화면",
//     //   name: Routes.houseMutualTrade,
//     //   page: () => const HouseMutualTradeUi(),
//     //   binding: HouseMutualTradeBinding(),
//     // ),
//     // GetPage(
//     //   title: "매물 -> 단일여행 화면",
//     //   name: Routes.houseSingle,
//     //   page: () => const HouseSingleTradeUi(),
//     //   binding: HouseSingleTradeBinding(),
//     // ),
//     // GetPage(
//     //   title: "매물 -> 교환요청 완료 화면",
//     //   name: Routes.houseTradeSuccess,
//     //   page: () => const HouseTradeSuccessUi(),
//     //   binding: HouseTradeSuccessBinding(),
//     // ),
//     // GetPage(
//     //   title: "매물 -> 후기 모두보기 화면",
//     //   name: Routes.houseReviewAll,
//     //   page: () => ReviewAllUi(),
//     //   binding: ReviewAllBinding(),
//     // ),
//     // GetPage(
//     //   title: "유저 -> 매물 모두보기 화면",
//     //   name: Routes.houseAll,
//     //   page: () => const HouseAllUi(),
//     //   binding: HouseAllBinding(),
//     // ),
//     // GetPage(
//     //   title: "유저 -> 후기 모두보기 화면",
//     //   name: Routes.reviewAll,
//     //   page: () => ReviewAllUi(),
//     //   binding: ReviewAllBinding(),
//     // ),
//     // GetPage(
//     //   title: "유저(프로필) 화면",
//     //   name: Routes.user,
//     //   page: () => UserUi(),
//     //   binding: UserBinding(),
//     // ),
//     // GetPage(
//     //   title: "메인 -> 마이페이지 화면",
//     //   name: Routes.mypage,
//     //   page: () => const MyPageUi(),
//     //   binding: MyPageBinding(),
//     // ),
//     // GetPage(
//     //   title: "메인 -> 검색페이지 화면",
//     //   name: Routes.search,
//     //   page: () => const SearchUi(),
//     //   binding: SearchBinding(),
//     // ),
//     // GetPage(
//     //   title: "메인 -> 채팅페이지 화면",
//     //   name: Routes.chat,
//     //   page: () => const ChatUi(),
//     //   binding: ChatBinding(),
//     // ),
//     // GetPage(
//     //   title: "채팅 -> 채팅페이지 화면",
//     //   name: Routes.chatDetail,
//     //   page: () => const ChatDetailUi(),
//     //   binding: ChatDetailBinding(),
//     // ),
//     // GetPage(
//     //   title: "검색 -> 매물페이지 화면",
//     //   name: Routes.searchHouse,
//     //   page: () => const SearchHouseUi(),
//     //   binding: SearchHouseBinding(),
//     // ),
//     // GetPage(
//     //   title: "마이페이지 -> 더보기 화면",
//     //   name: Routes.more,
//     //   page: () => const MoreUi(),
//     // ),
//     // GetPage(
//     //   title: "마이페이지 -> 내집관리 화면",
//     //   name: Routes.myPageManagementHouse,
//     //   page: () => const ManageMentHouseUi(),
//     //   binding: ManagementHouseBinding(),
//     // ),
//     // GetPage(
//     //   title: "마이페이지 -> 내집관리 화면 -> 내집관리 추가",
//     //   name: Routes.myPageManagementHouseCreate,
//     //   page: () => const ManageMentHouseCreateUi(),
//     //   binding: ManagementHouseCreateBinding(),
//     // ),
//     // GetPage(
//     //   title: "마이페이지 -> 내집관리 화면 -> 내집관리 수정",
//     //   name: Routes.myPageManagementHouseUpdate,
//     //   page: () => const ManageMentHouseUpdateUi(),
//     //   binding: ManagementHouseUpdateBinding(),
//     // ),
//     // GetPage(
//     //   title: "마이페이지 -> 교환내역 화면",
//     //   name: Routes.mypageTradeHistory,
//     //   page: () => const MyPageTradeHistoryUi(),
//     //   binding: MyPageTradeHistoryBinding(),
//     // ),
//     // GetPage(
//     //   title: "마이페이지 -> 진행중인 교환 요청내역 화면",
//     //   name: Routes.mypageTradeAll,
//     //   page: () => const MyPageTradeAllUi(),
//     //   binding: MyPageTradeAllBinding(),
//     // ),
//     // GetPage(
//     //   title: "마이페이지 -> 찜 목록 더보기 화면",
//     //   name: Routes.mypageWishListAll,
//     //   page: () => const MyPageWishListAllUi(),
//     //   binding: MyPageWishlistAllBinding(),
//     // ),
//     // GetPage(
//     //   title: "마이페이지 -> 최근 조회 내역 화면",
//     //   name: Routes.mypageSearchRecentAll,
//     //   page: () => const MyPageSearchRecentAllUi(),
//     //   binding: MyPageSearchRecentAllBinding(),
//     // ),
//     // GetPage(
//     //   title: "더보기 -> 프로필 관리 화면",
//     //   name: Routes.moreProfileUpdate,
//     //   page: () => const MoreProfileUpdateUi(),
//     //   binding: MoreProfileUpdateBinding(),
//     // ),
//     // GetPage(
//     //   title: "더보기 -> 개인정보 관리 화면",
//     //   name: Routes.morePrivacyUpdate,
//     //   page: () => const MorePrivacyUpdateUi(),
//     //   binding: MorePrivacyUpdateBinding(),
//     // ),
//     // GetPage(
//     //   title: "더보기 -> 비밀번호 관리 화면",
//     //   name: Routes.morePasswordUpdate,
//     //   page: () => const MorePasswordUpdateUi(),
//     //   binding: MorePasswordUpdateBinding(),
//     // ),
//     // GetPage(
//     //   title: "더보기 -> 공지사항 화면",
//     //   name: Routes.notice,
//     //   page: () => NoticeUi(),
//     //   binding: NoticeBinding(),
//     // ),
//     // GetPage(
//     //   title: "더보기 -> 이벤트 화면",
//     //   name: Routes.event,
//     //   page: () => EventUi(),
//     //   binding: EventBinding(),
//     // ),
//     // GetPage(
//     //   title: "더보기 -> 고객센터/도움말 화면",
//     //   name: Routes.moreHelp,
//     //   page: () => const MoreHelpUi(),
//     // ),
//     // GetPage(
//     //   title: "고객센터/도움말 -> 도움말 화면",
//     //   name: Routes.help,
//     //   page: () => HelpUi(),
//     //   binding: HelpBinding(),
//     // ),
//     // GetPage(
//     //   title: "고객센터/도움말 -> 자주하는 질문 화면",
//     //   name: Routes.qna,
//     //   page: () => QnaUi(),
//     //   binding: QnaBinding(),
//     // ),
//     GetPage(
//       title: "완료 화면",
//       name: Routes.success,
//       page: () => const SuccessUi(),
//       binding: SuccessBinding(),
//     ),
//   ];
// }

// // import 'package:flutter/app/widgets.dart';
// // //메인
// // import 'package:zipting/app/ui/main/main_screen.dart';
// // //스플래쉬
// // import 'package:zipting/app/ui/splash/SplashScreen.dart';
// // //로그인
// // import 'package:zipting/app/ui/signin/SigninScreen.dart';
// // //회원가입
// // import 'package:zipting/app/ui/signup/signup_screen.dart';
// // //룸 디테일
// // import 'package:zipting/app/ui/room_detail/room_detail_screen.dart';
// // import 'package:zipting/app/ui/opponent/opponent_screen.dart';
// // import 'package:zipting/app/ui/opponent/opponent_house_screen.dart';
// // import 'package:zipting/app/ui/opponent/opponent_review_screen.dart';
// // import 'package:zipting/app/ui/opponent/opponent_review_detail_screen.dart';
// // import 'package:zipting/app/ui/opponent/OpponentMoreScreen.dart';

// // final Map<String, WidgetBuilder> routes = {
// //   SplashScreen.routeName: (context) => SplashScreen(),
// //   SigninScreen.routeName: (context) => SigninScreen(),
// //   SignupScreen.routeName: (context) => SignupScreen(),
// //   MainScreen.routeName: (context) => MainScreen(),
// //   RoomDetailScreen.routeName: (context) => RoomDetailScreen(),
// //   OpponentScreen.routeName: (context) => OpponentScreen(),
// //   OpponentHouseScreen.routeName: (context) => OpponentHouseScreen(),
// //   OpponentReviewScreen.routeName: (context) => OpponentReviewScreen(),
// //   OpponentReviewDetailScreen.routeName: (context) =>
// //       OpponentReviewDetailScreen(),
// //   OpponentMoreScreen.routeName: (context) => OpponentMoreScreen()
// // };

import 'package:get/get.dart';

import 'package:delivery_service/app/ui/splash/splash_ui.dart';
import 'package:delivery_service/app/binding/splash/splash_binding.dart';

import 'package:delivery_service/app/ui/success/success_ui.dart';
import 'package:delivery_service/app/binding/success/success_binding.dart';

import 'package:delivery_service/app/ui/main/main_ui.dart';
import 'package:delivery_service/app/binding/main/main_binding.dart';

import 'package:delivery_service/app/ui/signin/signin_ui.dart';
import 'package:delivery_service/app/binding/signin/signin_binding.dart';

import 'package:delivery_service/app/ui/signup/signup_terms_ui.dart';
import 'package:delivery_service/app/ui/signup/signup_phone_ui.dart';
import 'package:delivery_service/app/ui/signup/signup_info_ui.dart';
import 'package:delivery_service/app/ui/signup/signup_password_ui.dart';
import 'package:delivery_service/app/binding/signup/signup_binding.dart';

import 'package:delivery_service/app/ui/mypage/mypage_ui.dart';
import 'package:delivery_service/app/binding/mypage/mypage_binding.dart';

import 'package:delivery_service/app/ui/mypage/mypage_user_update_ui.dart';
import 'package:delivery_service/app/binding/mypage/mypage_user_update_binding.dart';
import 'package:delivery_service/app/ui/mypage/mypage_order_history_ui.dart';
import 'package:delivery_service/app/binding/mypage/mypage_order_history_binding.dart';
import 'package:delivery_service/app/ui/mypage/mypage_order_history_detail_ui.dart';
import 'package:delivery_service/app/ui/mypage/mypage_favorites_ui.dart';
import 'package:delivery_service/app/binding/mypage/mypage_favoirtes_binding.dart';

import 'package:delivery_service/app/ui/review/review_write_ui.dart';
import 'package:delivery_service/app/binding/review/review_binding.dart';

import 'package:delivery_service/app/ui/notice/notice_ui.dart';
import 'package:delivery_service/app/binding/notice/notice_binding.dart';

import 'package:delivery_service/app/ui/event/event_ui.dart';
import 'package:delivery_service/app/ui/event/event_detail_ui.dart';
import 'package:delivery_service/app/binding/event/event_binding.dart';

import 'package:delivery_service/app/ui/help/help_ui.dart';
import 'package:delivery_service/app/ui/help/help_inquiry_ui.dart';
import 'package:delivery_service/app/ui/help/help_fqa_ui.dart';
import 'package:delivery_service/app/ui/help/help_detail.dart';
import 'package:delivery_service/app/binding/help/help_binding.dart';

import 'package:delivery_service/app/ui/setting/setting_ui.dart';
import 'package:delivery_service/app/binding/setting/setting_binding.dart';

import 'package:delivery_service/app/ui/store/store_list_ui.dart';
import 'package:delivery_service/app/ui/store/store_ui.dart';
import 'package:delivery_service/app/ui/store/store_menu_detail_ui.dart';
import 'package:delivery_service/app/binding/store/store_binding.dart';

import 'package:delivery_service/app/ui/order/order_ui.dart';
import 'package:delivery_service/app/ui/order/order_result_ui.dart';
import 'package:delivery_service/app/binding/order/order_binding.dart';

import 'package:delivery_service/app/ui/room/room_setting_ui.dart';
import 'package:delivery_service/app/ui/room/room_ui.dart';
import 'package:delivery_service/app/ui/room/room_result_ui.dart';
import 'package:delivery_service/app/binding/room/room_binding.dart';

import 'package:delivery_service/app/ui/address/address_ui.dart';
import 'package:delivery_service/app/ui/address/address_detail_ui.dart';
import 'package:delivery_service/app/binding/address/address_binding.dart';

import 'package:delivery_service/app/routes/route.dart';

class Pages {
  static final routes = [
    GetPage(
      title: "스플래시 화면",
      name: Routes.splash,
      page: () => const SplashUi(),
      binding: SplashBinding(),
    ),
    GetPage(
      title: "메인 화면",
      name: Routes.main,
      page: () => const MainUi(),
      binding: MainBinding(),
    ),
    GetPage(
      title: "로그인 화면",
      name: Routes.signin,
      page: () => const SignInUi(),
      binding: SignInBinding(),
    ),
    GetPage(
      title: "개인정보처리방침 및 약관동의",
      name: Routes.signupTerms,
      page: () => const SignUpTermsUi(),
      binding: SignUpBinding(),
    ),
    GetPage(
      title: "핸드폰 인증",
      name: Routes.signupPhone,
      page: () => SignUpPhoneUi(),
      binding: SignUpBinding(),
    ),
    GetPage(
      title: "닉네임 및 이메일 정보 입력",
      name: Routes.signupInfo,
      page: () => SignUpInfoUi(),
      binding: SignUpBinding(),
    ),
    GetPage(
      title: "비밀번호 설정 후 회원가입 완료",
      name: Routes.signupPassword,
      page: () => SignUpPasswordUi(),
      binding: SignUpBinding(),
    ),
    GetPage(
      title: "마이페이지",
      name: Routes.mypage,
      page: () => MyPageUi(),
      binding: MyPageBinding(),
    ),
    GetPage(
      title: "마이페이지 -> 유저 편집 화면",
      name: Routes.mypageUserUpdate,
      page: () => MyPageUserUpdateUi(),
      binding: MyPageUserEditBinding(),
    ),
    GetPage(
      title: "마이페이지 -> 주문내역 화면",
      name: Routes.mypageOrderHistory,
      page: () => const MyPageOrderHistoryUi(),
      binding: MyPageOrderHistoryBinding(),
    ),
    GetPage(
      title: "마이페이지 -> 주문내역 화면 -> 주문내역 상세 화면",
      name: Routes.mypageOrderHistoryDetail,
      page: () => const MyPageOrderHistoryDetailUi(),
      binding: MyPageOrderHistoryBinding(),
    ),
    GetPage(
      title: "리뷰작성",
      name: Routes.mypageReviewWrite,
      page: () => const ReviewWriteUi(),
      binding: ReviewBinding(),
    ),
    GetPage(
      title: "마이페이지 -> 즐겨찾기 화면",
      name: Routes.mypageFavoritesAll,
      page: () => const MyPageFavoritesUi(),
      binding: MyPageFavoritesBinding(),
    ),
    GetPage(
      title: "공지사항",
      name: Routes.notice,
      page: () => NoticeUi(),
      binding: NoticeBinding(),
    ),
    GetPage(
      title: "이벤트",
      name: Routes.event,
      page: () => EventUi(),
      binding: EventBinding(),
    ),
    GetPage(
      title: "이벤트 -> 이벤트 페이지",
      name: Routes.eventDeatil,
      page: () => EventDetailUi(),
      binding: EventBinding(),
    ),
    GetPage(
      title: "고객지원",
      name: Routes.help,
      page: () => HelpUi(),
      binding: HelpBinding(),
    ),
    GetPage(
      title: "고객지원 -> 1:1 문의",
      name: Routes.helpInquiry,
      page: () => HelpInquiryUi(),
      binding: HelpBinding(),
    ),
    GetPage(
      title: "고객지원 -> FQA",
      name: Routes.helpFQA,
      page: () => HelpFQAUi(),
      binding: HelpBinding(),
    ),
    GetPage(
      title: "고객지원 -> 도움말",
      name: Routes.helpDetail,
      page: () => HelpDetailUi(),
      binding: HelpBinding(),
    ),
    GetPage(
      title: "설정",
      name: Routes.setting,
      page: () => SettingUi(),
      binding: SettingBinding(),
    ),
    GetPage(
      title: "가게 리스트 화면",
      name: Routes.store,
      page: () => StoreUi(),
      binding: StoreBinding(),
    ),
    GetPage(
      title: "가게 정보",
      name: Routes.storeList,
      page: () => StoreListUi(),
      binding: StoreBinding(),
    ),
    GetPage(
      title: "가게 메뉴",
      name: Routes.storeMenuDetail,
      page: () => StoreMenuDetailUi(),
      binding: StoreBinding(),
    ),
    GetPage(
      title: "메뉴 주문",
      name: Routes.order,
      page: () => const OrderUi(),
      binding: OrderBinding(),
    ),
    GetPage(
      title: "메뉴 주문 결과",
      name: Routes.orderResult,
      page: () => const OrderResultUi(),
      binding: OrderBinding(),
    ),
    GetPage(
      title: "방 만들기",
      name: Routes.roomSetting,
      page: () => const RoomSettingUi(),
      binding: RoomBinding(),
    ),
    GetPage(
      title: "방 만들기 결과",
      name: Routes.roomResult,
      page: () => const RoomResultUi(),
      binding: RoomBinding(),
    ),
    GetPage(
      title: "방 정보",
      name: Routes.room,
      page: () => RoomUi(),
      binding: RoomBinding(),
    ),
    GetPage(
      title: "배달주소 정보",
      name: Routes.address,
      page: () => AddressUi(),
      binding: AddressBinding(),
    ),
    GetPage(
      title: "배달 상세주소 입력",
      name: Routes.addressDetail,
      page: () => AddressDetailUi(),
      binding: AddressBinding(),
      transition: Transition.rightToLeft,
    ),
    // GetPage(
    //   title: "이메일 및 비밀번호 찾기 화면",
    //   name: Routes.find,
    //   page: () => const FindUi(),
    //   binding: FindBinding(),
    // ),
    // GetPage(
    //   title: "메인 화면",
    //   name: Routes.main,
    //   page: () => const MainUi(),
    //   binding: MainBinding(),
    // ),
    // GetPage(
    //   title: "매물 화면",
    //   name: Routes.house,
    //   page: () => const HouseUi(),
    //   binding: HouseBinding(),
    // ),
    // GetPage(
    //   title: "매물 -> 상호교환 화면",
    //   name: Routes.houseMutualTrade,
    //   page: () => const HouseMutualTradeUi(),
    //   binding: HouseMutualTradeBinding(),
    // ),
    // GetPage(
    //   title: "매물 -> 단일여행 화면",
    //   name: Routes.houseSingle,
    //   page: () => const HouseSingleTradeUi(),
    //   binding: HouseSingleTradeBinding(),
    // ),
    // GetPage(
    //   title: "매물 -> 교환요청 완료 화면",
    //   name: Routes.houseTradeSuccess,
    //   page: () => const HouseTradeSuccessUi(),
    //   binding: HouseTradeSuccessBinding(),
    // ),
    // GetPage(
    //   title: "매물 -> 후기 모두보기 화면",
    //   name: Routes.houseReviewAll,
    //   page: () => ReviewAllUi(),
    //   binding: ReviewAllBinding(),
    // ),
    // GetPage(
    //   title: "유저 -> 매물 모두보기 화면",
    //   name: Routes.houseAll,
    //   page: () => const HouseAllUi(),
    //   binding: HouseAllBinding(),
    // ),
    // GetPage(
    //   title: "유저 -> 후기 모두보기 화면",
    //   name: Routes.reviewAll,
    //   page: () => ReviewAllUi(),
    //   binding: ReviewAllBinding(),
    // ),
    // GetPage(
    //   title: "유저(프로필) 화면",
    //   name: Routes.user,
    //   page: () => UserUi(),
    //   binding: UserBinding(),
    // ),
    // GetPage(
    //   title: "메인 -> 마이페이지 화면",
    //   name: Routes.mypage,
    //   page: () => const MyPageUi(),
    //   binding: MyPageBinding(),
    // ),
    // GetPage(
    //   title: "메인 -> 검색페이지 화면",
    //   name: Routes.search,
    //   page: () => const SearchUi(),
    //   binding: SearchBinding(),
    // ),
    // GetPage(
    //   title: "메인 -> 채팅페이지 화면",
    //   name: Routes.chat,
    //   page: () => const ChatUi(),
    //   binding: ChatBinding(),
    // ),
    // GetPage(
    //   title: "채팅 -> 채팅페이지 화면",
    //   name: Routes.chatDetail,
    //   page: () => const ChatDetailUi(),
    //   binding: ChatDetailBinding(),
    // ),
    // GetPage(
    //   title: "검색 -> 매물페이지 화면",
    //   name: Routes.searchHouse,
    //   page: () => const SearchHouseUi(),
    //   binding: SearchHouseBinding(),
    // ),
    // GetPage(
    //   title: "마이페이지 -> 더보기 화면",
    //   name: Routes.more,
    //   page: () => const MoreUi(),
    // ),
    // GetPage(
    //   title: "마이페이지 -> 내집관리 화면",
    //   name: Routes.myPageManagementHouse,
    //   page: () => const ManageMentHouseUi(),
    //   binding: ManagementHouseBinding(),
    // ),
    // GetPage(
    //   title: "마이페이지 -> 내집관리 화면 -> 내집관리 추가",
    //   name: Routes.myPageManagementHouseCreate,
    //   page: () => const ManageMentHouseCreateUi(),
    //   binding: ManagementHouseCreateBinding(),
    // ),
    // GetPage(
    //   title: "마이페이지 -> 내집관리 화면 -> 내집관리 수정",
    //   name: Routes.myPageManagementHouseUpdate,
    //   page: () => const ManageMentHouseUpdateUi(),
    //   binding: ManagementHouseUpdateBinding(),
    // ),
    // GetPage(
    //   title: "마이페이지 -> 교환내역 화면",
    //   name: Routes.mypageTradeHistory,
    //   page: () => const MyPageTradeHistoryUi(),
    //   binding: MyPageTradeHistoryBinding(),
    // ),
    // GetPage(
    //   title: "마이페이지 -> 진행중인 교환 요청내역 화면",
    //   name: Routes.mypageTradeAll,
    //   page: () => const MyPageTradeAllUi(),
    //   binding: MyPageTradeAllBinding(),
    // ),
    // GetPage(
    //   title: "마이페이지 -> 찜 목록 더보기 화면",
    //   name: Routes.mypageWishListAll,
    //   page: () => const MyPageWishListAllUi(),
    //   binding: MyPageWishlistAllBinding(),
    // ),
    // GetPage(
    //   title: "마이페이지 -> 최근 조회 내역 화면",
    //   name: Routes.mypageSearchRecentAll,
    //   page: () => const MyPageSearchRecentAllUi(),
    //   binding: MyPageSearchRecentAllBinding(),
    // ),
    // GetPage(
    //   title: "더보기 -> 프로필 관리 화면",
    //   name: Routes.moreProfileUpdate,
    //   page: () => const MoreProfileUpdateUi(),
    //   binding: MoreProfileUpdateBinding(),
    // ),
    // GetPage(
    //   title: "더보기 -> 개인정보 관리 화면",
    //   name: Routes.morePrivacyUpdate,
    //   page: () => const MorePrivacyUpdateUi(),
    //   binding: MorePrivacyUpdateBinding(),
    // ),
    // GetPage(
    //   title: "더보기 -> 비밀번호 관리 화면",
    //   name: Routes.morePasswordUpdate,
    //   page: () => const MorePasswordUpdateUi(),
    //   binding: MorePasswordUpdateBinding(),
    // ),
    // GetPage(
    //   title: "더보기 -> 공지사항 화면",
    //   name: Routes.notice,
    //   page: () => NoticeUi(),
    //   binding: NoticeBinding(),
    // ),
    // GetPage(
    //   title: "더보기 -> 이벤트 화면",
    //   name: Routes.event,
    //   page: () => EventUi(),
    //   binding: EventBinding(),
    // ),
    // GetPage(
    //   title: "더보기 -> 고객센터/도움말 화면",
    //   name: Routes.moreHelp,
    //   page: () => const MoreHelpUi(),
    // ),
    // GetPage(
    //   title: "고객센터/도움말 -> 도움말 화면",
    //   name: Routes.help,
    //   page: () => HelpUi(),
    //   binding: HelpBinding(),
    // ),
    // GetPage(
    //   title: "고객센터/도움말 -> 자주하는 질문 화면",
    //   name: Routes.qna,
    //   page: () => QnaUi(),
    //   binding: QnaBinding(),
    // ),
    GetPage(
      title: "완료 화면",
      name: Routes.success,
      page: () => const SuccessUi(),
      binding: SuccessBinding(),
    ),
  ];
}

// import 'package:flutter/app/widgets.dart';
// //메인
// import 'package:zipting/app/ui/main/main_screen.dart';
// //스플래쉬
// import 'package:zipting/app/ui/splash/SplashScreen.dart';
// //로그인
// import 'package:zipting/app/ui/signin/SigninScreen.dart';
// //회원가입
// import 'package:zipting/app/ui/signup/signup_screen.dart';
// //룸 디테일
// import 'package:zipting/app/ui/room_detail/room_detail_screen.dart';
// import 'package:zipting/app/ui/opponent/opponent_screen.dart';
// import 'package:zipting/app/ui/opponent/opponent_house_screen.dart';
// import 'package:zipting/app/ui/opponent/opponent_review_screen.dart';
// import 'package:zipting/app/ui/opponent/opponent_review_detail_screen.dart';
// import 'package:zipting/app/ui/opponent/OpponentMoreScreen.dart';

// final Map<String, WidgetBuilder> routes = {
//   SplashScreen.routeName: (context) => SplashScreen(),
//   SigninScreen.routeName: (context) => SigninScreen(),
//   SignupScreen.routeName: (context) => SignupScreen(),
//   MainScreen.routeName: (context) => MainScreen(),
//   RoomDetailScreen.routeName: (context) => RoomDetailScreen(),
//   OpponentScreen.routeName: (context) => OpponentScreen(),
//   OpponentHouseScreen.routeName: (context) => OpponentHouseScreen(),
//   OpponentReviewScreen.routeName: (context) => OpponentReviewScreen(),
//   OpponentReviewDetailScreen.routeName: (context) =>
//       OpponentReviewDetailScreen(),
//   OpponentMoreScreen.routeName: (context) => OpponentMoreScreen()
// };
