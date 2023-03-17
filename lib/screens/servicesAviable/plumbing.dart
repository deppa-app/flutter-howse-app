import 'package:flutter/material.dart';
import 'package:howse_app/screens/servicesAviable/successful_hiring.dart';



import 'package:howse_app/utils/dimensions.dart';
import 'package:howse_app/utils/strings.dart';
import 'package:howse_app/widgets/buttons/back_buttons/back_widget.dart';

import '../../widgets/buttons/general_buttons/secondary_button_widget.dart';

class Plumbing extends StatefulWidget {
  const Plumbing({Key key}) : super(key: key);

  @override
  _PlumbingState createState() => _PlumbingState();
}

class _PlumbingState extends State<Plumbing> {

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
              Text(
                "Servicio de plomería",
                 style: TextStyle(
                 color: Colors.grey,
                 fontSize: Dimensions.largeTextSize,
                  fontWeight: FontWeight.bold
                ),
                textAlign: TextAlign.center,
                ),
              SecondaryButtonWidget(
                  title: "Contratar",
                    onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder:
                    (context) => const SuccessfulHiring()));
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                 padding: const EdgeInsets.only(
                    left: Dimensions.marginSize,
                    right: Dimensions.marginSize),
                    child: Text(
                      "Servicio de gasfitería",
                       style: TextStyle(
                       color: Colors.black,
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
