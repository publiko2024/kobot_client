import 'package:kobot_client/data/api/chatbot/chatbot_api.dart';
import 'package:http/http.dart' as http;

class ChatbotApiImpl implements ChatbotApi{
  final String _baseUrl = 'http://34.64.124.216:8080';
  @override
  Future<String> sendMessage({required String message}) async {
    final url = Uri.parse('$_baseUrl/chat');
    try {
      final response = await http.post(
        url,
        body: message,
        headers: {'Content-Type': 'application/json'},
      );
      if (response.statusCode == 200) {
        return response.body;
      } else {
        throw Exception(
            'Failed to get chatbot answer. Status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error sending message: $e');
    }
  }

}