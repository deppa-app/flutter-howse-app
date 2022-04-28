import 'package:flutter/material.dart';
import 'package:howse_app/utils/custom_color.dart';
import 'package:howse_app/utils/dimensions.dart';

class PrimaryButtonWidget extends StatelessWidget {
  final String title;
  final GestureTapCallback onTap;

<<<<<<< HEAD
  const PrimaryButtonWidget({Key key, this.title, this.onTap})
      : super(key: key);
=======
  const PrimaryButtonWidget({Key key, this.title, this.onTap}) : super(key: key);
>>>>>>> main

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: Dimensions.buttonHeight,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
<<<<<<< HEAD
            color: Colors.white,
            border: Border.all(color: CustomColor.greyColor),
            borderRadius: BorderRadius.circular(Dimensions.radius)),
=======
            color: CustomColor.primaryColor,
            borderRadius: BorderRadius.circular(Dimensions.radius)
        ),
>>>>>>> main
        child: Center(
          child: Text(
            title,
            style: TextStyle(
<<<<<<< HEAD
                color: CustomColor.primaryColor,
                fontSize: Dimensions.largeTextSize,
                fontWeight: FontWeight.bold),
=======
                color: Colors.white,
                fontSize: Dimensions.largeTextSize,
                fontWeight: FontWeight.bold
            ),
>>>>>>> main
          ),
        ),
      ),
      onTap: onTap,
    );
  }
}
