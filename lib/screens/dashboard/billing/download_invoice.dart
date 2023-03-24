import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../widgets/widget.dart';
import '../../../utils/custom_color.dart';
import '../../../utils/dimensions.dart';
import '../../../utils/strings.dart';
import 'detailed_service_price.dart';
import 'legal_terms.dart';

class DownloadInvoice extends StatelessWidget {
  const DownloadInvoice({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: CustomColor.whiteColor,
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
                    "Facturacion",
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
                      "detalles de terminos legales Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat",
                      style: TextStyle(
                          color: CustomColor.colorBlack,
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                const SizedBox(
                  height: Dimensions.heightSize * 2,
                ),
                text_1Invoice(context),
                const SizedBox(
                  height: Dimensions.heightSize * 1,
                ),
                const Divider(),
                const SizedBox(
                  height: Dimensions.heightSize * 1,
                ),
                text_3Invoice(context),
                const SizedBox(
                  height: Dimensions.heightSize * 1,
                ),
                const Divider(),
                const SizedBox(
                  height: Dimensions.heightSize * 1,
                ),
                Center(
                  child: SecondaryButtonWidget(
                    title: ("Revisar terminos legales "),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const Legalterms()));
                    },
                  ),
                ),
                const SizedBox(
                  height: Dimensions.heightSize * 2,
                ),
                const Center(
                  child: Text(
                    "Desglose de servicio",
                    style: TextStyle(
                        color: CustomColor.colorBlack,
                        fontSize: Dimensions.radius,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                const SizedBox(
                  height: Dimensions.heightSize * 2,
                ),
                const DetailedServicePrice(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

text_1Invoice(BuildContext context) {
  return Padding(
    padding: EdgeInsets.all(16.0), // Añade un relleno de 16.0 a todos los lados
    child: Container(
      width: 344,
      height: 60,
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
                  text_2Invoice(context, Strings.code, "value"),
                  text_2Invoice(context, Strings.bathroom, "value"),
                  text_2Invoice(context, Strings.parking, "value"),
                  text_2Invoice(context, Strings.bedrooms, "value")
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  text_2Invoice(context, Strings.services, "value"),
                  text_2Invoice(context, Strings.square_meter, "value"),
                  text_2Invoice(context, Strings.others, "value")
                ],
              ),
            ],
          )),
        ],
      ),
    ),
  );
}

text_2Invoice(BuildContext context, String string, String value) {
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

text_3Invoice(BuildContext context) {
  return Row(
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
                FontAwesomeIcons.clock,
                size: 42,
                color: CustomColor.greenColor,
              ),
            ],
          ),
          Text(
            Strings.minutes_reserved,
            style: TextStyle(
                color: CustomColor.colorBlack,
                fontSize: Dimensions.smallTextSize,
                fontWeight: FontWeight.w500),
          ),
        ],
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Icon(
            FontAwesomeIcons.clock,
            size: 42,
            color: CustomColor.greenColor,
          ),
          Text(
            Strings.busy_minutes,
            style: TextStyle(
                color: CustomColor.colorBlack,
                fontSize: Dimensions.smallTextSize,
                fontWeight: FontWeight.w500),
          ),
        ],
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Icon(
            FontAwesomeIcons.personCircleCheck,
            size: 42,
            color: CustomColor.greenColor,
          ),
          Text(
            Strings.number_of_visits,
            style: TextStyle(
                color: CustomColor.colorBlack,
                fontSize: Dimensions.smallTextSize,
                fontWeight: FontWeight.w500),
          ),
        ],
      ),
    ],
  );
}
