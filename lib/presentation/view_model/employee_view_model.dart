import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../data/api/employee_api.dart';
import '../../data/model/employee_model.dart';

enum EmployeeViewState { none, loading, error }

class EmployeeViewModel extends ChangeNotifier {
  EmployeeViewState _state = EmployeeViewState.none;
  EmployeeViewState get state => _state;

  changeState(EmployeeViewState state) {
    _state = state;
    notifyListeners();
  }

  List<EmployeeModel>? _datas;
  List<EmployeeModel>? get datas => _datas;

  EmployeeModel? _selectedData;
  EmployeeModel? get selectedData => _selectedData;

  set detailData(EmployeeModel data) {
    _selectedData = data;
  }

  Future getDatas() async {
    _datas = null;
    changeState(EmployeeViewState.loading);

    try {
      Response response = await EmployeeAPI.getDatas();
      if (response.statusCode != 200) return;

      Map<String, dynamic> dataResponse = response.data as Map<String, dynamic>;
      if (dataResponse["data"].length == 0) return;

      List<EmployeeModel> pengguna = (dataResponse["data"] as List)
          .map((e) => EmployeeModel.fromJson(e))
          .toList();
      _datas = pengguna;

      notifyListeners();
      changeState(EmployeeViewState.none);
    } catch (error) {
      changeState(EmployeeViewState.error);
      return throw Exception("Error $error");
    }
  }
}
