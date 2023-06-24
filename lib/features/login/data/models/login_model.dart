import 'package:flutter_clean_architecture/features/login/domain/entities/login.dart';

class LoginModel extends Login {
  LoginModel({required String email, required String password})
      : super(email: email, password: password);

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(email: json['email'], password: json['password']);
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
    };
  }
}
