import 'package:flutter/material.dart';
import 'package:flux_test/controller/chat_controller.dart';
import 'package:flux_test/domain/chat/chat.dart';
import 'package:get/get.dart';

class ChatDetailPage extends StatelessWidget {
  ChatDetailPage({Key? key, required this.sender}) : super(key: key);

  final int sender;
  ChatController c = Get.find<ChatController>();
  final TextEditingController _textEditingController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  Widget _chatList() => Obx(() {
        List<Chat> filteredList =
            c.chats.where((cc) => cc.sender == sender).toList();

        return ListView.separated(
          controller: _scrollController,
          padding: const EdgeInsets.only(top: 16),
          separatorBuilder: (context, index) => const SizedBox(height: 10),
          itemCount: filteredList.length,
          itemBuilder: (context, index) {
            Chat chat = filteredList[index];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 2),
                  borderRadius: BorderRadius.circular(8),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("보낸사람 : ${chat.sender}"),
                    Text("메시지 : ${chat.msg}"),
                    Text("전송시간 : ${chat.createdAt}"),
                  ],
                ),
              ),
            );
          },
        );
      });

  Widget textInput() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Container(
          height: 28,
          decoration: BoxDecoration(
            color: const Color(0xFFECECEC),
            borderRadius: BorderRadius.circular(4),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 3),
          margin: const EdgeInsets.only(top: 10),
          child: Row(
            children: [
              Expanded(
                child: TextFormField(
                  autofocus: false,
                  onFieldSubmitted: (v) async {
                    bool result = await c.sendChat(sender, 1, v);
                    result
                        ? _textEditingController.clear()
                        : Get.snackbar("실패", "다시시도");
                  },
                  textAlignVertical: TextAlignVertical.top,
                  controller: _textEditingController,
                  // focusNode: teFocus,
                  cursorColor: const Color(0xFF333333),
                  cursorHeight: 18,
                  onChanged: (v) {},
                  style:
                      const TextStyle(color: Color(0xFF272727), fontSize: 16),
                  maxLines: 1,
                  decoration: const InputDecoration(
                    hintText: "메시지를 입력해 주세요",
                    hintStyle: TextStyle(
                      color: Color(0xFFC0C0C0),
                      fontSize: 16,
                    ),
                    contentPadding: EdgeInsets.only(bottom: 11),
                    fillColor: Colors.transparent,
                    filled: true,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                  ),
                ),
              ),
            ],
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("${sender}님과의 채팅"),
        ),
        body: Column(
          children: [
            Expanded(child: _chatList()),
            textInput(),
            SizedBox(height: MediaQuery.of(context).padding.bottom),
          ],
        ));
  }
}
