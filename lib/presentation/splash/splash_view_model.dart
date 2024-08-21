import 'package:flutter/material.dart';

class SplashViewModel extends ChangeNotifier {
  SplashViewModel() {
    _init();
  }

  final String _backgroundImg = 'assets/images/kobot_splash_background.png';
  String get backgroundImgPath => _backgroundImg;

  bool? _isLoaded;
  bool? get isLoaded => _isLoaded;

  void _init() {
    Future.delayed(const Duration(seconds: 2), () {
      _isLoaded = true;
      notifyListeners();
    });
  }
}
