import 'package:flutter/material.dart';
import 'package:flu-read/setting/page/setting_page.dart';
import 'package:flutter_driver/driver_extension.dart';
import 'package:flu-read/main.dart';

/// 运行 flutter drive --target=test_driver/setting/setting.dart
void main() {
  enableFlutterDriverExtension();
  runApp(MyApp(home: SettingPage()));
}