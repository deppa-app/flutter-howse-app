import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:deppa_app/screens/auth/auth.dart';
import 'package:deppa_app/utils/utils.dart';
import 'package:deppa_app/widgets/widget.dart';

class SignUpPaymentCard extends StatefulWidget {
  const SignUpPaymentCard({Key ?key}) : super(key: key);

  @override
  _SignUpPaymentCardState createState() => _SignUpPaymentCardState();
}

class _SignUpPaymentCardState extends State<SignUpPaymentCard> {
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
              const BackWidget(
                title: '',
                percent: 0.8,
              ),
              const SizedBox(
                height: Dimensions.heightSize * 2,
              ),
              inputFieldWidget(context),
              paymentMethodStack(),
              rowIconCard(
                  context,
                  Image.asset('assets/images/icon/card_cash.png', scale: 1.5),
                  Strings.creditCard),
              customDivider(),
              ListTileCustom(
                fontAwesomeIcon: FontAwesomeIcons.ccVisa,
                title: Strings.creditVisa,
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const SignUpCardData()));
                },
              ),
              ListTileCustom(
                fontAwesomeIcon: FontAwesomeIcons.ccPaypal,
                title: Strings.creditVisa,
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const SignUpCardData()));
                },
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              rowIconCard(
                  context,
                  const FaIcon(
                    FontAwesomeIcons.creditCard,
                    color: Colors.black,
                    size: 30,
                  ),
                  Strings.prepaidOption),
              customDivider(),
              ListTileCustom(
                fontAwesomeIcon: Icons.credit_card_rounded,
                title: Strings.noCreditCard,
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const SignUpCardData()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Stack paymentMethodStack() {
    return Stack(
      children: [
        const Icon(
          Icons.arrow_right_rounded,
          color: CustomColor.primaryColor,
          size: 80,
        ),
        paymentMethodPositioned()
      ],
    );
  }

  Positioned paymentMethodPositioned() {
    return Positioned(bottom: 28, left: 60, child: textPaymentMethod());
  }

  Text textPaymentMethod() {
    return Text(
      Strings.paymentMethodSignUp,
      style: const TextStyle(
          color: CustomColor.linkColor,
          fontSize: 16,
          fontWeight: FontWeight.bold),
    );
  }

  Divider customDivider() {
    return const Divider(
      indent: 50,
      endIndent: 50,
      thickness: 1,
      color: Colors.grey,
    );
  }

  rowIconCard(BuildContext context, Widget icon, String title) {
    return Padding(
        padding:
            EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.13),
        child: Row(
          children: [
            icon, //TODO: icono provisorio
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 5),
              child: Text(
                title,
                style: const TextStyle(
                    color: CustomColor.primaryColor, fontSize: 16),
              ),
            )
          ],
        ));
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
                    Strings.chooseMethod,
                    style: const TextStyle(
                        color: CustomColor.primaryColor,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            )));
  }
}
