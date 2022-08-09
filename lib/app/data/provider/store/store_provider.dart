import 'package:dio/dio.dart';
// import 'package:get_storage/get_storage.dart';
import 'package:delivery_service/app/data/model/store/store_model.dart';
import "package:delivery_service/main.dart";
import 'package:get_storage/get_storage.dart';

class StoreAllProvider {
  dio() async {
    final Dio dio = Dio();

    dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
      return handler.next(options);
    }, onResponse: (response, handler) {
      return handler.next(response);
    }, onError: (DioError e, handler) {
      return handler.next(e);
    }));

    try {
      Response<dynamic> response = await dio.get(
        "$SERVER_IP/store/all",
        options: Options(
          contentType: Headers.jsonContentType,
          responseType: ResponseType.json,
          maxRedirects: 5,
          sendTimeout: 60 * 1000,
          receiveTimeout: 60 * 1000,
          headers: {
            'Content-Type': 'application/json'
            // "authorization": "Bearer ${GetStorage().read('token')}",
          },
        ),
      );

      if (response.statusCode == 200) {
        //logger.d(response.data);
        return StoreBaseResponseModel.fromJson(response.data);
      } else {
        throw Exception('faild to load request');
      }
    } on DioError catch (e) {
      logger.d(e);
    }
  }
}

class StoreInitProvider {
  dio({required int idx}) async {
    final Dio dio = Dio();

    dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
      return handler.next(options);
    }, onResponse: (response, handler) {
      return handler.next(response);
    }, onError: (DioError e, handler) {
      return handler.next(e);
    }));

    try {
      Response<dynamic> response = await dio.get(
        "$SERVER_IP/store/$idx",
        options: Options(
          contentType: Headers.jsonContentType,
          responseType: ResponseType.json,
          maxRedirects: 5,
          sendTimeout: 60 * 1000,
          receiveTimeout: 60 * 1000,
          headers: {
            'Content-Type': 'application/json'
            // "authorization": "Bearer ${GetStorage().read('token')}",
          },
        ),
      );

      if (response.statusCode == 200) {
        // logger.d(response.data);
        return StoreBaseResponseModel.fromJson(response.data);
      } else {
        throw Exception('faild to load request');
      }
    } on DioError catch (e) {
      logger.d(e);
    }
  }
}

class CategoryAllProvider {
  dio() async {
    final Dio dio = Dio();

    dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
      return handler.next(options);
    }, onResponse: (response, handler) {
      return handler.next(response);
    }, onError: (DioError e, handler) {
      return handler.next(e);
    }));

    try {
      Response<dynamic> response = await dio.get(
        "$SERVER_IP/category/all",
        options: Options(
          contentType: Headers.jsonContentType,
          responseType: ResponseType.json,
          maxRedirects: 5,
          sendTimeout: 60 * 1000,
          receiveTimeout: 60 * 1000,
          headers: {
            'Content-Type': 'application/json'
            // "authorization": "Bearer ${GetStorage().read('token')}",
          },
        ),
      );

      if (response.statusCode == 200) {
        // logger.d(response.data);
        return CategoryBaseResponseModel.fromJson(response.data);
      } else {
        throw Exception('faild to load request');
      }
    } on DioError catch (e) {
      logger.d(e);
    }
  }
}

class MenuInitProvider {
  dio({required int idx}) async {
    final Dio dio = Dio();

    dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
      return handler.next(options);
    }, onResponse: (response, handler) {
      return handler.next(response);
    }, onError: (DioError e, handler) {
      return handler.next(e);
    }));

    try {
      Response<dynamic> response = await dio.get(
        "$SERVER_IP/menu/$idx",
        options: Options(
          contentType: Headers.jsonContentType,
          responseType: ResponseType.json,
          maxRedirects: 5,
          sendTimeout: 60 * 1000,
          receiveTimeout: 60 * 1000,
          headers: {
            'Content-Type': 'application/json'
            // "authorization": "Bearer ${GetStorage().read('token')}",
          },
        ),
      );

      if (response.statusCode == 200) {
        return MenuBaseResponseModel.fromJson(response.data);
      } else {
        throw Exception('faild to load request');
      }
    } on DioError catch (e) {
      logger.d(e);
    }
  }
}

class CartCheckProvider {
  dio({dynamic requestModel}) async {
    final Dio dio = Dio();

    dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
      return handler.next(options);
    }, onResponse: (response, handler) {
      return handler.next(response);
    }, onError: (DioError e, handler) {
      return handler.next(e);
    }));

    try {
      Response<dynamic> response = await dio.post(
        "$SERVER_IP/order/check",
        options: Options(
          contentType: Headers.jsonContentType,
          responseType: ResponseType.json,
          maxRedirects: 5,
          sendTimeout: 60 * 1000,
          receiveTimeout: 60 * 1000,
          headers: {
            "authorization": "Bearer ${GetStorage().read('token')}",
          },
        ),
        data: requestModel.toJson(),
      );

      if (response.statusCode == 200) {
        // logger.d(response.data);
        return CartCheckResponseModel.formJson(response.data);
      } else {
        throw Exception('faild to load request');
      }
    } on DioError catch (e) {
      logger.d(e);
    }
  }
}

class OrderAddProvider {
  dio({dynamic requestModel}) async {
    final Dio dio = Dio();

    dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
      return handler.next(options);
    }, onResponse: (response, handler) {
      return handler.next(response);
    }, onError: (DioError e, handler) {
      return handler.next(e);
    }));

    try {
      Response<dynamic> response = await dio.post(
        "$SERVER_IP/order/add",
        options: Options(
          contentType: Headers.jsonContentType,
          responseType: ResponseType.json,
          maxRedirects: 5,
          sendTimeout: 60 * 1000,
          receiveTimeout: 60 * 1000,
          headers: {
            "authorization": "Bearer ${GetStorage().read('token')}",
          },
        ),
        data: requestModel.toJson(),
      );

      if (response.statusCode == 200) {
        // logger.d(response.data);
        return CartCheckResponseModel.formJson(response.data);
      } else {
        throw Exception('faild to load request');
      }
    } on DioError catch (e) {
      logger.d(e);
    }
  }
}


// 주문 상세 추가
class OrderDetailAddProvider {
  dio({dynamic requestModel}) async {
    final Dio dio = Dio();

    dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
      return handler.next(options);
    }, onResponse: (response, handler) {
      return handler.next(response);
    }, onError: (DioError e, handler) {
      return handler.next(e);
    }));

    try {
      Response<dynamic> response = await dio.post(
        "$SERVER_IP/order/detail/add",
        options: Options(
          contentType: Headers.jsonContentType,
          responseType: ResponseType.json,
          maxRedirects: 5,
          sendTimeout: 60 * 1000,
          receiveTimeout: 60 * 1000,
          headers: {
            "authorization": "Bearer ${GetStorage().read('token')}",
          },
        ),
        data: requestModel.toJson(),
      );

      if (response.statusCode == 200) {
        // logger.d(response.data);
        return CartCheckResponseModel.formJson(response.data);
      } else {
        throw Exception('faild to load request');
      }
    } on DioError catch (e) {
      logger.d(e);
    }
  }
}



// class CartUpdateProvider {
//   dio({dynamic requestModel}) async {
//     final Dio dio = Dio();

//     dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
//       return handler.next(options);
//     }, onResponse: (response, handler) {
//       return handler.next(response);
//     }, onError: (DioError e, handler) {
//       return handler.next(e);
//     }));

//     try {
//       Response<dynamic> response = await dio.put(
//         "$SERVER_IP/mypage/update",
//         options: Options(
//           contentType: Headers.jsonContentType,
//           responseType: ResponseType.json,
//           maxRedirects: 5,
//           sendTimeout: 60 * 1000,
//           receiveTimeout: 60 * 1000,
//           headers: {
//             "authorization": "Bearer ${GetStorage().read('token')}",
//           },
//         ),
//         data: requestModel.toJson(),
//       );

//       if (response.statusCode == 200) {
//         logger.d(response.data);
//         return MyPageMemberUpdateBaseResponseModel.fromJson(response.data);
//       } else {
//         throw Exception('faild to load request');
//       }
//     } on DioError catch (e) {
//       logger.d(e);
//     }
//   }
// }
