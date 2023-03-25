import 'package:deppa_app/utils/custom_color.dart';
import 'package:flutter/material.dart';
import 'package:deppa_app/utils/dimensions.dart';



class BackButtonGeneralWidget extends StatefulWidget {
  final String title;
  //final double percent;

  const BackButtonGeneralWidget({Key ?key, this.title=''}) : super(key: key);

  @override
  _BackButtonGeneralWidgetState createState() => _BackButtonGeneralWidgetState();
}

class _BackButtonGeneralWidgetState extends State<BackButtonGeneralWidget> {
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
