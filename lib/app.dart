import 'package:flutter/material.dart';
import 'package:kobot_client/config/routers.dart';
import 'package:kobot_client/ui/styles/color_styles.dart';
import 'package:kobot_client/ui/styles/size_config.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return MaterialApp.router(
      title: 'KoBOT',
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: ColorStyles.primary,
      ),
      debugShowCheckedModeBanner: false,
      routerConfig: Routes.router,
    );
  }
}
