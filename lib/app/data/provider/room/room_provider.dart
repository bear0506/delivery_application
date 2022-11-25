import 'package:dio/dio.dart';
// import 'package:get_storage/get_storage.dart';
import 'package:delivery_service/app/data/model/room/room_model.dart';
import "package:delivery_service/main.dart";
import 'package:get_storage/get_storage.dart';

class RoomAllProvider {
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
        "$SERVER_IP/room/all",
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
        return RoomsBaseResponseModel.fromJson(response.data);
      } else {
        throw Exception('faild to load request');
      }
    } on DioError catch (e) {
      logger.d(e);
    }
  }
}

class RoomsInStoreProvider {
  dio({required int storeIdx}) async {
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
        "$SERVER_IP/room/store/$storeIdx",
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
        return RoomsBaseResponseModel.fromJson(response.data);
      } else {
        throw Exception('faild to load request');
      }
    } on DioError catch (e) {
      logger.d(e);
    }
  }
}

class RoomInitProvider {
  dio({required int roomIdx}) async {
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
        "$SERVER_IP/room/$roomIdx",
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
        return RoomBaseResponseModel.fromJson(response.data);
      } else {
        throw Exception('faild to load request');
      }
    } on DioError catch (e) {
      logger.d(e);
    }
  }
}

class RoomAddProvider {
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
        "$SERVER_IP/room/add",
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
        return RoomBaseResponseModel.fromJson(response.data);
      } else {
        throw Exception('faild to load request');
      }
    } on DioError catch (e) {
      logger.d(e);
    }
  }
}

// 모임 상태 조회
class RoomStatusInitProvider {
  dio({required int roomIdx}) async {
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
        "$SERVER_IP/room/$roomIdx/status",
        options: Options(
          contentType: Headers.jsonContentType,
          responseType: ResponseType.json,
          maxRedirects: 5,
          sendTimeout: 60 * 1000,
          receiveTimeout: 60 * 1000,
          headers: {
            'Content-Type': 'application/json',
            "authorization": "Bearer ${GetStorage().read('token')}",
          },
        ),
      );

      if (response.statusCode == 200) {
        return RoomStatusBaseResponseModel.fromJson(response.data);
      } else {
        throw Exception('faild to load request');
      }
    } on DioError catch (e) {
      logger.d(e);
    }
  }
}

// 모임 상태 조회
class RoomParticipateProvider {
  dio({required int roomIdx}) async {
    final Dio dio = Dio();

    dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
      return handler.next(options);
    }, onResponse: (response, handler) {
      return handler.next(response);
    }, onError: (DioError e, handler) {
      return handler.next(e);
    }));

    try {
      Response<dynamic> response = await dio.put(
        "$SERVER_IP/room/$roomIdx/participate",
        options: Options(
          contentType: Headers.jsonContentType,
          responseType: ResponseType.json,
          maxRedirects: 5,
          sendTimeout: 60 * 1000,
          receiveTimeout: 60 * 1000,
          headers: {
            'Content-Type': 'application/json',
            "authorization": "Bearer ${GetStorage().read('token')}",
          },
        ),
      );

      if (response.statusCode == 200) {
        return RoomBaseResponseModel.fromJson(response.data);
      } else {
        throw Exception('faild to load request');
      }
    } on DioError catch (e) {
      logger.d(e);
    }
  }
}
