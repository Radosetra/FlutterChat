import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:my_chat/presentation/chat/containers/chat_discussion_appbar.dart';
import 'package:my_chat/presentation/chat/view/discussion_view.dart';

@RoutePage()
class ChatDiscussionScreen extends StatefulWidget {
  const ChatDiscussionScreen({
    super.key,
    // required this.imagePath,
  });

  // String imagePath;

  @override
  State<ChatDiscussionScreen> createState() => _ChatDiscussionScreenState();
}

class _ChatDiscussionScreenState extends State<ChatDiscussionScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: MyChatDiscussionBar(),
      body: DiscussionView(),

    );
  }
}
