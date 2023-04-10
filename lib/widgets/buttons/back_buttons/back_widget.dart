import 'package:deppa_app/utils/custom_color.dart';
import 'package:flutter/material.dart';
import 'package:deppa_app/utils/dimensions.dart';

import '../../linear_percent_widget.dart';

class BackWidget extends StatefulWidget {
  final String title;
  final double percent;

  const BackWidget({Key ?key, required this.title, required this.percent}) : super(key: key);

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
              Icons.arrow_back_ios_new_outlined,
              color: CustomColor.primaryColor,
              size: 25,
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
          ),
          widget.percent != 0
              ? LinearPercentWidget(percent: widget.percent)
              : const Text('')
        ],
      ),
    );
  }
}
