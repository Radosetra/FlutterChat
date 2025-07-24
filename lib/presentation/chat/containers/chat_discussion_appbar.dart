import 'package:flutter/material.dart';
import 'package:my_chat/icons/mychat_icons.dart';
import 'package:my_chat/presentation/common/pieces/mychat_icon_widget.dart';

class MyChatDiscussionBar extends StatelessWidget implements PreferredSizeWidget {
  MyChatDiscussionBar({
    super.key,
    required this.userNameDestination,
  });

  String userNameDestination;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        children: [
          const CircleAvatar(
            backgroundImage: AssetImage('assets/images/users/1.png'), // Replace with your image path
            maxRadius: 15,
          ),
          const SizedBox(width: 10), // Space between avatar and text
          Text(
            userNameDestination,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
      titleSpacing: 10,
      leading: Container(
        margin: const EdgeInsets.only(left: 10),
        child: const MyChatIconWidget(
          size: 24,
          assetName: MyChatIcons.arrowLeft),
      ),
      leadingWidth: 30,
        
      actions: const [
        MyChatIconWidget(
          assetName: MyChatIcons.moreVertical,
        ),
        SizedBox(width: 10), // Space between icons
      ],
    );
  }
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 1);
}