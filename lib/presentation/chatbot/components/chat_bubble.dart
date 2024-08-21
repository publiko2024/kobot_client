import 'package:flutter/material.dart';
import 'package:kobot_client/ui/styles/color_styles.dart';
import 'package:kobot_client/ui/styles/size_config.dart';
import 'package:kobot_client/ui/styles/text_styles.dart';

class ChatBubble extends StatelessWidget {
  final String message;

  const ChatBubble({
    super.key,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        constraints: BoxConstraints(
          maxWidth: getWidth(300),
        ),
        padding: EdgeInsets.all(getWidth(10)),
        decoration: ShapeDecoration(
          color: ColorStyles.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        child: Text(
          message,
          style: TextStyles.chatbotQuestionText,
        ),
      ),
    );
  }
}
