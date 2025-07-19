import 'package:flutter/material.dart';

class MessageItem extends StatelessWidget {
  const MessageItem({super.key, required this.content, required this.backgroundColor, required this.isSender});

  final String content;

  final Color backgroundColor;

  final bool isSender;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.7,
          ),
          child: Container(
            padding: const EdgeInsets.all(5),            
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: backgroundColor
            ),
            child: Text(
              content,
              maxLines: null,
              textAlign: isSender ? TextAlign.right : TextAlign.left,
            ),
          ),
        ),
      ],
    );
  }
}