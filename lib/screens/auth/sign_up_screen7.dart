import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:howse_app/models/profile.dart';

import 'package:howse_app/screens/auth/auth.dart';
import 'package:howse_app/services/profile.dart';
import 'package:howse_app/services/user.dart';
import 'package:howse_app/utils/utils.dart';
import 'package:howse_app/widgets/widget.dart';

enum AppState { male, female, none }

class SignUpScreen7 extends StatefulWidget {
  const SignUpScreen7(
      {Key key, this.address, this.email, this.password, this.phone})
      : super(key: key);
  final String address;
  final String email;
  final String password;
  final String phone;

  @override
  _SignUpScreen7State createState() => _SignUpScreen7State();
}

class _SignUpScreen7State extends State<SignUpScreen7> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  var _appState = AppState.none;
  bool _toggleVisibility = false;
  String gender;
  TextEditingController firstNameController = TextEditingController();
  // TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController runController = TextEditingController();
  TextEditingController bornController = TextEditingController();
  TextEditingController runEmitController = TextEditingController();
  TextEditingController runExpirationController = TextEditingController();
  //TextEditingController confirmPasswordController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Container(
          width: width,
          height: height,
          color: Colors.white,
          child: ListView(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            children: [
              const BackWidget(
                title: '',
                percent: 0.7,
              ),
              SizedBox(height: height * 0.05),
              inputFieldWidget(context),
              SizedBox(height: height * 0.03),
              buttonPadding(width, context),
              const SizedBox(
                height: Dimensions.heightSize * 2,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Padding buttonPadding(double width, BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: width * 0.08,
        right: width * 0.08,
      ),
      child: nextButton(context),
    );
  }

  SecondaryButtonWidget nextButton(BuildContext context) {
    return SecondaryButtonWidget(
      title: Strings.nextSignUp,
      onTap: () {
        if (formKey.currentState.validate()) {
          Map profile = {
            'data': {
              'name': firstNameController.text.trim(),
              'email': widget.email.trim(),
              'birthday': dateFunction(bornController.text.trim()),
              'address': widget.address.trim(),
              'numberPhone': phoneController.text.trim(),
              'rut': runController.text.trim(),
              'expirationDate':
                  dateFunction(runExpirationController.text.trim()),
              'emisionDate': dateFunction(runEmitController.text.trim()),
              // 'pin': 111, //TODO: cambiar
              //'lastName': firstNameController.text, //TODO: cambiar
              //'identificationNumber': phoneController.text, //TODO: cambiar
              //'gender': "Hombre", //TODO: cambiar
              //'numberPhoneValidation': widget.phone, //TODO: cambiar
              //'identificationNumberValidation': 11211, //TODO: cambiar
              //'emailValidation': true, //TODO: cambiar
              //'paymentValidation': true, //TODO: cambiar
              //'avatar': firstNameController.text, //TODO: cambiar
            }
          };
          Future<ValidateProfile> newProfile = saveProfile(jsonEncode(profile));
          newProfile.then(
            (data) {
              Map user = {
                'data': {
                  'username': firstNameController.text,
                  'password': widget.password,
                  'publicToken': widget.password, //TODO: cambiar
                  'rut': runController.text,
                  'profile': {'id': data.id}
                }
              };
              saveUser(jsonEncode(user));
            },
          );
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const SignUpScreen8()));
        }
      },
    );
  }

  inputFieldWidget(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(
          left: Dimensions.marginSize,
          right: Dimensions.marginSize,
        ),
        child: SingleChildScrollView(
          child: Form(
              key: formKey,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: Dimensions.marginSize,
                          right: Dimensions.marginSize),
                      child: Column(children: [
                        Text(
                          Strings.checkData,
                          style: const TextStyle(
                              color: CustomColor.colorBlack,
                              fontSize: 26,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                        Row(
                          children: [
                            //TODO: Cambiar CircleButtonWidget por elemento seleccionable
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.12),
                            Padding(
                              padding: EdgeInsets.only(
                                  left:
                                      MediaQuery.of(context).size.width * 0.18,
                                  right:
                                      MediaQuery.of(context).size.width * 0.06),
                              child: Column(children: [
                                _appState == AppState.male
                                    ? circleButtonGreen('male')
                                    : circleButtonGrey('male'),
                                Text(Strings.man)
                              ]),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: MediaQuery.of(context).size.width * 0.1,
                                  right:
                                      MediaQuery.of(context).size.width * 0.06),
                              child: Column(
                                children: [
                                  _appState == AppState.female
                                      ? circleButtonGreen('female')
                                      : circleButtonGrey('female'),
                                  Text(Strings.woman)
                                ],
                              ),
                            ),
                          ],
                        ),
                      ]),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.08,
                        right: MediaQuery.of(context).size.width * 0.08,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _titleData(Strings.rut),
                          TextFormFieldRut(
                            text: Strings.demoRut,
                            controller: runController,
                          ),

                          //TODO: Crear text_form_field para nombre?
                          _titleData(Strings.firstNameEs),
                          CustomTextFormField(
                            text: Strings.firstNameEs,
                            controller: firstNameController,
                          ),

                          _titleData(Strings.phoneNumberEs),
                          TextFormFieldNumber(
                            text: Strings.demoPhoneNumber,
                            controller: phoneController,
                          ),

                          _titleData(Strings.dateBirth),
                          TextFormFieldDate(
                            text: Strings.formDate,
                            controller: bornController, // cambiar controller
                            suffixIcon: IconButton(
                                onPressed: () {},
                                icon: const FaIcon(
                                    FontAwesomeIcons.solidCalendarDays,
                                    color: CustomColor.secondBlack)),
                          ),

                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.03,
                          ),

                          Padding(
                            padding: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width * 0.15),
                            child: Text(
                              Strings.idSignUp,
                              style: const TextStyle(
                                  fontSize: 16,
                                  color: CustomColor.colorBlack,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          _titleData(Strings.emitDate),
                          TextFormFieldDate(
                            text: Strings.formDate,
                            controller: runEmitController,
                            suffixIcon: IconButton(
                                onPressed: () {},
                                icon: const FaIcon(
                                    FontAwesomeIcons.solidCalendarDays,
                                    color: CustomColor.secondBlack)),
                          ),

                          _titleData(Strings.expirationDateSignUp),
                          TextFormFieldDate(
                            text: Strings.formDate,
                            controller: runExpirationController,
                            suffixIcon: IconButton(
                                onPressed: () {},
                                icon: const FaIcon(
                                    FontAwesomeIcons.solidCalendarDays,
                                    color: CustomColor.secondBlack)),
                          ),
                        ],
                      ),
                    ),
                  ])),
        ));
  }

  CircleButtonWidget circleButtonGreen(String value) {
    return CircleButtonWidget(
      icon: const FaIcon(
        FontAwesomeIcons.solidCircleUser,
        size: 50,
        color: CustomColor.greenColor,
      ),
      onTap: () {
        gender = value;
        setState(() {});
      },
    );
  }

  CircleButtonWidget circleButtonGrey(String value) {
    return CircleButtonWidget(
      icon: const FaIcon(FontAwesomeIcons.solidCircleUser,
          size: 50, color: Color.fromARGB(255, 154, 154, 154)),
      onTap: () {
        if (_appState != AppState.male && value == 'male') {
          _appState = AppState.male;
        } else if (_appState != AppState.female && value == 'female') {
          _appState = AppState.female;
        }
        gender = value;
        setState(() {});
      },
    );
  }

  _titleData(String title) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: Dimensions.heightSize * 0.1,
        top: Dimensions.heightSize,
      ),
      child: Text(
        title,
        style: const TextStyle(color: Colors.black),
      ),
    );
  }

  String dateFunction(String date) {
    String day = date[0] + date[1];
    String month = date[3] + date[4];
    String year = date[6] + date[7] + date[8] + date[9];
    return year + '-' + month + '-' + day;
  }
}
