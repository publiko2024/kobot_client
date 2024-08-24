import 'package:flutter/material.dart';
import 'package:kobot_client/domain/model/chat_message.dart';
import 'package:kobot_client/domain/repository/chatbot_repo.dart';
import 'package:flutter_tts/flutter_tts.dart';

class ChatbotViewModel with ChangeNotifier {
  final ChatbotRepo _repo;
  late FlutterTts _flutterTts;

  ChatbotViewModel(this._repo) {
    _initializeTtsSettings();
    _init();
  }

  final TextEditingController _textController = TextEditingController();
  TextEditingController get textController => _textController;

  final FocusNode _focusNode = FocusNode();
  FocusNode get focusNode => _focusNode;

  final ScrollController _scrollController = ScrollController();
  ScrollController get scrollController => _scrollController;

  final List<ChatMessage> _messages = [];
  List<ChatMessage> get messages => _messages;

  bool _isWaitingAnswer = false;
  bool get isWaitingAnswer => _isWaitingAnswer;

  bool _isSpeaking = false;
  bool get isSpeaking => _isSpeaking;

  Future<void> _init() async {
    await _loadMessages(); // 데이터베이스에서 기존 메시지 로드
  }

  void _initializeTtsSettings() async {
    _flutterTts = FlutterTts();
    await _flutterTts.setLanguage("ko-KR");
    await _flutterTts.setSpeechRate(0.5);
    await _flutterTts.setPitch(1.0);
  }

  Future<void> _loadMessages() async {
    final messages = await _repo.getAllChatMessages(); // 기존 메시지 로드
    _messages.addAll(messages.reversed);
    notifyListeners();
  }

  Future<void> sendMessage() async {
    if (_isWaitingAnswer) return;

    String questionText = _textController.text;
    _textController.clear();
    _focusNode.unfocus();

    ChatMessage question = ChatMessage(
      role: ChatRole.user,
      message: questionText,
    );

    _messages.insert(0, question);
    _isWaitingAnswer = true;
    notifyListeners();

    // 일단 가짜 응답 삽입
    ChatMessage mockAnswer =
        const ChatMessage(role: ChatRole.bot, message: ' ... ');
    _messages.insert(0, mockAnswer);
    notifyListeners();

    // 데이터베이스에 새로운 메시지 저장
    await _repo.insertChatMessage(question);

    ChatMessage chatbotAnswer =
        await _repo.createChatMessage(question: question);
    _messages[0] = chatbotAnswer; // 응답이 오면 진짜 응답으로 교체

    // 데이터베이스에 응답 메시지 저장
    await _repo.insertChatMessage(chatbotAnswer);

    _isWaitingAnswer = false;
    notifyListeners();
  }

  Future<void> speakText(String text) async {
    if (_isSpeaking) {
      return;
    }
    _isSpeaking = true;
    notifyListeners();
    await _flutterTts.speak(text);
  }

  Future<void> stopSpeaking() async {
    if (!_isSpeaking) {
      return;
    }
    await _flutterTts.stop();
    _isSpeaking = false;
    notifyListeners();
  }

  @override
  void dispose() {
    _textController.dispose();
    _focusNode.dispose();
    _flutterTts.stop();
    super.dispose();
  }
}
