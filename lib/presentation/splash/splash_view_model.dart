import 'package:flutter/material.dart';

class SplashViewModel extends ChangeNotifier {
  SplashViewModel() {
    _init();
  }

  final String _backgroundImg = 'assets/images/kobot_splash_background.png';
  String get backgroundImgPath => _backgroundImg;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  void _init() async {
    await Future.delayed(const Duration(seconds: 1));
    _isLoaded = true;
    notifyListeners();
  }
}
