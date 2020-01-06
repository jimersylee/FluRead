import 'package:flutter/material.dart';
import 'package:flu-read/main.dart';
import 'package:flu-read/store/page/store_audit_page.dart';
import 'package:flutter_driver/driver_extension.dart';

/// 运行 flutter drive --target=test_driver/store/store.dart
void main() {
  enableFlutterDriverExtension();
  runApp(MyApp(home: StoreAuditPage()));
}