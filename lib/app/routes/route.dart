// /*
// *title*: 라우터
// *description*: 라우터 리스트 정의 입니다.
// */

// abstract class Routes {
//   static const splash = "/";
//   static const signselect = "/signselect";
//   static const signin = "/signin";
//   static const signupTerms = "/signup/terms";
//   static const signupPhone = "/signup/phone";
//   static const signupInfo = "/signup/info";
//   static const signupPassword = "/signup/password";
//   static const find = "/find";

//   static const main = "/main";
//   static const home = "/home";
//   static const search = "/search";
//   static const searchHouse = "/search/house/:param";

//   static const chat = "/chat";
//   static const chatDetail = "/chat/:param";

//   static const storeList = "/home/storeList";

//   static const store = "/store=:storeIdx";
//   static const storeMenuDetail = "/store=:storeIdx/storeMenuDetail=:menuIdx";
//   static const storeOrder = "/store=:storeIdx/storeOrder";

//   static const roomSetting = "/store=:storeIdx/roomSetting";

//   static const room = "/room=:roomIdx";

//   static const house = "/house/:param";
//   static const houseMutualTrade = "/house/trade/mutual/:param";
//   static const houseSingle = "/house/trade/single/:param";
//   static const houseTradeSuccess = "/house/trade/success";
//   static const houseAll = "/house/all/:param";
//   static const houseReviewAll = "/:type/review/all/:param";

//   static const reviewAll = "/review/all/:param";

//   static const user = "/user/:param";
//   static const mypage = "/mypage";
//   static const mypageTradeAll = "/mypage/trade/all";
//   static const mypageTradeHistory = "/mypage/trade/history";
//   static const mypageWishListAll = "/mypage/wishlist/all";
//   static const mypageSearchRecentAll = "/mypage/search/recent/all";

//   static const myPageManagementHouse = "/mypage/management/house";
//   static const myPageManagementHouseCreate = "/mypage/management/house/create";
//   static const myPageManagementHouseUpdate =
//       "/mypage/management/house/update/:param";

//   static const more = "/more";
//   static const moreProfileUpdate = "/more/profile/update";
//   static const morePrivacyUpdate = "/more/privacy/update";
//   static const morePasswordUpdate = "/more/password/update";
//   static const moreHelp = "/more/help";
//   static const notice = "/notice";
//   static const event = "/event";
//   static const help = "/help";
//   static const qna = "/qna";

//   static const success = "/success";
// }

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

  static const storeList = "/home/storeList";

  static const store = "/store=:storeIdx";
  static const storeMenuDetail = "/store=:storeIdx/storeMenuDetail=:menuIdx";

  static const order = "/order=:orderIdx";
  static const orderResult = "/order=:orderIdx/orderResult";

  static const roomSetting = "/order=:orderIdx/roomSetting";
  static const roomResult = "/order=:orderIdx/roomResult";

  static const room = "/room=:roomIdx";
  static const roomStatus = "/room=:roomIdx/status";

  static const address = "/address";
  static const addressDetail = "/address/detail";
  static const addressSearch = "/address/search";

  static const house = "/house/:param";
  static const houseMutualTrade = "/house/trade/mutual/:param";
  static const houseSingle = "/house/trade/single/:param";
  static const houseTradeSuccess = "/house/trade/success";
  static const houseAll = "/house/all/:param";
  static const houseReviewAll = "/:type/review/all/:param";

  static const reviewAll = "/review/all/:param";

  static const user = "/user/:param";
  static const mypage = "/mypage";
  static const mypageUserUpdate = "/mypage/user/update";
  static const mypageTradeAll = "/mypage/trade/all";
  static const mypageOrderHistory = "/mypage/order/history";
  static const mypageOrderHistoryDetail =
      "/mypage/order/history/detail=:number";
  static const mypageReviewWrite =
      "/mypage/order/history/detail=:number/reviewWrite=:storeIdx";
  static const mypageFavoritesAll = "/mypage/favorites/all";
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
  static const eventDeatil = "/event/:eventIdx";
  static const help = "/help";
  static const helpInquiry = "/help/inquiry";
  static const helpFQA = "/help/fqa";
  static const helpDetail = "/help/detail";
  static const setting = "/setting";
  static const qna = "/qna";

  static const success = "/success";
}
