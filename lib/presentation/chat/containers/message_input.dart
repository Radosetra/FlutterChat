import 'package:flutter/material.dart';
import 'package:my_chat/icons/mychat_icons.dart';
import 'package:my_chat/presentation/common/pieces/mychat_icon_widget.dart';
import 'package:my_chat/styles/colors.dart';

class MessageInputWidget extends StatelessWidget {
  const MessageInputWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: const BoxDecoration(
        color: MyChatColors.white,
        border: Border(
          top: BorderSide(color: MyChatColors.gray),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10,),
              decoration: BoxDecoration(
                color: MyChatColors.gray.withOpacity(0.4),
                borderRadius: BorderRadius.circular(5),  
              ),
              child: const TextField(
                maxLines: null,            
                minLines: 1,               
                decoration: InputDecoration(
                  hintText: 'Type a message...',
                  border: InputBorder.none,
                  hintStyle: TextStyle(color: MyChatColors.black), // Hint text style
                ),
              ),
            ),
          ),
          const SizedBox(width: 10), // Space between text field and buttons
          ElevatedButton(
            onPressed: () {
              // Send message action
            },
            style: const ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(MyChatColors.primary),
            ),
            child: const MyChatIconWidget(assetName: MyChatIcons.send, color: MyChatColors.white),
            
          ),
        ],
      ),
    );
  }
}
