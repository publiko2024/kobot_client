import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kobot_client/data/api/chatbot/chatbot_api_mock.dart';
import 'package:kobot_client/data/repository/chatbot_repo_impl.dart';
import 'package:kobot_client/presentation/chatbot/chatbot_screen.dart';
import 'package:kobot_client/presentation/chatbot/chatbot_view_model.dart';
import 'package:kobot_client/presentation/splash/splash_screen.dart';
import 'package:kobot_client/presentation/splash/splash_view_model.dart';
import 'package:provider/provider.dart';

class Routes {
  static final GoRouter router = GoRouter(
    initialLocation: '/splash',
    routes: [
      GoRoute(
          path: '/splash',
          builder: (BuildContext context, GoRouterState state) {
            return ChangeNotifierProvider(
              create: (context) => SplashViewModel(),
              child: const SplashScreen(),
            );
          }),
      GoRoute(
          path: '/chat',
          builder: (BuildContext context, GoRouterState state) {
            return ChangeNotifierProvider(
              create: (context) => ChatbotViewModel(
                ChatbotRepoImpl(
                  ChatbotApiMock(),
                ),
              ),
              child: const ChatbotScreen(),
            );
          }),
    ],
  );
}
