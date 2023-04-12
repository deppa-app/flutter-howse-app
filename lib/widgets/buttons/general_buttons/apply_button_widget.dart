import 'package:flutter/material.dart';
//import 'package:flutter/widgets.dart';
import 'package:deppa_app/utils/custom_color.dart';
import 'package:deppa_app/utils/dimensions.dart';

class ApplyButtonWidget extends StatelessWidget {
  final String ?title;
  final GestureTapCallback ?onTap;
  final BorderRadius ?borderRadius;

  const ApplyButtonWidget({Key ?key, this.title, this.onTap, this.borderRadius})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 50.0), // Agrego un margin horizontal de 16.0,
        height: Dimensions.buttonHeight,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: CustomColor.greenColor,
            border: Border.all(color: CustomColor.primaryColor),
            borderRadius: BorderRadius.circular(50)),
        child: Center(
          child: Text(
            title!,
            style: TextStyle(
                color: Colors.white,
                fontSize: Dimensions.largeTextSize,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
      onTap: onTap,
    );
  }
}