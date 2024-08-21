import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kobot_client/presentation/chatbot/chatbot_view_model.dart';
import 'package:kobot_client/ui/styles/color_styles.dart';
import 'package:kobot_client/ui/styles/size_config.dart';
import 'package:kobot_client/ui/styles/text_styles.dart';
import 'package:provider/provider.dart';

class ChatbotAnswerBubble extends StatelessWidget {
  final String answer;

  const ChatbotAnswerBubble({
    super.key,
    required this.answer,
  });

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<ChatbotViewModel>();

    return Align(
      alignment: Alignment.centerLeft,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: getWidth(34),
                height: getHeight(34),
                padding: EdgeInsets.all(getWidth(5)),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: ColorStyles.white,
                ),
                child: Image.asset(
                  'assets/images/kobot.png',
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              CircleAvatar(
                backgroundColor: ColorStyles.white,
                radius: getWidth(17),
                child: IconButton(
                  onPressed: () {
                    viewModel.speakText(answer);
                  },
                  icon: const Icon(
                    CupertinoIcons.speaker_2_fill,
                    color: ColorStyles.secondary,
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              if (viewModel.isSpeaking)
                CircleAvatar(
                  backgroundColor: ColorStyles.white,
                  radius: getWidth(17),
                  child: IconButton(
                    onPressed: () {
                      viewModel.stopSpeaking();
                    },
                    icon: const Icon(
                      CupertinoIcons.stop_fill,
                      color: ColorStyles.secondary,
                    ),
                  ),
                )
              else
                const SizedBox(),
            ],
          ),
          SizedBox(
            width: getWidth(10),
          ),
          Container(
            constraints: BoxConstraints(
              maxWidth: getWidth(285),
            ),
            padding: EdgeInsets.all(getWidth(10)),
            decoration: ShapeDecoration(
              color: ColorStyles.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            child: Text(
              answer,
              style: TextStyles.chatbotAnswerText,
            ),
          ),
        ],
      ),
    );
  }
}
