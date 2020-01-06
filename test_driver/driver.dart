import 'package:flu-read/common/common.dart';
import 'package:flutter_driver/driver_extension.dart';
import 'package:flu-read/main.dart' as app;

/// 集成测试运行 flutter drive --target=test_driver/driver.dart
void main() {
  enableFlutterDriverExtension();
  Constant.isTest = true;
  app.main();
}