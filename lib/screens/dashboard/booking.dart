import 'package:flutter/material.dart';
import 'package:howse_app/screens/dashboard/booking_pin.dart';



import 'package:howse_app/utils/dimensions.dart';
import 'package:howse_app/utils/strings.dart';
import 'package:howse_app/utils/utils.dart';
import 'package:howse_app/widgets/back_widget.dart';

import '../../widgets/secondary_button_widget.dart';
import '../../widgets/widget.dart';

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
              AppBar(
                iconTheme: const IconThemeData(color: CustomColor.greenColor),
                backgroundColor: Colors.white,
                elevation: 0,
              ),
              //BackWidget(title: Strings.createAnAccount),
              const SizedBox(height: Dimensions.heightSize * 4,),
              inputFieldWidget(context),
              Padding(padding: const EdgeInsets.only(
                  left: 40,
                  right: 40,
                  bottom: 40
                ),
                child: RichText(textAlign: TextAlign.center, text: TextSpan(text: "Recuerda que una vez reserves,\n dispones de ", style: TextStyle(
                  color: Colors.grey,
                  fontSize: Dimensions.largeTextSize,
                  fontWeight: FontWeight.bold,
                  height: 1.5
                  ),children:[
                    TextSpan(text: '30 minutos ', style: TextStyle(
                    color: CustomColor.brownColor2,
                    fontSize: Dimensions.largeTextSize,
                    fontWeight: FontWeight.bold
                    ), ),
                    const TextSpan(
                      text: 'para visitar.\n Si necesitas más tiempo, puedes agendar\n con tiempo.'
                    )
                  ]
                  )
                  ),
                  
                ),
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
                child: RichText(textAlign: TextAlign.center, 
                text: TextSpan(
                  text: '"SI NECESITAS MÁS TIEMPO\n', 
                  style: TextStyle(
                    color: CustomColor.brownColor2,
                    fontSize: Dimensions.largeTextSize,
                    fontWeight: FontWeight.bold
                  ), 
                  children: [
                    TextSpan(text: 'para llegar a la propiedad, puedes\n Programar tu visita haciendo clic\n en el siguiente botón', style: TextStyle(
                    color: CustomColor.colorBlack,
                    fontSize: Dimensions.largeTextSize,
                    fontWeight: FontWeight.normal,
                    height: 1.5
                    ), )
                  ]
                  )
                ),
              ),
              
              SizedBox(height: MediaQuery.of(context).size.height * 0.06,),
              
              SecondaryOutlineButtonWidget(
                  title: "Programar visita",
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
                child: RichText(textAlign: TextAlign.center, text: TextSpan(text: '"Si necesitas agendar tu visita' , style: TextStyle(
                  color: Colors.grey,
                  fontSize: Dimensions.largeTextSize,
                  fontWeight: FontWeight.bold,
                  height: 1.5
                  ), 
                  children: [
                    TextSpan(text: 'AHORA\n ', style: TextStyle(
                    color: CustomColor.brownColor2,
                    fontSize: Dimensions.largeTextSize,
                    fontWeight: FontWeight.bold
                    ), ),
                    TextSpan(text: 'entonces dale click al botón Reservar visitar ahora"', style: TextStyle(
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
                /* child:  const SizedBox(), */
                  title: "Reservar visita ahora",
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
                      "¡Estás apunto de reservar una visita!",
                       style: TextStyle(
                       color: CustomColor.brownColor2,
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
