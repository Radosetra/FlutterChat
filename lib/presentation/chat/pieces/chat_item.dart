import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:my_chat/config/app_router.gr.dart';
import 'package:my_chat/styles/colors.dart';

class ChatItem extends StatelessWidget {
  String userId;
  String name;
  String messageText;
  String imagePath;
  String time;
  bool isMessageRead;
  ChatItem({
    super.key, 
    required this.userId,
    required this.name,
    required this.messageText,
    required this.imagePath,
    required this.time,
    required this.isMessageRead});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        // id of the user destination
        context.pushRoute(ChatDiscussionRoute(userId: userId, userNameDestination: name));
      },
      child: Container(
        padding: const EdgeInsets.only(left: 16,right: 16,top: 10,bottom: 10),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage: AssetImage(imagePath),
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
                            name, 
                            style: const TextStyle(fontSize: 16),),
                          const SizedBox(height: 6,),
                          Text(messageText,style: TextStyle(fontSize: 12,color: MyChatColors.gray, fontWeight: isMessageRead?FontWeight.bold:FontWeight.normal),),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Text(time,style: TextStyle(fontSize: 12,fontWeight: isMessageRead?FontWeight.bold:FontWeight.normal),),
          ],
        ),
      ),
    );
  }
}