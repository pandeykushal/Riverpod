import 'dart:developer';

import 'package:dio/dio.dart';
import '../Model/Dummy_model.dart';
import '../Model/login_model.dart';
import 'base_request.dart';

class UserRequest extends BaseRequest {
  Future<Info?> userData() async {
    try {
      var responce = await get(path: "/products", auth: true);
      log(responce.data.toString());
      return Info.fromJson(responce.data);
    } on DioException catch (e) {
      log(e.message.toString());
      return null;
    }
  }

  Future<Login?> login({
    required String email,
    required String password,
  }) async {
    try {
      Response response = await post(
          path: '/user/login',
          data: {
            "password": password,
            "email": email,
            "platform": "ios",
            "device_token": "fcm"
          },
          auth: false);
      print(response.toString());
      if (response.statusCode == 200) {
        print(response.toString());
        return Login.fromJson(response.data['results']);
      } else {
        print("Error");
        return null;
      }
    } on DioException catch (e) {
      print("Dio Error: $e");
    }
    return null;
  }
}
