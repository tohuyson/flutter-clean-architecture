import 'dart:io';

import 'package:flutter/services.dart';

Future<String> fixture(String name) async {
  return await rootBundle.loadString('test/fixtures/$name');
}
