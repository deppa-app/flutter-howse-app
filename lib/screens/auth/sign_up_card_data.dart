import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:deppa_app/screens/auth/index.dart';
import 'package:deppa_app/utils/utils.dart';
import 'package:deppa_app/widgets/widget.dart';

class SignUpCardData extends StatefulWidget {
  const SignUpCardData({Key ?key}) : super(key: key);

  @override
  _SignUpCardDataState createState() => _SignUpCardDataState();
}

class _SignUpCardDataState extends State<SignUpCardData> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController numberCardController = TextEditingController();
  TextEditingController dateCardController = TextEditingController();
  TextEditingController securityCardController = TextEditingController();

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
              const BackWidget(title: '', percent: 100.0),
              const SizedBox(
                height: Dimensions.heightSize * 2,
              ),
              inputFieldWidget(context),
              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
              validateCardPadding(context),
              buttonPadding(context),
              const SizedBox(
                height: Dimensions.heightSize * 2,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Padding buttonPadding(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * 0.08,
          left: MediaQuery.of(context).size.width * 0.08,
          right: MediaQuery.of(context).size.width * 0.08),
      child: saveButton(context),
    );
  }

  SecondaryButtonWidget saveButton(BuildContext context) {
    return SecondaryButtonWidget(
      title: "Guardar",
      onTap: () {
        if (formKey.currentState!.validate()) {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const SignUpCongratulation()));
        }
      },
    );
  }

  Padding validateCardPadding(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.07),
      child: textValidateCard(),
    );
  }

  Text textValidateCard() {
    return Text(
      Strings.validateCard,
      style: TextStyle(
          color: Colors.grey,
          fontSize: Dimensions.largeTextSize * 0.8,
          fontWeight: FontWeight.bold),
      textAlign: TextAlign.start,
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
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: Dimensions.marginSize,
                      right: Dimensions.marginSize),
                  child: Text(
                    Strings.paymentMethodSignUp,
                    style: TextStyle(
                        color: CustomColor.primaryColor,
                        fontSize: Dimensions.extraLargeTextSize * 1.5,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
                
                Padding(
                  padding: const EdgeInsets.only(
                      top: Dimensions.heightSize,
                      right: Dimensions.marginSize * 6),
                  child: Text(
                    Strings.enrollingCard,
                    style: const TextStyle(
                        color: CustomColor.primaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                // const SizedBox(height: 0,),

                FaIcon(
                  FontAwesomeIcons.ccVisa,
                  size: 200,
                  color: Colors.grey[200],
                ),

                const Divider(
                  color: Colors.grey,
                  indent: 30,
                  endIndent: 30,
                  thickness: 2,
                ),

                Padding(
                  padding: const EdgeInsets.only(right: 200),
                  child: _hintData(Strings.titleNumberCard),
                ),
                const _titleLabel(label: 'Número de tarjeta', paddingRight: 280,),
                TextFormFieldCard(
                    controller: numberCardController, text: Strings.numberCard),

                Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          _hintData(Strings.expiryDate),
                          const _titleLabel(label: 'Fecha de vencimiento', paddingRight: 60,),

                          TextFormFieldExpirationDate(
                            text: Strings.monthYear,
                            controller: dateCardController,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          _hintData(Strings.cvv),
                          const _titleLabel(label: 'CVV', paddingRight: 150,),
                          TextFormFieldCvv(
                            text: '123',
                            controller: securityCardController,
                          ),
                        ],
                      ),
                    ),
                    
                  ],
                ),

                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),

                Stack(
                  children: [
                    Container(
                      height: 80,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            color: CustomColor.primaryColor,
                          )),
                    ),
                    Positioned(
                      top: 5,
                      left: 5,
                      width: 800,
                      child: Text(
                        Strings.confirmEmailCard,
                        textAlign: TextAlign.start,
                        style: const TextStyle(
                            color: CustomColor.greyColor, height: 1),
                      ),
                    ),
                    Positioned(
                      top: 30,
                      left: 20,
                      child: Row(
                        children: [
                          Checkbox(
                            value: false,
                            onChanged: (newValue) {},
                          ),
                          Text(
                            Strings.myEmail,
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 12.00,
                            ),
                            textAlign: TextAlign.start,
                          ),
                          const SizedBox(
                            width: 40,
                          ),
                          GestureDetector(
                            child: Text(
                              Strings.paymentMethodSignUp,
                              style: const TextStyle(
                                  color: CustomColor.brownColor2,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            )));
  }

  _hintData(String title) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: Dimensions.heightSize * 0.1,
        top: Dimensions.heightSize,
      ),
      child: Text(
        title,
        style: const TextStyle(color: CustomColor.primaryColor),
      ),
    );
  }
}

class _titleLabel extends StatelessWidget {
  final String label;
  final double paddingRight;
  const _titleLabel({
    Key ?key, required this.label, required this.paddingRight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(right: paddingRight, bottom: 2),
      child: Text(
        label,
        style: TextStyle(fontSize: Dimensions.defaultTextSize),
        )
      );
  }
}
