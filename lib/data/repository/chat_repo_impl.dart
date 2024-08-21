import 'package:kobot_client/data/api/chatbot/chatbot_api.dart';
import 'package:kobot_client/domain/model/chat_message.dart';
import 'package:kobot_client/domain/repository/chat_repo.dart';

class ChatRepoImpl implements ChatRepo {
  final ChatbotApi _chatbotApi;
  const ChatRepoImpl(this._chatbotApi);
  @override
  Future<ChatMessage> createChatMessage({required ChatMessage question}) async {
    final String answer =
        await _chatbotApi.sendMessage(message: question.message);
    final ChatMessage answerMessage =
        ChatMessage(name: 'chatbot', message: answer);

    return answerMessage;
  }
}
