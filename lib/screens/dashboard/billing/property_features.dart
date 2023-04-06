import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../utils/custom_color.dart';
import '../../../utils/dimensions.dart';
import '../../../utils/strings.dart';
import '../schedule_visits/Carousel.dart';

class PropertyFeatures extends StatelessWidget {
  const PropertyFeatures({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Colors.white,
          child: Scrollbar(
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
                    "Características propiedad",
                    style: TextStyle(
                        color: CustomColor.colorBlack,
                        fontSize: Dimensions.semilarge,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                const SizedBox(
                  height: Dimensions.heightSize * 2,
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.08,
                      right: MediaQuery.of(context).size.width * 0.08),
                  child: const Center(
                    child: Text(
                      "detalles Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
                      style: TextStyle(
                          color: CustomColor.colorBlack,
                          fontSize: Dimensions.heightSize,
                          fontWeight: FontWeight.w500),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                const SizedBox(
                  height: Dimensions.heightSize * 1,
                ),
                text_1propertyFeatures(context),
                const SizedBox(
                  height: Dimensions.heightSize * 1,
                ),
                Center(
                  child: RichText(
                    text: TextSpan(
                      style: const TextStyle(
                          fontSize: Dimensions.radius,
                          fontWeight: FontWeight.w500),
                      children: <TextSpan>[
                        const TextSpan(
                          text: ("Valor arriendo mensual: "),
                          style: TextStyle(color: CustomColor.colorBlack),
                        ),
                        TextSpan(
                          text: Strings.monthly_rental_value,
                          style: const TextStyle(
                            color: CustomColor.greenColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: Dimensions.heightSize * 1,
                ),
                Carousel(),
                const SizedBox(
                  height: Dimensions.heightSize * 1,
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.08,
                      right: MediaQuery.of(context).size.width * 0.08),
                  child: const Center(
                    child: Text(
                      "detalles  Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
                      style: TextStyle(
                          color: CustomColor.colorBlack,
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                const SizedBox(
                  height: Dimensions.heightSize * 1.5,
                ),
                const Divider(
                  color: CustomColor.greenColor,
                ),
                const SizedBox(
                  height: Dimensions.heightSize * 1.5,
                ),
                const Center(
                  child: Text(
                    "Dirección de la propiedad",
                    style: TextStyle(
                        color: CustomColor.colorBlack,
                        fontSize: Dimensions.radius,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                const SizedBox(
                  height: Dimensions.heightSize * 1.5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Center(
                        child: Icon(
                      FontAwesomeIcons.podcast,
                      color: CustomColor.greyColor,
                    )),
                    Center(
                      child: Text(
                        Strings.property_location,
                        style: const TextStyle(
                            color: CustomColor.greyColor,
                            fontSize: Dimensions.heightSize,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: Dimensions.heightSize * 2,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

text_1propertyFeatures(BuildContext context) {
  return Padding(
    padding: EdgeInsets.all(16.0), // Añade un relleno de 16.0 a todos los lados
    child: Container(
      width: 328,
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: CustomColor.whiteColor,
        border: Border.all(
          style: BorderStyle.none,
          color: CustomColor.greyColor,
          width: 0.1,
        ),
      ),
      child: ListView(
        children: [
          Expanded(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  text_2propertyFeatures(context, Strings.code1, "value"),
                  const SizedBox(
                    height: Dimensions.heightSize * 0.25,
                  ),
                  text_2propertyFeatures(context, Strings.bathroom1, "value"),
                  const SizedBox(
                    height: Dimensions.heightSize * 0.25,
                  ),
                  text_2propertyFeatures(context, Strings.parking1, "value"),
                  const SizedBox(
                    height: Dimensions.heightSize * 0.25,
                  ),
                  text_2propertyFeatures(context, Strings.bedrooms1, "value"),
                  const SizedBox(
                    height: Dimensions.heightSize * 0.25,
                  ),
                  text_2propertyFeatures(
                      context, Strings.environments, "value"),
                  const SizedBox(
                    height: Dimensions.heightSize * 0.25,
                  ),
                  text_2propertyFeatures(
                      context, Strings.common_expenses, "value"),
                  const SizedBox(
                    height: Dimensions.heightSize * 0.25,
                  ),
                  text_2propertyFeatures(
                      context, Strings.pets_allowed, "value"),
                  const SizedBox(
                    height: Dimensions.heightSize * 0.25,
                  ),
                  text_2propertyFeatures(context, Strings.total_area, "value"),
                  const SizedBox(
                    height: Dimensions.heightSize * 0.25,
                  ),
                  text_2propertyFeatures(context, Strings.usable_area, "value"),
                  const SizedBox(
                    height: Dimensions.heightSize * 0.25,
                  ),
                  text_2propertyFeatures(
                      context, Strings.number_of_floors, "value"),
                  const SizedBox(
                    height: Dimensions.heightSize * 0.25,
                  ),
                  text_2propertyFeatures(
                      context, Strings.apartment_per_floor, "value"),
                  const SizedBox(
                    height: Dimensions.heightSize * 0.25,
                  ),
                  text_2propertyFeatures(
                      context, Strings.number_of_floors1, "value")
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  text_2propertyFeatures(context, Strings.mts2, "value"),
                  const SizedBox(
                    height: Dimensions.heightSize * 0.25,
                  ),
                  text_2propertyFeatures(context, Strings.wineries, "value"),
                  const SizedBox(
                    height: Dimensions.heightSize * 0.25,
                  ),
                  text_2propertyFeatures(context, Strings.orientation, "value"),
                  const SizedBox(
                    height: Dimensions.heightSize * 0.25,
                  ),
                  text_2propertyFeatures(context, Strings.services1, "value")
                ],
              ),
            ],
          )),
        ],
      ),
    ),
  );
}

text_2propertyFeatures(BuildContext context, String string, String value) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      const Icon(
        FontAwesomeIcons.circleCheck,
        color: CustomColor.brownColor2,
        size: 7.82,
      ),
      Text(
        string,
        style: TextStyle(
            color: CustomColor.colorBlack,
            fontSize: Dimensions.smallTextSize,
            fontWeight: FontWeight.bold),
      ),
      Text(
        value,
        style: TextStyle(
            color: CustomColor.colorBlack,
            fontSize: Dimensions.smallTextSize,
            fontWeight: FontWeight.bold),
      )
    ],
  );
}
