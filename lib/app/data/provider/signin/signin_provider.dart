import 'package:dio/dio.dart';
import 'package:delivery_service/app/data/model/signin/signin_model.dart';
import "package:delivery_service/main.dart";

class SignInProvider {
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
        "$SERVER_IP/signin",
        options: Options(
          contentType: Headers.jsonContentType,
          responseType: ResponseType.json,
          maxRedirects: 5,
          sendTimeout: 60 * 1000,
          receiveTimeout: 60 * 1000,
        ),
        data: requestModel.toJson(),
      );

      if (response.statusCode == 200) {
        logger.d(response.data);
        return SingInBaseResponseModel.fromJson(response.data);
      } else {
        throw Exception('faild to load request');
      }
    } on DioError catch (e) {
      logger.d(e);
    }
  }
}
