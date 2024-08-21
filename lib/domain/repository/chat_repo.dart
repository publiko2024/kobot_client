import 'package:kobot_client/domain/model/chat_message.dart';

abstract interface class ChatRepo {
  Future<ChatMessage> createChatMessage({required ChatMessage question});
}
