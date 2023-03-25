import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:deppa_app/screens/dashboard/schedule_visits/Carousel.dart';
import 'package:deppa_app/screens/dashboard/schedule_visits/calendar.dart';
import 'package:deppa_app/screens/dashboard/schedule_visits/time.dart';
import 'package:deppa_app/utils/dimensions.dart';
import 'package:deppa_app/widgets/buttons/general_buttons/secondary_button_widget.dart';

import '../../../utils/custom_color.dart';
import '../../../utils/strings.dart';
import '../booking_pin.dart';

class BookYourVisit extends StatefulWidget {
  const BookYourVisit({Key ?key}) : super(key: key);

  @override
  State<BookYourVisit> createState() => _book_your_visitState();
}

class _book_your_visitState extends State<BookYourVisit> {
  Calendar calendar = new Calendar();
  Time time = new Time();
  Carousel carousel = new Carousel();

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
              text_1(context),
              const Padding(
                padding: EdgeInsets.only(left: 40, right: 40, bottom: 40),
              ),
              const SizedBox(
                height: Dimensions.heightSize * 0.2,
              ),

              //CAROUSEL
              Carousel(),

              const SizedBox(
                height: Dimensions.heightSize * 0.2,
              ),
              Center(
                child: Text(
                  Strings.monthlyRent,
                  style: const TextStyle(
                      color: CustomColor.colorBlack,
                      fontSize: Dimensions.radius,
                      fontWeight: FontWeight.w600),
                  textAlign: TextAlign.start,
                ),
              ),
              const SizedBox(
                height: Dimensions.heightSize * 0.1,
              ),
              //TODO: agregar ícono de acercamiento
              Center(
                child: Text(
                  Strings.distance,
                  style: const TextStyle(
                      color: CustomColor.colorBlack,
                      fontSize: Dimensions.radius,
                      fontWeight: FontWeight.w600),
                  textAlign: TextAlign.start,
                ),
              ),
              const SizedBox(
                height: Dimensions.heightSize * 0.1,
              ),
              // department details 1
              text_2(context),
              const SizedBox(
                height: Dimensions.heightSize * 1,
              ),
              const Padding(
                padding: EdgeInsets.only(
                    left: Dimensions.marginSize, right: Dimensions.marginSize),
                child: Text(
                  "Seleccione dia de la visita",
                  style: TextStyle(
                      color: CustomColor.colorBlack,
                      fontSize: Dimensions.radius,
                      fontWeight: FontWeight.w600),
                  textAlign: TextAlign.start,
                ),
              ),
              const SizedBox(
                height: Dimensions.heightSize * 1,
              ),

              //CALENDAR
              Calendar(),
              const SizedBox(
                height: Dimensions.heightSize * 1,
              ),
              const Padding(
                padding: EdgeInsets.only(
                    left: Dimensions.marginSize, right: Dimensions.marginSize),
                child: Text(
                  "Seleccione hora de la visita",
                  style: TextStyle(
                      color: CustomColor.colorBlack,
                      fontSize: Dimensions.radius,
                      fontWeight: FontWeight.w600),
                  textAlign: TextAlign.start,
                ),
              ),
              const SizedBox(
                height: Dimensions.heightSize * 1,
              ),

              //TIME
              Time(),
              const SizedBox(
                height: Dimensions.heightSize * 1,
              ),
              SecondaryButtonWidget(
                title: "Reservar visita ahora",
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => BookingPin()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

text_1(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.only(
      left: Dimensions.marginSize,
      right: Dimensions.marginSize,
    ),
    child: Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(
                left: Dimensions.marginSize, right: Dimensions.marginSize),
            child: Text(
              "Reserva con tiempo tu visita",
              style: TextStyle(
                  color: CustomColor.colorBlack,
                  fontSize: Dimensions.semilarge,
                  fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            height: Dimensions.heightSize * 2,
          ),
        ],
      ),
    ),
  );
}

text_2(BuildContext context) {
  return Padding(
    padding: EdgeInsets.all(16.0), // Añade un relleno de 16.0 a todos los lados
    child: Container(
      width: 200,
      height: 125,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: CustomColor.whiteColor,
        border: Border.all(
          color: CustomColor.greyColor,
          width: 0.1,
        ),
      ),
      child: ListView(
        children: [
          Center(
            child: Text(
              Strings.department_details,
              style: TextStyle(
                  color: CustomColor.colorBlack,
                  fontSize: Dimensions.smallTextSize,
                  fontWeight: FontWeight.w500),
            ),
          ),
          Expanded(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  text_3(context, Strings.code, "value"),
                  text_3(context, Strings.bathroom, "value"),
                  text_3(context, Strings.parking, "value"),
                  text_3(context, Strings.bedrooms, "value")
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  text_3(context, Strings.services, "value"),
                  text_3(context, Strings.square_meter, "value"),
                  text_3(context, Strings.others, "value")
                ],
              ),
            ],
          )),
        ],
      ),
    ),
  );
}

text_3(BuildContext context, String string, String value) {
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
