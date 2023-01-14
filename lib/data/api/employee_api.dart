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
}
