import 'package:flutter/material.dart';
import 'package:howse_app/screens/dashboard/home_screen.dart';
import 'package:howse_app/utils/dimensions.dart';
import 'package:howse_app/utils/strings.dart';
import '../../utils/custom_color.dart';
import '../../widgets/widget.dart';
import 'booking_details.dart';

class BookingConfirmed extends StatefulWidget {
  const BookingConfirmed({Key key}) : super(key: key);

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
              const SizedBox(height: Dimensions.heightSize * 2,),
              inputFieldWidget(context),
              SizedBox(
                height: 200,
                child: Image.asset('assets/images/tinck.png')
              ),
              const SizedBox(height: 21,),

              const Text(
                "Ha realizado con éxito su solicitud",
                 style: TextStyle(
                 color: CustomColor.colorBlack,
                 fontSize: 18,
                  fontWeight: FontWeight.w600
                ),
                textAlign: TextAlign.center,
                ),
              const SizedBox(height: 21,),
                GestureDetector(
                child:  const Text(
                  "ver detalle de visita",
                  style: TextStyle(
                      color: CustomColor.brownColor2,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                      ),
                      textAlign:TextAlign.center,
                ),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const BookingDetails()));
                },
              ),
              const SizedBox(
                height: 226,
              ),
              SecondaryButtonWidget(
                  title: "Volver al inicio",
                    onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder:
                    (context) => const HomeScreen()));
                  },
                ),
              const SizedBox(height: Dimensions.heightSize * 2,),
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Padding(
                 padding: EdgeInsets.symmetric(
                    horizontal: 150),
                    child: Text(
                      "¡Felicidades!",
                       style: TextStyle(
                       color: CustomColor.greenColor,
                        fontSize: 25,
                        fontWeight: FontWeight.w600
                       ),
                         textAlign: TextAlign.center,
                       ),
                        ),
              SizedBox(height: Dimensions.heightSize * 2,),                  
          ],
        )
      )
    );
  }

    

}
