import 'package:deppa_app/widgets/buttons/back_buttons/back_button_general_widget.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../utils/custom_color.dart';
import '../../utils/dimensions.dart';
import '../../utils/strings.dart';

class Rental_History extends StatefulWidget {
  const Rental_History({Key ?key}) : super(key: key);

  @override
  State<Rental_History> createState() => _Rental_HistoryState();
}

class _Rental_HistoryState extends State<Rental_History> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Colors.white,
          child: ListView(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            children: [
              const BackButtonGeneralWidget(),
              const SizedBox(
                height: Dimensions.heightSize * 2,
              ),
              Center(
                child: Text(
                  "Historial de Arriendos",
                  style: TextStyle(
                      color: CustomColor.colorBlack,
                      fontSize: Dimensions.semilarge,
                      fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(
                height: Dimensions.heightSize * 2,
              ),
              Column(
                children: [
                  ListTile(
                    leading: const Icon(
                      FontAwesomeIcons.houseChimneyWindow,
                      color: CustomColor.greenColor,
                    ),
                    title: Text(Strings.rental_location),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          Strings.rent_payment,
                          style: const TextStyle(
                            color: CustomColor.greenColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Divider(),
                  ListTile(
                    leading: const Icon(
                      FontAwesomeIcons.houseChimneyWindow,
                      color: CustomColor.greenColor,
                    ),
                    title: Text(Strings.rental_location),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          Strings.rent_payment,
                          style: const TextStyle(
                            color: CustomColor.greenColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Divider(),
                  ListTile(
                    leading: const Icon(
                      FontAwesomeIcons.houseChimneyWindow,
                      color: CustomColor.greenColor,
                    ),
                    title: Text(Strings.rental_location),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          Strings.rent_payment,
                          style: const TextStyle(
                            color: CustomColor.greenColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Divider(),
                  ListTile(
                    leading: const Icon(
                      FontAwesomeIcons.houseChimneyWindow,
                      color: CustomColor.greenColor,
                    ),
                    title: Text(Strings.rental_location),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          Strings.rent_payment,
                          style: const TextStyle(
                            color: CustomColor.greenColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
