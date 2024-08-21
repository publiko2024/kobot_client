import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:kobot_client/presentation/chatbot/chatbot_view_model.dart';
import 'package:kobot_client/presentation/chatbot/components/chat_list.dart';
import 'package:kobot_client/presentation/chatbot/components/recommand_question.dart';
import 'package:kobot_client/presentation/chatbot/components/sendable_text_input_box.dart';
import 'package:kobot_client/ui/styles/color_styles.dart';
import 'package:kobot_client/ui/styles/size_config.dart';
import 'package:kobot_client/ui/styles/text_styles.dart';

class ChatbotScreen extends StatelessWidget {
  const ChatbotScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<ChatbotViewModel>();
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(), // 모든 FocusNode의 포커스를 해제
      child: Scaffold(
        backgroundColor: ColorStyles.chatRoomBackground,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text(
            '코봇',
            style: TextStyles.appBarText,
          ),
          actions: [
            IconButton(
              padding: EdgeInsets.only(right: defaultPaddingWidth),
              onPressed: () {},
              icon: const Icon(CupertinoIcons.ellipsis_vertical),
            )
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: viewModel.messages.isEmpty
                  ? const RecommandQuestion()
                  : ChatList(
                      scrollController: viewModel.scrollController,
                      messages: viewModel.messages,
                    ),
            ),
            SendableTextInputBox(
              focusNode: viewModel.focusNode,
              textController: viewModel.textController,
              send: viewModel.sendMessage,
              hintText: '무엇이든 물어보세요',
            ),
          ],
        ),
      ),
    );
  }
}
