import 'package:flutter/material.dart';

import '../../screens/screens.dart';
import '../../utils/utils.dart';
import '../widget.dart';

class GoToBookYourVisitAction extends StatelessWidget {
  const GoToBookYourVisitAction({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PrimaryButtonWidget(
      title: Strings.scheduleAvisit,
      onTap: () {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const BookYourVisit()));
      },
    );
  }
}