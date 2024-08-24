import 'package:sqflite/sqflite.dart';
import 'package:kobot_client/domain/model/chat_message.dart';
import 'chat_message_dao.dart';

class ChatMessageDaoImpl implements ChatMessageDao {
  final Database _db;

  ChatMessageDaoImpl(this._db);

  @override
  Future<void> insertMessage(ChatMessage message) async {
    await _db.insert(
      'chat_messages',
      {
        'role': message.role.toString().split('.').last,
        'message': message.message,
      },
      conflictAlgorithm: ConflictAlgorithm.replace, // 충돌 시 덮어쓰도록 설정
    );
  }

  @override
  Future<List<ChatMessage>> getAllMessages() async {
    final List<Map<String, dynamic>> maps = await _db.query('chat_messages');

    return List.generate(maps.length, (i) {
      return ChatMessage(
        role: _stringToChatRole(maps[i]['role']),
        message: maps[i]['message'],
      );
    });
  }

  // String을 ChatRole enum으로 변환
  ChatRole _stringToChatRole(String role) {
    return ChatRole.values
        .firstWhere((e) => e.toString().split('.').last == role);
  }
}
