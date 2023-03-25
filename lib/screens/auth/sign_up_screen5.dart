import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:deppa_app/screens/auth/auth.dart';

import 'package:deppa_app/utils/utils.dart';
import 'package:deppa_app/widgets/widget.dart';
import 'package:image_picker/image_picker.dart';

class SignUpScreen5 extends StatefulWidget {
  const SignUpScreen5(
      {Key ?key, this.address, this.email, this.password, this.phone})
      : super(key: key);
  final String ?address;
  final String ?email;
  final String ?password;
  final String ?phone;

  @override
  _SignUpScreen5State createState() => _SignUpScreen5State();
}

class _SignUpScreen5State extends State<SignUpScreen5> {
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
          padding: EdgeInsets.only(right: width * 0.37, bottom: 150),
          child: FloatingActionButton(
            backgroundColor: Colors.deepPurpleAccent,
            child: const FaIcon(FontAwesomeIcons.camera),
            onPressed: () => pickImage(),
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
              BackWidget(
                title: '',
                percent: 0.5,
              ),
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
                height: Dimensions.heightSize * 4,
              ),
              validateButtonPadding(width, context),
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
        textReversePhoto(),
      ],
    );
  }

  Padding iconPadding(double width) {
    return Padding(
        padding: EdgeInsets.only(left: width * 0.08),
        child: const FaIcon(FontAwesomeIcons.solidCircleUser,
            size: 30, color: CustomColor.greenColor));
  }

  Text textReversePhoto() {
    return Text(
      Strings.reversePhoto,
      style: TextStyle(
          color: Colors.grey,
          fontSize: Dimensions.largeTextSize,
          fontWeight: FontWeight.bold),
      textAlign: TextAlign.start,
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

  SecondaryButtonWidget validateButton(BuildContext context) {
    return SecondaryButtonWidget(
      title: Strings.validateSignUp,
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => SignUpScreen6(
                  address: widget.address!,
                  email: widget.email!,
                  password: widget.password!,
                  phone: widget.phone!,
                )));
      },
    );
  }

  Text textPhotoInstructions() {
    return Text(
      Strings.photoInstructions,
      style: TextStyle(
          color: Colors.grey,
          fontSize: Dimensions.largeTextSize,
          fontWeight: FontWeight.bold),
      textAlign: TextAlign.center,
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
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.start,
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
