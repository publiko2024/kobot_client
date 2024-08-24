import 'package:kobot_client/domain/model/chat_message.dart';

abstract interface class ChatMessageDao {
  Future<void> insertMessage(ChatMessage message);
  Future<List<ChatMessage>> getAllMessages();
}
