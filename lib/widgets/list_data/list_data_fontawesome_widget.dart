import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:howse_app/utils/custom_color.dart';
import 'package:howse_app/utils/custom_style.dart';

class ListDataFontawesomeWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  final GestureTapCallback onTap;

  const   ListDataFontawesomeWidget({Key key, this.icon, this.title, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: ListTile(
        leading: FaIcon(
          icon,
          color: CustomColor.greenColor,
        ),
        title: Text(
          title,
          style: CustomStyle.textStyle2,
        ),
        onTap: onTap,
      ),
    );
  }
}
