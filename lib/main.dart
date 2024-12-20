import 'package:flutter/material.dart';
import 'package:poster/app.dart';
import 'package:poster/di/app_module.dart';

void main() {
  di.registerAppModule();
  runApp(App());
}
