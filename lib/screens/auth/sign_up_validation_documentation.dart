import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:deppa_app/screens/auth/auth.dart';
import 'package:deppa_app/utils/utils.dart';
import 'package:deppa_app/widgets/widget.dart';
import 'package:image_picker/image_picker.dart';

import '../../presentation/pages/demo_page.dart';

class SignUpValidationDocumentation extends StatefulWidget {
  const SignUpValidationDocumentation(
      {Key ?key, /*this.address, this.email, this.password, this.phone*/})
      : super(key: key);
  /*final String ?address;
  final String ?email;
  final String ?password;
  final String ?phone;*/

  @override
  _SignUpValidationDocumentationState createState() => _SignUpValidationDocumentationState();
}

class _SignUpValidationDocumentationState extends State<SignUpValidationDocumentation> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  File ?photo;

  Future pickImage() async {
    try {
      final photo = await ImagePicker().pickImage(source: ImageSource.camera);

      if (photo == null) return;

      final imageTemp = File(photo.path);

      setState(() => this.photo = imageTemp);
    } on PlatformException catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        floatingActionButton: Padding(
          padding: EdgeInsets.only(right: width * 0.38, bottom: 220),
          child: FloatingActionButton(
            backgroundColor: Colors.brown,
            child: const FaIcon(FontAwesomeIcons.camera, color: CustomColor.whiteColor,),
            //onPressed: () => pickImage(),
            onPressed: () {
                Navigator.of(context).push(
                MaterialPageRoute(
                builder: (context) =>
                const DemoPage()));
            },
          ),
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Colors.white,
          child: ListView(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            children: [
              const BackWidget(title: '', percent: 0.4),
              const SizedBox(
                height: Dimensions.heightSize * 2,
              ),
              inputFieldWidget(context),
              SizedBox(height: height * 0.02),
              iconRow(width),
              photo == null
                  ? Align(
                      alignment: Alignment.topCenter,
                      child: Image.asset(
                        'assets/images/lorem-image.png',
                        fit: BoxFit.fill,
                        height: height * 0.35,
                        width: width * 0.7,
                      ),
                    )
                  : SizedBox(
                      height: height * 0.35,
                      width: width * 0.7,
                      child: Image.file(photo!)),
              const SizedBox(
                height: Dimensions.heightSize * 9,
              ),
              validateButtonPadding(width, context),
              const SizedBox(
                height: Dimensions.heightSize * 2,
              ),
              _omitir(),
              const SizedBox(
                height: Dimensions.heightSize * 2,
              ),
              textPhotoInstructions(),
            ],
          ),
        ),
      ),
    );
  }

  Row iconRow(double width) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        iconPadding(width),
        SizedBox(width: width * 0.03),
        textFrontPhoto(),
      ],
    );
  }

  Padding iconPadding(double width) {
    return Padding(
        padding: EdgeInsets.only(left: width * 0.08),
        child: const FaIcon(
          FontAwesomeIcons.solidCircleUser,
          size: 30,
          color: CustomColor.greenColor,
        ) //const Icon(Icons.person_outline_rounded, size: 50, ),
        );
  }

  Text textFrontPhoto() {
    return Text(
      Strings.frontPhoto,
      style: TextStyle(
          color: Colors.black,
          fontSize: Dimensions.largeTextSize,
          ),
      textAlign: TextAlign.start,
    );
  }

  Text textPhotoInstructions() {
    return Text(
      Strings.photoInstructions,
      style: TextStyle(
          color: CustomColor.colorBlack,
          fontSize: Dimensions.largeTextSize,
          ),
      textAlign: TextAlign.center,
    );
  }

  Padding validateButtonPadding(double width, BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: width * 0.08,
        right: width * 0.08,
      ),
      child: validateButton(context),
    );
  }

  GestureDetector _omitir() {
    return GestureDetector(
        child: GestureDetector(
      child: Text(
        Strings.omitirValidation,
        style: const TextStyle(
            color: CustomColor.brownColor2,
            decoration: TextDecoration.underline),
        textAlign: TextAlign.center,
      ),
      // onTap: (value){},
    ));
  }

  SecondaryButtonWidget validateButton(BuildContext context) {
    return SecondaryButtonWidget(
      title: Strings.validateSignUp,
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => SignUpScreen5(
                  /*address: widget.address!,
                  email: widget.email!,
                  password: widget.password!,
                  phone: widget.phone!,*/
                )));
      },
    );
  }

  inputFieldWidget(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Padding(
        padding: EdgeInsets.only(
          left: width * 0.02,
          right: width * 0.02,
        ),
        child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      EdgeInsets.only(left: width * 0.2, right: width * 0.2),
                  child: Text(
                    Strings.documentsVerification,
                    style: const TextStyle(
                        color: CustomColor.colorBlack,
                        fontSize: 26,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  height: Dimensions.heightSize * 2,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: Dimensions.marginSize,
                      right: Dimensions.marginSize),
                  child: Text(
                    Strings.thisProcess,
                    style: const TextStyle(
                      color: CustomColor.colorBlack,
                      fontSize: 15,
                    ),
                    textAlign: TextAlign.center,
                    textHeightBehavior: const TextHeightBehavior(leadingDistribution: TextLeadingDistribution.even),
                    
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: height * 0.016,
                      left: Dimensions.marginSize,
                      right: Dimensions.marginSize),
                  child: Text(
                    Strings.uploadId,
                    style: TextStyle(
                        color: CustomColor.colorBlack,
                        fontSize: Dimensions.extraSmallTextSize * 1.8,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.start,
                  ),
                ),
              ],
            )));
  }
}
