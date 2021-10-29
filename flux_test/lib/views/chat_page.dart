import 'package:flutter/material.dart';
import 'package:flux_test/controller/chat_controller.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ChatController c = Get.find<ChatController>();
    c.msg(1);

    return Scaffold(
      body: Obx(
        () => ListView.builder(
          itemCount: c.chats.length,
          itemBuilder: (context, index) {
            return Text(c.chats[index].msg!);
          },
        ),
      ),
    );
  }
}
