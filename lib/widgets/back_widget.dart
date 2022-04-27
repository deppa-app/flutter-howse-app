import 'package:howse_app/utils/custom_color.dart';
import 'package:flutter/material.dart';
import 'package:howse_app/utils/dimensions.dart';

class BackWidget extends StatefulWidget {
  final String title;

  const BackWidget({Key key, this.title}) : super(key: key);

  @override
  _BackWidgetState createState() => _BackWidgetState();
}

class _BackWidgetState extends State<BackWidget> {
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
              Icons.arrow_back_ios,
              color: CustomColor.accentColor,
              size: 20,
            ),
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
          const SizedBox(
            width: Dimensions.widthSize * 2,
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
