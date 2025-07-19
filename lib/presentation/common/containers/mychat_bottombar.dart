import 'package:flutter/material.dart';
import 'package:my_chat/presentation/common/pieces/mychat_icon_widget.dart';
import 'package:my_chat/styles/colors.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';
import 'package:my_chat/icons/mychat_icons.dart';

class MychatBottombar extends StatelessWidget {
  const MychatBottombar({super.key, required this.selected, required this.onItemSelected});

  final int selected;
  final Function(int) onItemSelected;

  @override
  Widget build(BuildContext context) {
    return StylishBottomBar(
        option: AnimatedBarOptions(
          iconStyle: IconStyle.Default
        ),
        items: [
          BottomBarItem(
            icon: const MyChatIconWidget(
              assetName: MyChatIcons.messageCircle),
            selectedIcon: const MyChatIconWidget(
              assetName: MyChatIcons.messageCircle,
              color: MyChatColors.primary,),
            selectedColor: MyChatColors.primary,
            // unSelectedColor: Colors.grey,
            title: const Text('Discussions'),
          ),
          BottomBarItem(
            icon: const MyChatIconWidget(
              assetName: MyChatIcons.user),
            selectedIcon: const MyChatIconWidget(
              assetName: MyChatIcons.user,
              color: MyChatColors.primary,),
            selectedColor: MyChatColors.primary,
            title: const Text('Profile'),
          ),
        ],
        hasNotch: true,
        fabLocation: StylishBarFabLocation.center,
        currentIndex: selected,
        notchStyle: NotchStyle.circle,
        onTap: (index) {
          if (index == selected) return;
          // controller.jumpToPage(index);
          onItemSelected(index);
        },
        
      );
  }
}