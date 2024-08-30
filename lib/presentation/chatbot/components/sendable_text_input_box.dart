import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kobot_client/ui/styles/color_styles.dart';
import 'package:kobot_client/ui/styles/size_config.dart';

class SendableTextInputBox extends StatelessWidget {
  final FocusNode focusNode;
  final TextEditingController textController;
  final void Function() send;
  final String hintText;

  const SendableTextInputBox({
    super.key,
    required this.focusNode,
    required this.textController,
    required this.send,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding:
          EdgeInsets.fromLTRB(getWidth(10), 0, getWidth(10), getHeight(25)),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color(0x0F000000),
            blurRadius: 12,
            offset: Offset(0, -4),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.only(top: getHeight(10), left: getWidth(10)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: TextField(
                focusNode: focusNode,
                controller: textController,
                onEditingComplete: send,
                textInputAction: TextInputAction.send,
                maxLines: 4,
                minLines: 1,
                decoration: InputDecoration(
                  hintText: hintText,
                  focusColor: ColorStyles.primary,
                  focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    borderSide:
                        BorderSide(color: ColorStyles.primary, width: 1.0),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    vertical: getHeight(10),
                    horizontal: getWidth(15),
                  ),
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    borderSide: BorderSide(width: 1, color: Color(0xFFA6A7A6)),
                  ),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: send,
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                elevation: 4.0,
                minimumSize: Size(getWidth(45), getHeight(45)),
                backgroundColor: ColorStyles.primary,
              ),
              child: SvgPicture.asset('assets/icons/send.svg'),
            ),
          ],
        ),
      ),
    );
  }
}
