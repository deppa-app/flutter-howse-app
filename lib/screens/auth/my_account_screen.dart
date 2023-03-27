import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../utils/utils.dart';
import '../../widgets/widget.dart';
import '../screens.dart';

class MyAccountScreen extends StatelessWidget {
   
  const MyAccountScreen({Key key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    const name = 'Elon Rafael de la Trinidad';
    const lastName = 'Reeve Musk';
    const email = 'elon.musk@email.com';

    return  SafeArea(
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
              const SizedBox(height: Dimensions.heightSize),
              Column(
                children:   [
                  const _principalString(),
                  const SizedBox(height: Dimensions.heightSize * 4),
                  Container(
                    decoration: BoxDecoration(
                                  color: const Color.fromARGB(255, 240, 238, 238),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: MediaQuery.of(context).size.height * 0.4,
                    child:  const UserInfoSection(
                      name: name, 
                      lastName: lastName,
                      email: email, 
                      avatarUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/3/34/Elon_Musk_Royal_Society_%28crop2%29.jpg/1200px-Elon_Musk_Royal_Society_%28crop2%29.jpg'
                      ),
                  ),
                  const SizedBox(height: Dimensions.heightSize * 4),
                  iconConfig(icon: FontAwesomeIcons.key, text: 'Configurar PIN de HOWSE',
                    onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const BookingPin()));
                  }
                  ),
                  const SizedBox(height: Dimensions.heightSize * 4),
                   iconConfig(
                    icon: FontAwesomeIcons.userLock, 
                    text: 'Cambiar contraseña',
                    onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>  const ChangePasswordScreen()));
                  },

                  ),
                  const SizedBox(height: Dimensions.heightSize * 4),
                  iconConfig(
                    icon: FontAwesomeIcons.creditCard, text: 'Medios de Pago',
                    onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>   const SignUpScreen9()));
                  },
                  ),
                  const SizedBox(height: Dimensions.heightSize * 4),
                ],
              )
            ]
           ),
        ),
      ),
    );
  }
}




class UserInfoSection extends StatelessWidget {
  const UserInfoSection({
    Key key,
    @required this.name,
    @required this.email,
    @required this.avatarUrl, this.lastName,
  }) : super(key: key);

  final String name;
  final String lastName;
  final String email;
  final String avatarUrl;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: MediaQuery.of(context).size.height - (MediaQuery.of(context).size.height -25)),
        CircleAvatar(
          radius: 80,
          backgroundImage: NetworkImage(avatarUrl),
        ),
       SizedBox(height: MediaQuery.of(context).size.height - (MediaQuery.of(context).size.height -25)),
        Text(
          name,
          style:  TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: Dimensions.largeTextSize,
          ),
        ),
        Text(
          lastName,
          style:  TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: Dimensions.largeTextSize,
          ),
        ),
        SizedBox(height: MediaQuery.of(context).size.height - (MediaQuery.of(context).size.height -25)),
        Text(
          email,
          style:  TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: Dimensions.largeTextSize
          ),
          textAlign: TextAlign.center,
        ),
        
      ],
    );
  }
}

class _principalString extends StatelessWidget {
  const _principalString({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      Strings.myAccountEsp,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.black,
        fontSize: Dimensions.extraLargeTextSize * 1.5,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}


class iconConfig extends StatelessWidget {
   
  const iconConfig({Key key, this.icon, this.text, this.onTap}) : super(key: key);

  final IconData icon;
  final String text;
  final GestureTapCallback onTap;
  
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      child: Column(
        children: [
          Container(
            width: 125,
            height: 125,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: CustomColor.greenColor,
            ),
            child: Center(
              child: Icon(
                icon,
                color: CustomColor.whiteColor2,
                size: 70,
              ),
            ),
            alignment: Alignment.center
          ),
          const Padding(padding: EdgeInsets.only(top: 25)),
          Text(text,
          style:  TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: Dimensions.extraLargeTextSize ,
          ),
          )
        ],
      ),
      onTap: onTap,
    );
  }
}