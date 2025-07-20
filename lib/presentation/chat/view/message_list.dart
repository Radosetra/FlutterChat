import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_chat/presentation/chat/pieces/message_item.dart';
import 'package:my_chat/presentation/chat/state/message_provider.dart';
import 'package:my_chat/styles/colors.dart';

class MessageList extends ConsumerWidget  {
  MessageList({super.key, required this.userId});

  String userId;

  // final String userId = "user_2"; 
 // Example user ID, replace with actual user ID logic
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final messages = ref.watch(messagesProvider);
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