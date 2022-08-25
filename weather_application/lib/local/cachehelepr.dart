import 'package:dio/dio.dart';

class Diohelper {
  static late Dio dio;
  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://lavie.orangedigitalcenteregypt.com//api/v1/',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getData({
    required String url,
    required Map<String, dynamic>? query,
    String? token,
  }) async {
    dio.options.headers = {'token': token, 'Content-Type': 'application/json'};

    return await dio.get(url, queryParameters: query);
  }

  static Future<Response> postData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic>? data,
    String? token,
  }) async {
    dio.options.headers = {'token': token, 'Content-Type': 'application/json'};
    return await dio.post(url, queryParameters: query, data: data);
  }
}
