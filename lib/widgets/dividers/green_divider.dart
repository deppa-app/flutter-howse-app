import 'package:flutter/material.dart';

import '../../utils/utils.dart';

class GreenDivider extends StatelessWidget {
  const GreenDivider({
    Key ?key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.95,
          child: const Divider(
              height: 25, color: CustomColor.greenColor, thickness: 1)),
    );
  }
}