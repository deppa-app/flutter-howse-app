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
    return Container(
          decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          border: Border.all(
            color: CustomColor.greyColorBar,
          ),
      ),
      //padding: const EdgeInsets.only(top: 10),
      child: LinearPercentIndicator(
        width: MediaQuery.of(context).size.width * 0.8,
        lineHeight: 16.0,
        //La variable "percent" está llegando nula, por esto tira la excepción y no deja pasar a la siguiente pantalla.
        //De forma temporal le agregué una condición para que su valor sea 0.0 en caso de que sea nulo.
        //TODO: DEJAR COMO ESTABA SIN LA CONDICIÓN (percent: percent)
        percent: percent,
        barRadius: const Radius.circular(30),
        backgroundColor: CustomColor.whiteColor,
        progressColor: CustomColor.greenColor,
      ),
    );
  }
}
