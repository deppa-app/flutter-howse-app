import 'package:flutter/material.dart';
import 'package:deppa_app/utils/custom_color.dart';
import 'package:deppa_app/utils/dimensions.dart';

class PrimaryButtonWidget extends StatelessWidget {
  final String ?title;
  final GestureTapCallback ?onTap;

  const PrimaryButtonWidget({Key ?key, this.title, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 50.0),
        height: Dimensions.buttonHeight,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: CustomColor.brownColor2),
            borderRadius: BorderRadius.circular(Dimensions.radius)),
        child: Center(
          child: Text(
            title!,
            style: TextStyle(
                color: CustomColor.brownColor2,
                fontSize: Dimensions.largeTextSize,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
      onTap: onTap,
    );
  }
}
