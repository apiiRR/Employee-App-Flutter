class EmployeeModel {
  String id, email, firstName, lastName;

  EmployeeModel(
      {required this.id,
      required this.email,
      required this.firstName,
      required this.lastName});

  static EmployeeModel fromJson(Map<String, dynamic> json) => EmployeeModel(
      id: json["id"].toString(),
      email: json["email"].toString(),
      firstName: json["first_name"].toString(),
      lastName: json["last_name"].toString());

  Map toJson() =>
      {"first_name": firstName, "last_name": lastName, "email": email};
}
