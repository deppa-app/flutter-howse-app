import 'package:howse_app/utils/custom_color.dart';
import 'package:flutter/material.dart';
import 'package:howse_app/utils/dimensions.dart';

import 'linear_percent_widget.dart';

class BackGeneralWidget extends StatefulWidget {
  final String title;
  //final double percent;

  const BackGeneralWidget({Key key, this.title=''}) : super(key: key);

  @override
  _BackGeneralWidgetState createState() => _BackGeneralWidgetState();
}

class _BackGeneralWidgetState extends State<BackGeneralWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          left: Dimensions.marginSize, top: Dimensions.heightSize),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          GestureDetector(
            child: const Icon(
              Icons.arrow_back_ios_new_outlined,
              color: CustomColor.greenColor,
              size: 20,
            ),
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
          const SizedBox(
            width: Dimensions.widthSize * 1,
          ),
          Text(
            widget.title,
            style: TextStyle(
                fontSize: Dimensions.extraLargeTextSize,
                fontWeight: FontWeight.bold,
                color: CustomColor.accentColor),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
