import 'package:howse_app/utils/custom_color.dart';
import 'package:flutter/material.dart';

class CircleButtonWidget extends StatelessWidget {

  final Widget icon;
  final GestureTapCallback onTap;

  const CircleButtonWidget({ Key key, this.icon, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          border: Border(
            left: BorderSide.none
          ),
          color: CustomColor.whiteColor,
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
              color: CustomColor.greyColor.withOpacity(0.4),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 0), // changes position of shadow
            ),
          ],
        ),
        child: icon,
      ),
      onTap: onTap,
    );
  }
}
