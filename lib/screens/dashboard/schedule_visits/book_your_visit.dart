import 'package:deppa_app/widgets/buttons/back_buttons/back_button_general_widget.dart';
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
  const BookYourVisit({Key? key}) : super(key: key);

  @override
  State<BookYourVisit> createState() => _book_your_visitState();
}

class _book_your_visitState extends State<BookYourVisit> {
  Calendar calendar = const Calendar();
  Time time =  const Time();
  Carousel carousel =  const Carousel();

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
              const BackButtonGeneralWidget(),
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
              const Carousel(),

              const SizedBox(
                height: Dimensions.heightSize * 0.2,
              ),
              Center(
                child: Text(
                  Strings.monthlyRent,
                  style: TextStyle(
                      color: CustomColor.colorBlack,
                      fontSize: Dimensions.defaultTextSize,
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
                  style: TextStyle(
                      color: CustomColor.colorBlack,
                      fontSize: Dimensions.defaultTextSize,
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
               Padding(
                padding: const EdgeInsets.only(
                    left: Dimensions.marginSize, right: Dimensions.marginSize),
                child: Text(
                  "Seleccione dia de la visita",
                  style: TextStyle(
                      color: CustomColor.colorBlack,
                      fontSize: Dimensions.defaultTextSize,
                      fontWeight: FontWeight.w600),
                  textAlign: TextAlign.start,
                ),
              ),
              const SizedBox(
                height: Dimensions.heightSize * 1,
              ),

              //CALENDAR
              const Calendar(),
              const SizedBox(
                height: Dimensions.heightSize * 1,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: Dimensions.marginSize, right: Dimensions.marginSize),
                child: Text(
                  "Seleccione hora de la visita",
                  style: TextStyle(
                      color: CustomColor.colorBlack,
                      fontSize: Dimensions.defaultTextSize,
                      fontWeight: FontWeight.w600),
                  textAlign: TextAlign.start,
                ),
              ),
              const SizedBox(
                height: Dimensions.heightSize * 1,
              ),

              //TIME
              const Time(),
              const SizedBox(
                height: Dimensions.heightSize * 1,
              ),
              SecondaryButtonWidget(
                title: "Reservar visita ahora",
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const BookingPin()));
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
    padding: const EdgeInsets.all(
        16.0), // Añade un relleno de 16.0 a todos los lados
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
          const SizedBox(
            height: Dimensions.heightSize * 0.75,
          ),
          Center(
            child: Text(
              Strings.department_details,
              style: TextStyle(
                  color: CustomColor.colorBlack,
                  fontSize: Dimensions.smallTextSize,
                  fontWeight: FontWeight.w500),
            ),
          ),
          const SizedBox(
            height: Dimensions.heightSize * 0.25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  text_3(context, Strings.code, "value"),
                  const SizedBox(
                    height: Dimensions.heightSize * 0.25,
                  ),
                  text_3(context, Strings.bathroom, "value"),
                  const SizedBox(
                    height: Dimensions.heightSize * 0.25,
                  ),
                  text_3(context, Strings.parking, "value"),
                  const SizedBox(
                    height: Dimensions.heightSize * 0.25,
                  ),
                  text_3(context, Strings.bedrooms, "value")
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  text_3(context, Strings.services, "value"),
                  const SizedBox(
                    height: Dimensions.heightSize * 0.25,
                  ),
                  text_3(context, Strings.square_meter2, "value"),
                  const SizedBox(
                    height: Dimensions.heightSize * 0.25,
                  ),
                  text_3(context, Strings.others, "value")
                ],
              ),
            ],
          ),
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
