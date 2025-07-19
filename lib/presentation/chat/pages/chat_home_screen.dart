import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:auto_route/annotations.dart';
import 'package:my_chat/presentation/chat/view/chat_list.dart';
import 'package:my_chat/presentation/common/containers/mychat_appbar.dart';
@RoutePage()
class ChatHomeScreen extends StatelessWidget {
  const ChatHomeScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: MyChatAppBar(),
      body: ChatList()
    );
  }
}
