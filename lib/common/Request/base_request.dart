import 'dart:async';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:riverpodlogin/common/constant/constant.dart';

class BaseRequest {
  String? token;
  Map<String, dynamic> header = {
    'Accept': 'application/json',
    'Content-Type': 'application/json',
  };

  Future<Response> get(
      {Map<String, dynamic>? queryParameters,
      required String path,
      required bool auth,
      String? paginationUrl}) async {
    if (paginationUrl != null) {
      Dio dio = Dio();

      dio.interceptors.add(InterceptorsWrapper(
        onError: (DioException error, handler) async {
          if (error.response?.statusCode == 401) {
            //handel error in case of  401 or ant other issue in request
          }
          handler.next(error);
        },
      ));

      Response response = await dio.get(paginationUrl,
          queryParameters: queryParameters, options: Options(headers: header));

      return response;
    } else {
      final Dio dio = Dio(
        BaseOptions(
          baseUrl: CgConstant.baseUrl,
          headers: header,
        ),
      );
      Response response = await dio.get(
        path,
        queryParameters: queryParameters,
      );
      return response;
    }
  }

  Future<Response> post({
    Map<String, dynamic>? queryParameters,
    dynamic data,
    required String path,
    required bool auth,
  }) async {
    log('post method called ');
    String? token;
    if (auth) {
      log(token.toString());
      header['Authorization'] = 'Bearer $token';
    }
    final Dio dio = Dio(
      BaseOptions(
        baseUrl: CgConstant.baseUrlD,
        headers: header,
      ),
    );
    Response response = await dio.post(
      path,
      queryParameters: queryParameters,
      data: data,
    );
    return response;
  }
}
