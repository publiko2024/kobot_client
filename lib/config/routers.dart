import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kobot_client/config/di_setup.dart';
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
              create: (context) => getIt<SplashViewModel>(),
              child: const SplashScreen(),
            );
          }),
      GoRoute(
          path: '/chat',
          builder: (BuildContext context, GoRouterState state) {
            return ChangeNotifierProvider(
              create: (context) => getIt<ChatbotViewModel>(),
              child: const ChatbotScreen(),
            );
          }),
    ],
  );
}
