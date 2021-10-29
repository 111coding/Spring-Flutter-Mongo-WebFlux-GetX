import 'package:flutter/material.dart';
import 'package:flux_test/controller/chat_controller.dart';
import 'package:flux_test/domain/chat/chat.dart';
import 'package:flux_test/views/chat_detail_page.dart';
import 'package:get/get.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ChatController c = Get.find<ChatController>();
    c.msg(1);

    return Scaffold(
      appBar: AppBar(
        title: const Text("채팅리스트"),
      ),
      body: Obx(
        () {
          Map<int, Chat> distinctChats = {};
          for (var chat in c.chats) {
            distinctChats[chat.sender!] = chat;
          }
          List<Chat> distintList = [];
          distinctChats.forEach((k, v) {
            distintList.add(v);
          });

          List<Chat> orderChangedList = distintList.reversed.toList();

          return ListView.separated(
            padding: const EdgeInsets.only(top: 16),
            separatorBuilder: (context, index) => const SizedBox(height: 10),
            itemCount: orderChangedList.length,
            itemBuilder: (context, index) {
              Chat chat = orderChangedList[index];
              return GestureDetector(
                onTap: () => Get.to(() => ChatDetailPage(sender: chat.sender!)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 2),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.only(left: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("보낸사람 : ${chat.sender}"),
                        Text("메시지 : ${chat.msg}"),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
