import 'package:dio/dio.dart';
import 'package:delivery_service/app/data/model/send/send_model.dart';
import 'package:delivery_service/main.dart';

class SendSignupProvider {
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
        "$SERVER_IP/send/signup",
        options: Options(
          contentType: Headers.jsonContentType,
          responseType: ResponseType.json,
        ),
        data: requestModel.toJson(),
      );

      if (response.statusCode == 200) {
        // logger.d(response.data);

        return SendResponseModel.formJson(response.data);
      } else {
        throw Exception('faild to load request');
      }
    } on DioError catch (e) {
      logger.d(e);
    }
  }
}

class SendSignupVerifyProvider {
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
        "$SERVER_IP/send/signup/verify",
        options: Options(
          contentType: Headers.jsonContentType,
          responseType: ResponseType.json,
        ),
        data: requestModel.toJson(),
      );

      if (response.statusCode == 200) {
        // logger.d(response.data);

        return SendResponseModel.formJson(response.data);
      } else {
        throw Exception('faild to load request');
      }
    } on DioError catch (e) {
      logger.d(e);
    }
  }
}

class SendFindProvider {
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
        "$SERVER_IP/send/find",
        options: Options(
          contentType: Headers.jsonContentType,
          responseType: ResponseType.json,
        ),
        data: requestModel.toJson(),
      );

      if (response.statusCode == 200) {
        // logger.d(response.data);
        return SendResponseModel.formJson(response.data);
      } else {
        throw Exception('faild to load request');
      }
    } on DioError catch (e) {
      logger.d(e);
    }
  }
}
