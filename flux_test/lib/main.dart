import 'package:flutter/material.dart';
import 'package:flux_test/binding/app_binding.dart';
import 'package:flux_test/views/chat_page.dart';
import 'package:get/route_manager.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: AppBinding(),
      home: const ChatPage(),
    );
  }
}
