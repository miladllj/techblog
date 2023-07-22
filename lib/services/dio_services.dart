import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:dio/dio.dart' as dio_service;

class DioServices {
  Dio dio = Dio();

  Future<dynamic> getMethod(String url) async {
    dio.options.headers['content-type'] = 'application/json';
    try {
      Response response = await dio.get(
        url,
        options: Options(responseType: ResponseType.json, method: 'Get'),
      );
      //log('response is : $response');
      return response;
    } catch (e) {
      if (e is DioException) {
        log('Error during GET request: $e');
        return e.response!;
      }
    }
  }

  Future<dynamic> postMethod(Map<String, dynamic> map, String url) async {
    dio.options.headers['content-type'] = 'application/json';
    //TODO read token from storage
    try {
      Response response = await dio.post(url,
          data: dio_service.FormData.fromMap(map),
          options: Options(responseType: ResponseType.json, method: 'POST'));
      log(response.headers.toString());
      log(response.data.toString());
      log(response.statusCode.toString());
      return response;
    } catch (e) {
      if (e is DioException) {
        log('Error during POST request: $e');
        return e.response!;
      }
    }
  }
}
