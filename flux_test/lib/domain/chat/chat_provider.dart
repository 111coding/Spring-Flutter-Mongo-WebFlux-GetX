import 'dart:convert';

import 'package:flux_test/domain/chat/chat.dart';
import 'package:get/get_connect.dart';
import 'package:get/state_manager.dart';
import 'package:http/http.dart' as http;

class ChatProvider extends GetConnect {
  static const String url = "http://192.168.1.100:8080";

  Future<http.StreamedResponse?> msg(int receiver) async {
    try {
      // 서버에 스트림 연결해서 넘김
      http.Request request =
          http.Request("GET", Uri.parse("$url/msg/$receiver"))
            ..headers["Cache-Control"] = "no-cache"
            ..headers["Accept"] = "text/event-stream";
      return await http.Client().send(request);
    } catch (e) {
      // TODO Exception
    }
  }
}
