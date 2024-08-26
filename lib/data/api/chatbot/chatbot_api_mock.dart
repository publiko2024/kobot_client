import 'package:kobot_client/data/api/chatbot/chatbot_api.dart';

class ChatbotApiMock implements ChatbotApi {
  @override
  Future<String> sendMessage({required String message}) async {
    await Future.delayed(const Duration(seconds: 2));
    if (message.contains('달팽이관')) {
      return '청각장애인 인공달팽이관 수술지원사업의 지원규모는 1인당 수술비용 5백만 원 이내, 재활치료비용 3백만 원 이내입니다.';
    } else if (message.contains('의료비')) {
      return '등록장애인의 경우, 당해년도 의료비에 대해 의료비 지출액 전액의 15%를 공제받을 수 있습니다. 이를 위해서는 근로소득자의 연말정산 또는 종합소득 신고시 공제신청을 해야 합니다. \n\n자세한 문의는 국세청 전화세무상담 126으로 문의하실 수 있습니다.';
    } else {
      return '질문을 다시 확인해주세요';
    }
  }
}
