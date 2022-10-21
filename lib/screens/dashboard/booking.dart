import 'package:flutter/material.dart';
import 'package:howse_app/screens/dashboard/booking_pin.dart';



import 'package:howse_app/utils/dimensions.dart';
import 'package:howse_app/utils/strings.dart';
import 'package:howse_app/utils/utils.dart';
import 'package:howse_app/widgets/back_widget.dart';

import '../../widgets/secondary_button_widget.dart';

class Booking extends StatefulWidget {
  const Booking({Key key}) : super(key: key);

  @override
  _BookingState createState() => _BookingState();
}

class _BookingState extends State<Booking> {

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
              BackWidget(title: Strings.createAnAccount),
              const SizedBox(height: Dimensions.heightSize * 2,),
              inputFieldWidget(context),
              SizedBox(
                height: 200,
                child: Image.asset('assets/images/lorem-image.jpeg')
                ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.03,),
              Padding(
                padding: const EdgeInsets.only(
                  left: 40,
                  right: 40
                ),
                child: RichText(textAlign: TextAlign.center, text: TextSpan(text: "Recuerde que una vez haya reservado, dispones de ", style: TextStyle(
                  color: Colors.grey,
                  fontSize: Dimensions.largeTextSize,
                  fontWeight: FontWeight.bold,
                  height: 1.5
                  ), 
                  children: [
                    TextSpan(text: '30 minutos ', style: TextStyle(
                    color: CustomColor.linkColor,
                    fontSize: Dimensions.largeTextSize,
                    fontWeight: FontWeight.bold
                    ), ),
                    TextSpan(text: "para visitar. \nSi necesitas más tiempo, puedes agendar de forma programada", style: TextStyle(
                    color: Colors.grey,
                    fontSize: Dimensions.largeTextSize,
                    fontWeight: FontWeight.bold
                    ),)
                  ]
                  )
                ),
              ),
              
              SizedBox(height: MediaQuery.of(context).size.height * 0.06,),
              
              SecondaryButtonWidget(
                  title: "Visitar ahora",
                    onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder:
                    (context) => const BookingPin()));
                  },
                ),
              
              SizedBox(height: MediaQuery.of(context).size.height * 0.06,),

               Padding(
                padding: const EdgeInsets.only(
                  left: 40,
                  right: 40
                ),
                child: RichText(textAlign: TextAlign.center, text: TextSpan(text: "Si necesitas agendar tu visita ", style: TextStyle(
                  color: Colors.grey,
                  fontSize: Dimensions.largeTextSize,
                  fontWeight: FontWeight.bold,
                  height: 1.5
                  ), 
                  children: [
                    TextSpan(text: 'AHORA YA! ', style: TextStyle(
                    color: CustomColor.linkColor,
                    fontSize: Dimensions.largeTextSize,
                    fontWeight: FontWeight.bold
                    ), ),
                    TextSpan(text: 'entonces dale click al botón \n"Reservar visita ahora"', style: TextStyle(
                    color: Colors.grey,
                    fontSize: Dimensions.largeTextSize,
                    fontWeight: FontWeight.bold
                    ),)
                  ]
                  )
                ),
              ),

             
              const SizedBox(height: Dimensions.heightSize * 2,),

              SecondaryButtonWidget(
                  title: "Programar visita",
                    onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder:
                    (context) => const BookingPin()));
                  },
                ),
              
            ],
          ),
        ),
      ),
    );
  }



  inputFieldWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: Dimensions.marginSize,
        right: Dimensions.marginSize,
      ),
      child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                 padding: const EdgeInsets.only(
                    left: Dimensions.marginSize,
                    right: Dimensions.marginSize),
                    child: Text(
                      "Estás apunto de reservar una visita",
                       style: TextStyle(
                       color: CustomColor.primaryColor,
                        fontSize: Dimensions.extraLargeTextSize * 1.5,
                        fontWeight: FontWeight.bold
                       ),
                         textAlign: TextAlign.center,
                       ),
                 ),
              const SizedBox(height: Dimensions.heightSize * 2,),                  
              
          ],
        )
      )
    );
  }

    

}
