import 'package:flutter/material.dart';
import 'package:kobot_client/presentation/splash/splash_view_model.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<SplashViewModel>();

    if (viewModel.isLoaded == true) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        context.go('/chat');
      });
    }

    return Image.asset(
      viewModel.backgroundImgPath,
      width: double.infinity,
      height: double.infinity,
      fit: BoxFit.cover,
    );
  }
}
