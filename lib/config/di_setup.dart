import 'package:get_it/get_it.dart';
import 'package:kobot_client/data/api/chatbot/chatbot_api.dart';
import 'package:kobot_client/data/api/chatbot/chatbot_api_impl.dart';
import 'package:kobot_client/data/database/chat_message/chat_message_dao.dart';
import 'package:kobot_client/data/database/chat_message/chat_message_dao_impl.dart';
import 'package:kobot_client/data/database/database_helper.dart';
import 'package:kobot_client/data/repository/chatbot_repo_impl.dart';
import 'package:kobot_client/domain/repository/chatbot_repo.dart';
import 'package:kobot_client/presentation/chatbot/chatbot_view_model.dart';
import 'package:kobot_client/presentation/splash/splash_view_model.dart';
import 'package:sqflite/sqflite.dart';

GetIt getIt = GetIt.instance;

Future<void> diSetup() async {
  // 데이터베이스 초기화 및 등록
  final databaseHelper = DatabaseHelper();
  final db = await databaseHelper.database;
  getIt.registerSingleton<Database>(db);
  getIt.registerSingleton<ChatMessageDao>(ChatMessageDaoImpl(db));

  // API 및 Repository 초기화 및 등록
  getIt.registerSingleton<ChatbotApi>(ChatbotApiImpl());
  getIt.registerSingleton<ChatbotRepo>(
    ChatbotRepoImpl(getIt<ChatbotApi>(), getIt<ChatMessageDao>()),
  );

  // ViewModel 초기화 및 등록
  getIt.registerFactory(() => ChatbotViewModel(getIt<ChatbotRepo>()));
  getIt.registerFactory(() => SplashViewModel());
}
