import 'package:flutter/material.dart';
import 'package:kobot_client/ui/styles/color_styles.dart';
import 'package:kobot_client/ui/styles/size_config.dart';

abstract class TextStyles {
  static TextStyle custom(double fontSize, [Color? fontColor, double? height]) {
    return TextStyle(
      color: fontColor ?? ColorStyles.black,
      fontSize: getHeight(fontSize),
      fontFamily: 'Pretendard',
      fontWeight: FontWeight.w600,
      height: 0,
    );
  }

  static TextStyle appBarText = TextStyle(
    fontSize: getHeight(20),
    color: ColorStyles.black,
    fontFamily: 'Pretendard',
    fontWeight: FontWeight.w700,
  );

  static TextStyle boldText = TextStyle(
    fontSize: getHeight(16),
    color: ColorStyles.black,
    fontFamily: 'Pretendard',
    fontWeight: FontWeight.w600,
  );
  static TextStyle hintText = TextStyle(
    fontSize: getHeight(14),
    color: ColorStyles.gray3,
    fontFamily: 'Pretendard',
    fontWeight: FontWeight.w600,
  );

  static TextStyle chatbotAnswerText = TextStyle(
    fontSize: getHeight(14),
    color: ColorStyles.black,
    fontFamily: 'Pretendard',
    fontWeight: FontWeight.w600,
  );

  static TextStyle chatbotQuestionText = TextStyle(
    fontSize: getHeight(14),
    color: ColorStyles.white,
    fontFamily: 'Pretendard',
    fontWeight: FontWeight.w400,
  );
}
