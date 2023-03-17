import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../utils/custom_color.dart';
import '../../utils/dimensions.dart';
import '../../utils/strings.dart';

class Billing extends StatefulWidget {
  const Billing({Key key}) : super(key: key);

  @override
  State<Billing> createState() => _BillingState();
}

class _BillingState extends State<Billing> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: CustomColor.whiteColor,
          child: ListView(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            children: [
              AppBar(
                iconTheme: const IconThemeData(color: CustomColor.greenColor),
                backgroundColor: CustomColor.whiteColor,
                elevation: 0,
              ),
              const SizedBox(
                height: Dimensions.heightSize * 2,
              ),
              Center(
                child: Text(
                  "Resumen",
                  style: TextStyle(
                      color: CustomColor.colorBlack,
                      fontSize: Dimensions.semilarge,
                      fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(
                height: Dimensions.heightSize * 2,
              ),
              Text_1Billing(context),
              const SizedBox(
                height: Dimensions.heightSize * 1,
              ),
              Center(
                child: Text(
                  "Historial de pagos",
                  style: TextStyle(
                      color: CustomColor.colorBlack,
                      fontSize: Dimensions.semilarge,
                      fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(
                height: Dimensions.heightSize * 1,
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

Text_1Billing(BuildContext context) {
  return Expanded(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Stack(
              children: const [
                Icon(
                  FontAwesomeIcons.circleDollarToSlot,
                  color: CustomColor.brownColor2,
                ),
                Icon(
                  FontAwesomeIcons.eye,
                  color: CustomColor.brownColor2,
                ),
              ],
            ),
            Text(
              Strings.paid_views,
              style: TextStyle(
                  color: CustomColor.colorBlack,
                  fontSize: Dimensions.smallTextSize,
                  fontWeight: FontWeight.w500),
            ),
            Text(
              Strings.paid_views_value,
              style: TextStyle(
                  color: CustomColor.colorBlack,
                  fontSize: Dimensions.semilargelarge,
                  fontWeight: FontWeight.w500),
            )
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Icon(
              FontAwesomeIcons.houseCircleXmark,
              color: CustomColor.brownColor2,
            ),
            Text(
              Strings.views_used,
              style: TextStyle(
                  color: CustomColor.colorBlack,
                  fontSize: Dimensions.smallTextSize,
                  fontWeight: FontWeight.w500),
            ),
            Text(
              Strings.views_used_value,
              style: TextStyle(
                  color: CustomColor.colorBlack,
                  fontSize: Dimensions.semilargelarge,
                  fontWeight: FontWeight.w500),
            )
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Icon(
              FontAwesomeIcons.houseCircleCheck,
              color: CustomColor.brownColor2,
            ),
            Text(
              Strings.views_available,
              style: TextStyle(
                  color: CustomColor.colorBlack,
                  fontSize: Dimensions.smallTextSize,
                  fontWeight: FontWeight.w500),
            ),
            Text(
              Strings.views_available_value,
              style: TextStyle(
                  color: CustomColor.colorBlack,
                  fontSize: Dimensions.semilargelarge,
                  fontWeight: FontWeight.w500),
            )
          ],
        ),
      ],
    ),
  );
}