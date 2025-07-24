import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_chat/presentation/chat/containers/chat_discussion_appbar.dart';
import 'package:my_chat/presentation/chat/view/discussion_view.dart';
import 'package:my_chat/presentation/common/providers/socket_service_provider.dart';
import 'package:my_chat/presentation/common/providers/user_state_provider.dart';

@RoutePage()
class ChatDiscussionScreen extends ConsumerStatefulWidget  {
  const ChatDiscussionScreen({
    super.key, required this.userId, required this.userNameDestination,
    // required this.imagePath,
  });

  final String userId;
  final String userNameDestination;

  @override
  ConsumerState<ChatDiscussionScreen> createState() => _ChatDiscussionScreenState();
}

class _ChatDiscussionScreenState extends ConsumerState<ChatDiscussionScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final currentUser = ref.read(userProvider).currentUser;
    final socketService = ref.read(socketServiceProvider);
    socketService.joinRoom(currentUser!.userId, widget.userId);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyChatDiscussionBar(userNameDestination: widget.userNameDestination),
      body: DiscussionView(userId: widget.userId, userNameDestination: widget.userNameDestination),

    );
  }
}
