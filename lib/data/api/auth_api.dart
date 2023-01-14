import 'dart:convert';

import 'package:dio/dio.dart';

class AuthAPI {
  static Future login(Map data) async {
    try {
      Response response = await Dio()
          .post("https://reqres.in/api/login", data: jsonEncode(data));
      return response;
    } on DioError catch (error) {
      return error.response;
    }
  }
}
