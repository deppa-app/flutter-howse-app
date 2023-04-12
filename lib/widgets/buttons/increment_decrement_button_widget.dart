import 'package:flutter/material.dart';
//import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../utils/utils.dart';

class IncrementDecrementButtonWidget extends StatefulWidget {


  const IncrementDecrementButtonWidget({
    Key ?key,

  }) : super(key: key);

  @override
  State<IncrementDecrementButtonWidget> createState() => _IncrementDecrementButtonWidgetState();
}

class _IncrementDecrementButtonWidgetState extends State<IncrementDecrementButtonWidget> {
  int counter = 0;

  void increase() {
    counter++;
    setState(() {});
  }

  void decrease() {
    counter--;
    setState(() {});
  }

  void reset() {
    counter -= counter;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          height: 25,
          width: 25,
          child: Container(
            decoration: BoxDecoration(
                color: CustomColor.whiteColor2,
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: CustomColor.greyColor)),
            child: Center(
              child: IconButton(
                  icon: const Icon(
                    FontAwesomeIcons.minus,
                    color: CustomColor.greenColor,
                    size: 16,
                  ),
                  padding: const EdgeInsets.all(5),
                  onPressed: () => decrease()),
            ),
          ),
        ),
        SizedBox(
          width: 50,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  '$counter',
                )
              ],
            ),
          ),
        ),
        SizedBox(
          height: 25,
          width: 25,
          child: Container(
            decoration: BoxDecoration(
                color: CustomColor.whiteColor2,
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: CustomColor.greyColor)),
            child: Center(
              child: IconButton(
                  icon: const Icon(
                    FontAwesomeIcons.plus,
                    color: CustomColor.greenColor,
                    size: 16,
                  ),
                  padding: const EdgeInsets.all(5),
                  onPressed: () => increase()),
            ),
          ),
        ),
      ],
    );
  }
}