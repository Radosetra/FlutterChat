import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_chat/data/fake/chat_users_data.dart';
import 'package:my_chat/presentation/chat/pieces/chat_item.dart';
import 'package:my_chat/presentation/common/providers/user_state_provider.dart';

class ChatList extends ConsumerWidget {
  const ChatList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final actifUsers = ref.watch(userProvider).activeUsers;
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: ListView.builder(
        itemCount: actifUsers.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index){
          return ChatItem(
            userId: actifUsers[index].userId,
            name: actifUsers[index].userName,
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