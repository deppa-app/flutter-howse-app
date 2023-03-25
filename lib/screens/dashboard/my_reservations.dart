import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quds_popup_menu/quds_popup_menu.dart';

import '../../utils/custom_color.dart';
import '../../utils/dimensions.dart';
import '../../utils/strings.dart';

class MyReservations extends StatelessWidget {
  const MyReservations({Key ?key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: null,
      backgroundColor: CustomColor.whiteColor,
      onPressed: () {  },
      child: QudsPopupButton(
          backgroundColor: CustomColor.whiteColor2,
          tooltip: 'Reservations',
          items: getMenuItems(),
          radius: 10,
          child: const Icon(
            FontAwesomeIcons.circleCheck,
            size: Dimensions.buttonHeight,
            color: CustomColor.greenColor,
          )),
    );
  }
}

List<QudsPopupMenuBase> getMenuItems() {
  return [
    QudsPopupMenuWidget(
      builder: (c) => Column(
        children: [
          const SizedBox(
            height: 15,
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Mis Reservas',
                  style: TextStyle(
                      fontSize: Dimensions.smallTextSize,
                      fontWeight: FontWeight.w600),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  Strings.date + ' - ' + Strings.time,
                  style: const TextStyle(
                    color: CustomColor.greenColor,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const FadeInImage(
              placeholder: AssetImage('assets/images/no-image.jpg'),
              fit: BoxFit.cover,
              image: AssetImage('assets/images/casita.png'),
              width: 56,
              height: 64,
            ),
            title: Text(Strings.lease_status),
            subtitle: Text(Strings.rental_location1),
          ),
          Divider(),
        ],
      ),
    ),
  ];
}
