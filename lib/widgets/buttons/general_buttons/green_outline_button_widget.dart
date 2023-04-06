import 'package:flutter/material.dart';
import 'package:deppa_app/utils/custom_color.dart';
import 'package:deppa_app/utils/dimensions.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class GreenOutlineButtonWidget extends StatelessWidget {
  final String ?title;
  final GestureTapCallback ?onTap;

  const GreenOutlineButtonWidget({Key ?key, this.title, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: 30,
        width: 100,
        decoration: BoxDecoration(
            color: CustomColor.whiteColor2,
            border: Border.all(color: CustomColor.greenColor),
            borderRadius: BorderRadius.circular(Dimensions.radius)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              FontAwesomeIcons.rightToBracket,
              size: 15,
              color: CustomColor.greenColor,
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              title!,
              style: TextStyle(
                  color: CustomColor.greenColor,
                  fontSize: Dimensions.defaultTextSize,
                  fontWeight: FontWeight.bold,
                  ),
            ),
          ],
        ),
      ),
      onTap: onTap,
    );
  }
}
