import 'package:flutter/material.dart';

import '../../utils/utils.dart';

class GreyDivider extends StatelessWidget {
  const GreyDivider({
    Key ?key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.9,
          child: const Divider(
              height: 25, color: CustomColor.greyColor, thickness: 1)),
    );
  }
}