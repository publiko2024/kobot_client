import 'package:kobot_client/data/api/chatbot/chatbot_api.dart';

class ChatbotApiMock implements ChatbotApi {
  @override
  Future<String> sendMessage({required String message}) async {
    await Future.delayed(const Duration(seconds: 2));
    return '''
장애인이 사용할 수 있는 운동 시설을 예약하려면, 몇 가지 주요 사항을 고려하는 것이 좋습니다. 우선, 시설이 접근성이나 편의성 면에서 어떤 지원을 제공하는지 확인하는 것이 중요합니다. 다양한 유형의 운동 시설이 있을 수 있으므로, 구체적인 요구 사항에 따라 선택할 수 있습니다. 아래는 도움이 될 수 있는 몇 가지 아이디어입니다:

1.장애인 전용 체육관: 많은 도시에서는 장애인을 위한 전문 체육관이 있습니다. 이런 시설은 장애인 맞춤형 장비와 훈련 프로그램을 제공하며, 훈련 전문가들이 도움을 줄 수 있습니다.

2.일반 체육관의 장애인 접근성: 일부 일반 체육관도 장애인을 위해 접근성을 개선해 놓은 곳이 있습니다. 휠체어 접근이 가능한 운동 기구, 경사로, 그리고 장애인을 위한 개인 트레이너가 있는 경우가 많습니다.
''';
  }
}
