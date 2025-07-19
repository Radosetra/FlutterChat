import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:auto_route/annotations.dart';
import 'package:my_chat/icons/mychat_icons.dart';
import 'package:my_chat/presentation/chat/view/chat_list.dart';
import 'package:my_chat/presentation/common/containers/mychat_appbar.dart';
import 'package:my_chat/presentation/common/containers/mychat_bottombar.dart';
import 'package:my_chat/presentation/common/pieces/mychat_icon_widget.dart';
import 'package:my_chat/styles/colors.dart';

@RoutePage()
class ChatHomeScreen extends StatefulWidget {
  const ChatHomeScreen({super.key});

  @override
  State<ChatHomeScreen> createState() => _ChatHomeScreenState();
}

class _ChatHomeScreenState extends State<ChatHomeScreen> {
  bool centerSelecter = false;
  final controller = PageController();
  int selected = 0;
  
  void onItemSelected(int index) {
    setState(() {
      selected = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: const MyChatAppBar(),
      body: const ChatList(),
      bottomNavigationBar: MychatBottombar(selected: selected, onItemSelected: onItemSelected,),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            centerSelecter = !centerSelecter;
          });
        },
        shape: const CircleBorder(),
        backgroundColor: Colors.white,
        child: const MyChatIconWidget(
          assetName: MyChatIcons.plus,
          color: MyChatColors.primary)
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      
    );
  }
}
