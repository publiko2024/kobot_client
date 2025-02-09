import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_message.freezed.dart';
part 'chat_message.g.dart';

@freezed
class ChatMessage with _$ChatMessage {
  const factory ChatMessage({
    required ChatRole role,
    required String message,
  }) = _ChatMessage;

  factory ChatMessage.fromJson(Map<String, Object?> json) =>
      _$ChatMessageFromJson(json);
}

enum ChatRole{
  bot,
  user,
}
