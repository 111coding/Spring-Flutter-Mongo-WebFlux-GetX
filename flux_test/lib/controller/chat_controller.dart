import 'package:flux_test/domain/chat/chat.dart';
import 'package:flux_test/domain/chat/chat_repository.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';

class ChatController extends GetxController {
  ChatRepository _chatRepository = ChatRepository();

  // 실시간으로 데이트 스트림 받아올 때 리스트를 받아오는게 아니라 하나의 객체 씩 받아오기 때문에 해당 Rx변수에 스트림을 바인딩 시켜주고
  // 해당 변수에 값이 추가될 때 워커를 이용해서 총 리스트에 추가 시키자
  Rx<Chat?> chat = Rx<Chat?>(null);
  RxList<Chat> chats = RxList();

  @override
  void onInit() {
    super.onInit();
    // Worker를 이용해 새로 받아올 때마다 리스트에 담아주자!
    ever(chat, (Chat? c) {
      chats.add(c!);
    });
  }

  Future<bool> msg(int receiver) async {
    Stream<Chat>? chatStream = await _chatRepository.msg(receiver);
    if (chatStream == null) return false;
    chat.bindStream(chatStream);
    return true;
  }

  Future<bool> sendChat(int receiver, int sender, String msg) async {
    Chat? sendedChat = await _chatRepository.sendChat(receiver, sender, msg);
    return sendedChat == null ? false : true;
  }
}
