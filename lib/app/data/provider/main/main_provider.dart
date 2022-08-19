import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:delivery_service/app/data/model/main/main_model.dart';
import "package:delivery_service/main.dart";

class MainInitProvider {
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
        "$SERVER_IP/member",
        options: Options(
          contentType: Headers.jsonContentType,
          responseType: ResponseType.json,
          maxRedirects: 5,
          sendTimeout: 60 * 1000,
          receiveTimeout: 60 * 1000,
          headers: {
            // 'Content-Type': 'application/json',
            "authorization": "Bearer ${GetStorage().read('token')}",
          },
        ),
      );

      if (response.statusCode == 200) {
        print(response.data);
        return MemberBaseResponseModel.fromJson(response.data);
      } else {
        throw Exception('faild to load request');
      }
    } on DioError catch (e) {
      logger.d(e);
    }
  }
}
