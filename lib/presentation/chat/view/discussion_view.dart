import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_chat/presentation/chat/containers/message_input.dart';
import 'package:my_chat/presentation/chat/view/message_list.dart';
import 'package:my_chat/presentation/common/providers/socket_service_provider.dart';
import 'package:my_chat/presentation/common/providers/user_state_provider.dart';
import 'package:my_chat/types/message.dart';
import 'package:my_chat/types/user.dart';
import 'package:my_chat/utils/generate_roomid.dart';

class DiscussionView extends ConsumerStatefulWidget {
  const DiscussionView({super.key, required this.userNameDestination, required this.userId});
  final String userNameDestination;
  final String userId;

  @override
  ConsumerState<DiscussionView> createState() => _DiscussionViewState();
}

class _DiscussionViewState extends ConsumerState<DiscussionView> {
  String typedMessage = '';
  User? currentUser; // Initialize with a default User

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final userState = ref.read(userProvider);
    currentUser = userState.currentUser;
    
  }

  void onMessageChanged(String message) {
    setState(() {
      typedMessage = message;
    });
  }

  void onSubmitMessage(){
    if (typedMessage.isNotEmpty) {
      Message message = Message(
        senderId: currentUser!.userId,
        senderName: currentUser?.userName ?? 'Unknown',
        content: typedMessage,
        roomId: generateRoomId(currentUser?.userId, widget.userId),
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
          child: MessageList(userId: currentUser!.userId),   // This fills available space
        ),
        MessageInputWidget(
          onMessageChanged: onMessageChanged,
          onSubmitMessage: onSubmitMessage
        ),     // This stays fixed at the bottom
      ],
    );
  }
}
