import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_chat/config/app_router.gr.dart';
import 'package:my_chat/presentation/chat/containers/message_input.dart';
import 'package:my_chat/presentation/common/providers/socket_service_provider.dart';
import 'package:my_chat/presentation/common/providers/user_state_provider.dart';
import 'package:my_chat/types/user.dart';
import 'package:my_chat/utils/generate_id.dart';

@RoutePage()
class HomeScreen extends ConsumerStatefulWidget {

  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {

  String typedMessage = '';

  void onMessageChanged(String message) {
    setState(() {
      typedMessage = message;
    });
  }

  void onSubmitMessage(){
    if (typedMessage.isNotEmpty) {
      User currentUser = User(userId: generateId(), userName: typedMessage);
      // ref from flutter riverpod
      ref
        .read(userProvider.notifier)
        .setCurrentUser(currentUser);
      
      // join the active users
      ref.read(socketServiceProvider).joinActifUsers(currentUser);

      // Navigate to the chat discussion screen
      AutoRouter.of(context).push(const ChatHomeRoute());
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Welcome to the Home Screen")),
      body: Center(
        child: Column(
          children: [
            const Text("Enter your username please"),
            const SizedBox(height: 20),
            MessageInputWidget(
              onMessageChanged: onMessageChanged,
              onSubmitMessage: onSubmitMessage,
            )
          ],
        )
      ),
    );
  }
}