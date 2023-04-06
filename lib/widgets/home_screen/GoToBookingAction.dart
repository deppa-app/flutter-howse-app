


// ignore: camel_case_types


import 'package:flutter/material.dart';

import '../../utils/utils.dart';
import '../widget.dart';

class GoToBookingAction extends StatelessWidget {
  const GoToBookingAction({
    Key? key,
    this.changeMessage = false,
  }) : super(key: key);
  final bool changeMessage;
  @override
  Widget build(BuildContext context) {
    return SecondaryButtonWidget(
      title: changeMessage ? 'Abrir puerta' : Strings.visitNow,
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const Booking()));
      },
    );
  }
}