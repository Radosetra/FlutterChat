import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:my_chat/presentation/chat/containers/chat_discussion_appbar.dart';
import 'package:my_chat/presentation/chat/view/discussion_view.dart';

@RoutePage()
class ChatDiscussionScreen extends StatefulWidget {
  const ChatDiscussionScreen({
    super.key, required this.userId, required this.userName,
    // required this.imagePath,
  });

  final String userId;
  final String userName;

  @override
  State<ChatDiscussionScreen> createState() => _ChatDiscussionScreenState();
}

class _ChatDiscussionScreenState extends State<ChatDiscussionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyChatDiscussionBar(userName: widget.userName),
      body: DiscussionView(userId: widget.userId, userName: widget.userName),

    );
  }
}
