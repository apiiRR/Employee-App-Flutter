class AuthModel {
  String email, password;

  AuthModel({required this.email, required this.password});

  Map toJson() => {"email": email, "password": password};
}
