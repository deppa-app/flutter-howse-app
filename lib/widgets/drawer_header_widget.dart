import 'package:howse_app/utils/custom_color.dart';
import 'package:howse_app/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:howse_app/utils/dimensions.dart';

class DrawerHeaderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 200,
        child: Column(children: [
          Image.asset(
            'assets/images/ab.png',
            width: 70,
          ),
          Padding(
              padding: EdgeInsets.only(
                  top: Dimensions.heightSize * 1,
                  bottom: Dimensions.heightSize,
                  left: (Dimensions.widthSize * 6)),
              child: ListTile(
                title: Text(
                  Strings.demoName,
                  style: TextStyle(
                      color: CustomColor.blueColor,
                      fontWeight: FontWeight.bold,
                      fontSize: Dimensions.largeTextSize),
                ),
                subtitle: Text(
                  Strings.demoEmail,
                  style: TextStyle(
                    color: CustomColor.blueColor,
                  ),
                ),
                onTap: () {},
              ))
        ]));
  }
}
