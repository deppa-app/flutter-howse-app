import 'package:flutter/material.dart';
import 'package:howse_app/utils/custom_color.dart';
import 'package:howse_app/utils/dimensions.dart';
                 
class SecondaryButtonWidget extends StatelessWidget {
  final String title;
  final GestureTapCallback onTap;

  const SecondaryButtonWidget({Key key, this.title , this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: Dimensions.buttonHeight,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: CustomColor.secondaryColor,
            borderRadius: BorderRadius.circular(Dimensions.radius)
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
                color: CustomColor.accentColor,
                fontSize: Dimensions.largeTextSize,
                fontWeight: FontWeight.bold
            ),
          ),
        ),
      ),
      onTap: onTap,
    );
  }
}
