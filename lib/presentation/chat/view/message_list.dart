import 'package:flutter/material.dart';
import 'package:my_chat/data/fake/messages_data.dart';
import 'package:my_chat/presentation/chat/pieces/message_item.dart';
import 'package:my_chat/styles/colors.dart';
import 'package:my_chat/types/message.dart';

class MessageList extends StatefulWidget {
  const MessageList({super.key});

  @override
  State<MessageList> createState() => _MessageListState();
}

class _MessageListState extends State<MessageList> {

  final String userId = "user_2"; // Example user ID, replace with actual user ID logic

  List<Message> messages = generateFakeMessages();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: ListView.separated(
        itemCount: messages.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        separatorBuilder: (context, index) => const SizedBox(height: 5),
        itemBuilder: (context, index){
          return MessageItem(
            isSender: userId == messages[index].senderId,
            content: messages[index].content,
            backgroundColor: userId == messages[index].senderId
                ? MyChatColors.secondary
                : MyChatColors.gray,
          );
          // return Text(messages[index].content);
        },
      ),
    );
  }
}