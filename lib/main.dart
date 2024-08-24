import 'package:flutter/material.dart';
import 'package:kobot_client/app.dart';
import 'package:kobot_client/config/di_setup.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Flutter 초기화 보장
  await diSetup(); // 의존성 주입 설정
  runApp(const MyApp());
}
