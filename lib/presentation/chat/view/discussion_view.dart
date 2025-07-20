import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_chat/presentation/chat/containers/message_input.dart';
import 'package:my_chat/presentation/chat/view/message_list.dart';
import 'package:my_chat/presentation/common/providers/socket_service_provider.dart';
import 'package:my_chat/types/message.dart';

class DiscussionView extends ConsumerStatefulWidget {
  const DiscussionView({super.key, required this.userName, required this.userId});
  final String userName;
  final String userId;

  @override
  ConsumerState<DiscussionView> createState() => _DiscussionViewState();
}

class _DiscussionViewState extends ConsumerState<DiscussionView> {
  String typedMessage = '';
  void onMessageChanged(String message) {
    setState(() {
      typedMessage = message;
    });
  }

  void onSubmitMessage(){
    if (typedMessage.isNotEmpty) {
      Message message = Message(
        senderId: widget.userId,
        senderName: "Me",
        content: typedMessage,
        timestamp: DateTime.now(),
      );

      final socketService = ref.read(socketServiceProvider);
      socketService.sendMessage(message);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: MessageList(userId: widget.userId),   // This fills available space
        ),
        MessageInputWidget(
          onMessageChanged: onMessageChanged,
          onSubmitMessage: onSubmitMessage
        ),     // This stays fixed at the bottom
      ],
    );
  }
}
