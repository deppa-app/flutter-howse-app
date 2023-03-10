import 'package:flutter/material.dart';
import 'package:howse_app/utils/custom_color.dart';
import 'package:howse_app/utils/dimensions.dart';

class PrimaryButtonWidget extends StatelessWidget {
  final String title;
  final GestureTapCallback onTap;

  const PrimaryButtonWidget({Key key, this.title, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: Dimensions.buttonHeight,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: CustomColor.brownColor),
            borderRadius: BorderRadius.circular(Dimensions.radius)),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
                color: CustomColor.brownColor,
                fontSize: Dimensions.largeTextSize,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
      onTap: onTap,
    );
  }
}
