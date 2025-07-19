import 'package:flutter/material.dart';
import 'package:my_chat/icons/mychat_icons.dart';
import 'package:my_chat/presentation/common/pieces/mychat_icon_widget.dart';
import 'package:my_chat/styles/colors.dart';

class MyChatAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyChatAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text("MyChat"),
      titleSpacing: 12,
      
      automaticallyImplyLeading: false,
      actions: const [
        MyChatIconWidget(
          assetName: MyChatIcons.search
        ),
        SizedBox(width: 10),
        MyChatIconWidget(
          assetName: MyChatIcons.setting
        ),
        SizedBox(width: 12),
      ],
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(0.25),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 12),
          color: MyChatColors.black,  // Border color
          height: 0.25,                    // Border thickness
        ),
      ),
    );
  }
  
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 1);
}