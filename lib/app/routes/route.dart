/*
*title*: 라우터
*description*: 라우터 리스트 정의 입니다.
*/

abstract class Routes {
  static const splash = "/";
  static const signselect = "/signselect";
  static const signin = "/signin";
  static const signupTerms = "/signup/terms";
  static const signupPhone = "/signup/phone";
  static const signupInfo = "/signup/info";
  static const signupPassword = "/signup/password";
  static const find = "/find";

  static const main = "/main";
  static const home = "/home";
  static const search = "/search";
  static const searchHouse = "/search/house/:param";

  static const chat = "/chat";
  static const chatDetail = "/chat/:param";

  static const storeList = "/home/storeList=:categoryIdx";

  static const store = "/store=:storeIdx";
  static const storeMenuDetail = "/store=:storeIdx/storeMenuDetail=:menuIdx";
  static const storeOrder = "/store=:storeIdx/storeOrder";

  static const roomSetting = "/store=:storeIdx/roomSetting";

  static const room = "/room=:roomIdx";

  static const house = "/house/:param";
  static const houseMutualTrade = "/house/trade/mutual/:param";
  static const houseSingle = "/house/trade/single/:param";
  static const houseTradeSuccess = "/house/trade/success";
  static const houseAll = "/house/all/:param";
  static const houseReviewAll = "/:type/review/all/:param";

  static const reviewAll = "/review/all/:param";

  static const user = "/user/:param";
  static const mypage = "/mypage";
  static const mypageTradeAll = "/mypage/trade/all";
  static const mypageTradeHistory = "/mypage/trade/history";
  static const mypageWishListAll = "/mypage/wishlist/all";
  static const mypageSearchRecentAll = "/mypage/search/recent/all";

  static const myPageManagementHouse = "/mypage/management/house";
  static const myPageManagementHouseCreate = "/mypage/management/house/create";
  static const myPageManagementHouseUpdate =
      "/mypage/management/house/update/:param";

  static const more = "/more";
  static const moreProfileUpdate = "/more/profile/update";
  static const morePrivacyUpdate = "/more/privacy/update";
  static const morePasswordUpdate = "/more/password/update";
  static const moreHelp = "/more/help";
  static const notice = "/notice";
  static const event = "/event";
  static const help = "/help";
  static const qna = "/qna";

  static const success = "/success";
}
