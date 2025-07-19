import 'package:flutter/material.dart';
import 'package:my_chat/presentation/chat/containers/message_input.dart';
import 'package:my_chat/presentation/chat/view/message_list.dart';

class DiscussionView extends StatelessWidget {
  const DiscussionView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Expanded(
          child: MessageList(),   // This fills available space
        ),
        MessageInputWidget(),     // This stays fixed at the bottom
      ],
    );
  }
}
