import 'package:flutter/material.dart';
import 'package:howse_app/utils/custom_color.dart';
import 'package:pin_keyboard/pin_keyboard.dart';

class PinKeyBoardWidget extends StatelessWidget {
  const PinKeyBoardWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PinKeyboard(
      maxWidth: 400,
      space: 70,
      length: 4,
      enableBiometric: false,
      iconBiometricColor: Colors.blue[400],
      onChange: (pin) {},
      onConfirm: (pin) {},
      onBiometric: () {},
      fontWeight: FontWeight.w600,
      textColor: CustomColor.colorBlack,
      fontSize: 41,
  );
  }
}