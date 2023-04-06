import 'package:deppa_app/screens/dashboard/schedule_visits/my_visits_history_screen.dart';
import 'package:flutter/material.dart';
import 'package:deppa_app/screens/dashboard/home_screen.dart';

import 'package:deppa_app/utils/dimensions.dart';
import 'package:deppa_app/utils/strings.dart';
import '../../utils/custom_color.dart';
import '../../widgets/widget.dart';
import 'booking_details.dart';

class BookingConfirmed extends StatefulWidget {
  const BookingConfirmed({Key ?key}) : super(key: key);

  @override
  _BookingConfirmedState createState() => _BookingConfirmedState();
}

class _BookingConfirmedState extends State<BookingConfirmed> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

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
              inputFieldWidget(context),
              SizedBox(
                height: 286,
                width: 360,
                child: Image.asset('assets/images/tinck.png')
              ),
              const SizedBox(height: 21,),

               Text(
                "Ha realizado con éxito su solicitud",
                style: TextStyle(
                    color: CustomColor.colorBlack,
                    fontSize: Dimensions.largeTextSize + 2,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 15,
              ),
              GestureDetector(
                child: Text(
                  "ver detalle de visita",
                  style: TextStyle(
                      color: CustomColor.brownColor2,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                      fontSize: Dimensions.defaultTextSize + 2
                      ),
                      textAlign:TextAlign.center,
                ),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>  BookingDetails()));
                },
              ),
              const SizedBox(
                height: 226,
              ),
              SecondaryButtonWidget(
                title: "Ir a mis reservas",
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>  MyVisitsHistory()));
                },
              ),
              const SizedBox(
                height: Dimensions.heightSize * 0.5,
              ),
            ],
          ),
        ),
      ),
    );
  }

  inputFieldWidget(BuildContext context) {
    return Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: Dimensions.marginSize,
                  right: Dimensions.marginSize),
              child: Text(
                "¡Felicidades!",
                style: TextStyle(
                    color: CustomColor.greenColor,
                    fontSize: Dimensions.semilarge,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: Dimensions.heightSize * 2,
            ),
          ],
        ));
  }
}
