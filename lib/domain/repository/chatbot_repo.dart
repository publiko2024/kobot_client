import 'package:kobot_client/domain/model/chat_message.dart';

abstract interface class ChatbotRepo {
  Future<ChatMessage> createChatMessage({required ChatMessage question});
  Future<List<ChatMessage>> getAllChatMessages();
  Future<void> insertChatMessage(ChatMessage message);
}
