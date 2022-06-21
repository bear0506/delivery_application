import 'package:dio/dio.dart';
import 'package:delivery_service/app/data/model/signup/signup_model.dart';
import "package:delivery_service/main.dart";

/*
*title*: 회원가입 프로바이더(API)
*description*: 회원가입 프로바이더(API)를 백엔드에 호출합니다.
*/

class SignUpProvider {
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
      logger.d(requestModel.toJson());

      Response<dynamic> response = await dio.post(
        "$SERVER_IP/signup",
        options: Options(
          contentType: Headers.jsonContentType,
          responseType: ResponseType.json,
        ),
        data: requestModel.toJson(),
      );

      if (response.statusCode == 200) {
        // logger.d(response.data);

        return SignUpResponseModel.formJson(response.data);
      } else {
        throw Exception('faild to load request');
      }
    } on DioError catch (e) {
      logger.d(e);
    }
  }
}

class SignUpInfoProvider {
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
      logger.d(requestModel.toJson());

      Response<dynamic> response = await dio.post(
        "$SERVER_IP/signup/duplicate",
        options: Options(
          contentType: Headers.jsonContentType,
          responseType: ResponseType.json,
        ),
        data: requestModel.toJson(),
      );

      if (response.statusCode == 200) {
        // logger.d(response.data);
        return SignUpResponseModel.formJson(response.data);
      } else {
        throw Exception('faild to load request');
      }
    } on DioError catch (e) {
      logger.d(e);
    }
  }
}
