import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../data/api/auth_api.dart';
import '../../data/model/auth_model.dart';

enum AuthViewState { none, loading, error }

class AuthViewModel extends ChangeNotifier {
  AuthViewState _state = AuthViewState.none;
  AuthViewState get state => _state;

  changeState(AuthViewState state) {
    _state = state;
    notifyListeners();
  }

  String? _token;

  String? get token {
    if (_token != null) {
      return _token;
    } else {
      return null;
    }
  }

  bool get isAuth {
    return token != null;
  }

  Future login(AuthModel data) async {
    changeState(AuthViewState.loading);

    try {
      Response response = await AuthAPI.login(data.toJson());
      if (response.statusCode != 200) return response.data["error"].toString();

      _token = response.data["token"];
      notifyListeners();
      changeState(AuthViewState.none);
    } catch (error) {
      changeState(AuthViewState.error);
      return throw Exception("Error $error");
    }
  }
}
