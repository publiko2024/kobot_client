import 'package:kobot_client/data/api/chatbot/chatbot_api.dart';
import 'package:kobot_client/data/database/chat_message/chat_message_dao.dart';
import 'package:kobot_client/domain/model/chat_message.dart';
import 'package:kobot_client/domain/repository/chatbot_repo.dart';

class ChatbotRepoImpl implements ChatbotRepo {
  final ChatbotApi _chatbotApi;
  final ChatMessageDao _chatMessageDao;

  const ChatbotRepoImpl(this._chatbotApi, this._chatMessageDao);
  @override
  Future<ChatMessage> createChatMessage({required ChatMessage question}) async {
    final String answer =
        await _chatbotApi.sendMessage(message: question.message);
    final ChatMessage answerMessage =
        ChatMessage(role: ChatRole.bot, message: answer);

    return answerMessage;
  }

  @override
  Future<List<ChatMessage>> getAllChatMessages() async {
    return await _chatMessageDao.getAllMessages();
  }

  @override
  Future<void> insertChatMessage(ChatMessage message) async {
    await _chatMessageDao.insertMessage(message);
  }
}
