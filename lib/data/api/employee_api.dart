import 'dart:convert';

import 'package:dio/dio.dart';

class EmployeeAPI {
  static Future getDatas() async {
    try {
      Response response = await Dio().get("https://reqres.in/api/users");
      return response;
    } on DioError catch (error) {
      return error.response;
    }
  }

  static Future addData(Map data) async {
    try {
      Response response = await Dio()
          .post("https://reqres.in/api/users", data: jsonEncode(data));
      return response;
    } on DioError catch (error) {
      return error.response;
    }
  }
}
