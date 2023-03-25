// This is a stateful widget that displays a range slider.
import 'package:flutter/material.dart';
import '../../utils/utils.dart';

class RangeSliderWidget extends StatefulWidget {
  const RangeSliderWidget({Key ?key}) : super(key: key);

  @override
  _RangeSliderWidgetState createState() => _RangeSliderWidgetState();
}

class _RangeSliderWidgetState extends State<RangeSliderWidget> {
// Initializing the starting values of the range slider.
  RangeValues _values = const RangeValues(0.2, 0.8);
  @override
  Widget build(BuildContext context) {
    return RangeSlider(
// Setting the initial values of the range slider.
      values: _values,
// Setting the minimum and maximum values of the range slider.
      min: 0.0,
      max: 1.0,
// Setting the callback for when the range slider is changed.
      onChanged: (values) {
        setState(() {
          _values = values;
        });
      },
// Setting the labels to display on the range slider.
      labels: const RangeLabels(
        '0',
        '2.000.000',
      ),
// Setting the active and inactive colors of the range slider.
      activeColor: CustomColor.greenColor,
      inactiveColor: Colors.grey,
    );
  }
}