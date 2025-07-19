import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:my_chat/config/app_router.gr.dart';
import 'package:my_chat/presentation/common/pages/home_screen.dart';
import 'package:my_chat/styles/colors.dart';

class ChatItem extends StatefulWidget{
  String name;
  String messageText;
  String imagePath;
  String time;
  bool isMessageRead;
  ChatItem({
    super.key, 
    required this.name,
    required this.messageText,
    required this.imagePath,
    required this.time,
    required this.isMessageRead});
  @override
  _ChatItemState createState() => _ChatItemState();
}

class _ChatItemState extends State<ChatItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        context.pushRoute(const ChatDiscussionRoute()); // Navigate to HomeScreen on tap
      },
      child: Container(
        padding: const EdgeInsets.only(left: 16,right: 16,top: 10,bottom: 10),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage: AssetImage(widget.imagePath),
                    maxRadius: 30,
                  ),
                  const SizedBox(width: 16,),
                  Expanded(
                    child: Container(
                      color: Colors.transparent,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            widget.name, 
                            style: const TextStyle(fontSize: 16),),
                          const SizedBox(height: 6,),
                          Text(widget.messageText,style: TextStyle(fontSize: 12,color: MyChatColors.gray, fontWeight: widget.isMessageRead?FontWeight.bold:FontWeight.normal),),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Text(widget.time,style: TextStyle(fontSize: 12,fontWeight: widget.isMessageRead?FontWeight.bold:FontWeight.normal),),
          ],
        ),
      ),
    );
  }
}