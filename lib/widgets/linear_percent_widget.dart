import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../utils/custom_color.dart';

class LinearPercentWidget extends StatelessWidget {
  const LinearPercentWidget({
    Key ?key,
    required this.percent,
  }) : super(key: key);
  final double percent;

  @override
  Widget build(BuildContext context) {
    return LinearPercentIndicator(
        width: MediaQuery.of(context).size.width * 0.8,
        lineHeight: 16.0,
        percent: percent,
        barRadius: const Radius.circular(30),
        backgroundColor: CustomColor.greyColorBar,
        progressColor: CustomColor.primaryColor,
        
        
    );
  }
}
