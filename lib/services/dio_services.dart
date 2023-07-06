import 'dart:developer';

import 'package:dio/dio.dart';

class DioServices {
  Future<dynamic> getMethod(String url) async {
    Dio dio = Dio();
    dio.options.headers['content-type'] = 'application/json';
    try {
      Response response = await dio.get(
        url,
        options: Options(responseType: ResponseType.json, method: 'Get'),
      );
      log('response is : $response');
      return response;
    } catch (e) {
      log('Error during GET request: $e');
      rethrow;
    }
  }
}
