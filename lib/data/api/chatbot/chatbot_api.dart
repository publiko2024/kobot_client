abstract interface class ChatbotApi {
  Future<String> sendMessage({required String message});
}
