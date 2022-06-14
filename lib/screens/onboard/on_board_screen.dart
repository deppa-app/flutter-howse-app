
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:howse_app/screens/auth/sign_in_screen.dart';
import 'package:howse_app/utils/custom_color.dart';
import 'package:howse_app/utils/dimensions.dart';
import 'package:howse_app/utils/strings.dart';
import '../auth/pass_sign_up_screen.dart';
import 'data.dart';
import 'package:howse_app/widgets/primary_button_widget.dart';
import 'package:howse_app/widgets/secondary_button_widget.dart';

class OnBoardScreen extends StatefulWidget {
  const OnBoardScreen({Key key}) : super(key: key);

  @override
  _OnBoardScreenState createState() => _OnBoardScreenState();
}

class _OnBoardScreenState extends State<OnBoardScreen> {
  int totalPages = OnBoardingItems.loadOnboardItem().length;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return  SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: height * 0.03,),
              SizedBox(
              width: double.infinity,
              height: 600,
              child: Swiper(
                itemCount: totalPages,
                layout: SwiperLayout.DEFAULT,
                itemWidth: width,
                itemBuilder: (_, int index){
                  return PageView.builder(
                itemCount: totalPages,
                itemBuilder: (context, index) {
                  OnBoardingItem oi = OnBoardingItems.loadOnboardItem()[index];
                  return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            left: Dimensions.marginSize * 1.5,
                            right: Dimensions.marginSize * 1.5,
                          ),
                          child:  Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width,
                                padding: const EdgeInsets.only(
                                    left: Dimensions.marginSize,
                                    right: Dimensions.marginSize),
                                child: Text(
                                  oi.title,
                                  style: TextStyle(
                                      color: CustomColor.primaryColor,
                                      fontSize:
                                          Dimensions.extraLargeTextSize *
                                              1.5,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.justify,
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
                                  oi.subTitle,
                                  style: TextStyle(
                                    color: CustomColor.primaryColor,
                                    fontSize: Dimensions.largeTextSize,
                                  ),
                                  textAlign: TextAlign.justify,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 40.00,
                                  left: Dimensions.marginSize,
                                  right: Dimensions.marginSize,
                                ),
                                child: Align(
                                  alignment: Alignment.topCenter,
                                  child: Image.asset(
                                    'assets/images/lorem-image.png',
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width,
                                child: Align(
                                  alignment: Alignment.center,
                                  child: index != (totalPages)
                                      ? Padding(
                                          padding:
                                              const EdgeInsets.only(left: 40.0),
                                          child: SizedBox(
                                            width: 110.0,
                                            height: 40.0,
                                            child: ListView.builder(
                                              itemCount: totalPages,
                                              shrinkWrap: true,
                                              scrollDirection: Axis.horizontal,
                                              itemBuilder: (context, i) {
                                                return Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 10.0),
                                                  child: Text(
                                                    ("o").toString(),
                                                    style: TextStyle(
                                                        color: index == i
                                                            ? CustomColor
                                                                .primaryColor
                                                            : CustomColor
                                                                .primaryColor
                                                                .withOpacity(
                                                                    0.5),
                                                        fontSize: 18.00,
                                                        fontWeight: index == i
                                                            ? FontWeight.bold
                                                            : FontWeight
                                                                .normal),
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                        )
                                      : paddingButtons(context)
                                ),
                              ),
                            ],
                          )),
                          
                      ],
                    );
                });
                },
              ),
            ),

            paddingButtons(context),

            SizedBox(height: height * 0.03),
            
                  
            
            Text(Strings.haveAccount, style: const TextStyle(fontSize: 14, color: CustomColor.primaryColor)),
            
            SizedBox(height: height * 0.04),

            ]
            
          ),
        )
      ) 
    );
  }

  paddingButtons(BuildContext context) {
    return Padding(
            padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * 0.08,
              right: MediaQuery.of(context).size.width * 0.08
            ),
            child: Column(
              children: [
                SecondaryButtonWidget(
                  title: Strings.createAnAccount,
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) =>
                                const PassSignUpScreen()));
                  },
                ),
          
                const SizedBox(
                  height: Dimensions.heightSize,
                ),
          
                PrimaryButtonWidget(
                  title: Strings.signInAccount,
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) =>
                                const SignInScreen()));
                  },
                ),
          
                
              ],
              
            ),
          );
  }
}

