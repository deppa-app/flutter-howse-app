import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:howse_app/utils/custom_color.dart';
import 'package:howse_app/utils/dimensions.dart';

class SellerContactButtonWidget extends StatelessWidget {
  final String title;
  final GestureTapCallback onTap;
  final String phoneNumber;

  const SellerContactButtonWidget({Key key, this.title, this.onTap, this.phoneNumber})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 50.0), // Agrego un margin horizontal de 16.0,
        height: Dimensions.buttonHeight * 1.2,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: CustomColor.greenColor,
            border: Border.all(color: CustomColor.primaryColor),
            borderRadius: BorderRadius.circular(Dimensions.radius)),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: Dimensions.largeTextSize,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 2),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const FaIcon(
                    FontAwesomeIcons.phoneVolume,
                    color: CustomColor.whiteColor,
                  ),
                  SizedBox(width: 5),
                  Text(
                    phoneNumber,
                    style: TextStyle(fontSize: Dimensions.defaultTextSize, color: CustomColor.whiteColor2),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
      onTap: onTap,
    );
  }
}
