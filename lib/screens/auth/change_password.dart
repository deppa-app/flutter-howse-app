import 'package:flutter/material.dart';

import '../../utils/utils.dart';
import '../../widgets/widget.dart';

class ChangePasswordScreen extends StatelessWidget {
   
  const ChangePasswordScreen({Key ?key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:  Scaffold(
        body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Colors.white,
            child: ListView(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              children: [
              BackButtonGeneralWidget(),
              const SizedBox(height: Dimensions.heightSize),
              Column(
                children: [
                   _PrincipalString(),
                  const SizedBox(height: Dimensions.heightSize * 1.5),
                   _SecondaryString(),
                  const SizedBox(height: 38),
                  _PasswordTextField(hint: Strings.currentPasswordEsp,),
                  const SizedBox(height: 38),
                  _PasswordTextField(hint: Strings.newPasswordEsp,),
                  const SizedBox(height: 38),
                  _PasswordTextField(hint: Strings.confirmPasswordEsp,),
                  const SizedBox(height: 290),
                  SizedBox(child: SecondaryButtonWidget(title: Strings.updateEsp), width: 375,)
                ],
              )
              ],
            ),
        ),
      ),
    );
  }
}

class _PasswordTextField extends StatelessWidget {
  final String ?hint;
  const _PasswordTextField({
    Key ?key, this.hint,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 296,
      child: TextField(
        obscureText: true,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(top: 15, bottom: 14, left: 17),
          labelStyle: TextStyle(fontSize: Dimensions.defaultTextSize, fontWeight: FontWeight.normal),
          border:  const OutlineInputBorder(
            borderSide: BorderSide(
              color: CustomColor.greyColor
            )
          ),
          labelText: hint
        ),
        ),
    );
  }
}

class _SecondaryString extends StatelessWidget {
  const _SecondaryString({
    Key ?key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text('Para cambiar tu contraseña debes\n ingresar primero tu contraseña actual y\n luego tu nuevo contraseña.', 
    style: TextStyle(
      height: 2,
      fontSize: Dimensions.defaultTextSize), 
      textAlign: TextAlign.center,
      );
  }
}

class _PrincipalString extends StatelessWidget {
  const _PrincipalString({
    Key ?key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      Strings.changePasswordEsp,
      style: TextStyle(fontSize:Dimensions.extraLargeTextSize * 1.5, fontWeight: FontWeight.w600 ),
      );
  }
}