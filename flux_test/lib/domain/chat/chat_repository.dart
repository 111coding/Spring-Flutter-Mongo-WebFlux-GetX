import 'dart:convert';

import 'package:flux_test/domain/chat/chat.dart';
import 'package:flux_test/domain/chat/chat_provider.dart';
import 'package:http/http.dart' as http;

class ChatRepository {
  final ChatProvider _chatProvider = ChatProvider();

  Future<Stream<Chat>?> msg(int receiver) async {
    http.StreamedResponse? response = await _chatProvider.msg(receiver);
    if (response == null) return null;

    /* 넘겨받은 가공되지 않은 스트림을 가공해서 컨트롤러에 넘겨주자
     * stream 받아올 때
     * data :
     * {value}
     * 공백
     * 형식으로 받아와서 유효한 스트림 데이터(receiver가 들어있는 데이터)만 리턴하자
     */
    Stream<Chat> chatStream = response.stream
        .toStringStream()
        .where((v) => v.contains("receiver"))
        .map((v) => Chat.fromJson(jsonDecode(v)));
    return chatStream;
  }
}
