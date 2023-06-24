import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/features/login/data/models/login_model.dart';
import 'package:flutter_clean_architecture/features/login/domain/entities/login.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final loginModel = LoginModel(email: "example@gmail.com", password: "1234");

  test("should be a subclass of Login entity", () async {
    expect(loginModel, isA<Login>());
  });

  group('fromJson', () {
    test('should return a valid model when the JSON', () async {
      String jsonString = await fixture("login.json");
      
      final Map<String, dynamic> jsonMap = json.decode(jsonString);

      final result = LoginModel.fromJson(jsonMap);

      expect(result, loginModel);
    });
  });

  group('toJson', () {
    test('should return a Json map containing the proper data', () async {
      final result = loginModel.toJson();

      final expectedMap = {
        'email':"example@gmail.com",
        'password':"1234"
      };

      expect(result, expectedMap);
    });
  });
}
