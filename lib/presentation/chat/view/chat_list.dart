import 'package:flutter/material.dart';
import 'package:my_chat/data/fake/chat_users_data.dart';
import 'package:my_chat/presentation/chat/pieces/chat_item.dart';

class ChatList extends StatefulWidget {
  const ChatList({super.key});

  @override
  State<ChatList> createState() => _ChatListState();
}

class _ChatListState extends State<ChatList> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: ListView.builder(
        itemCount: chatUsersData.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index){
          return ChatItem(
            name: chatUsersData[index].name,
            messageText: chatUsersData[index].messageText,
            imagePath: chatUsersData[index].imagePath,
            time: chatUsersData[index].time,
            isMessageRead: (index == 0 || index == 3)?true:false,
          );
        },
      ),
    );
  }
}