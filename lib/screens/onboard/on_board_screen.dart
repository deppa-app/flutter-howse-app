import 'package:flutter/material.dart';
import 'package:howse_app/screens/auth/sign_in_screen.dart';
//import 'package:howse_app/screens/auth/sign_up_screen.dart';
import 'package:howse_app/utils/dimensions.dart';
import 'package:howse_app/utils/strings.dart';
import 'data.dart';
import 'package:howse_app/widgets/primary_button_widget.dart';
import 'package:howse_app/widgets/secondary_button_widget.dart';

class OnBoardScreen extends StatefulWidget {
  @override
  _OnBoardScreenState createState() => _OnBoardScreenState();
}

class _OnBoardScreenState extends State<OnBoardScreen> {
  int totalPages = OnBoardingItems.loadOnboardItem().length;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: PageView.builder(
          itemCount: totalPages,
            itemBuilder: (context, index){
            OnBoardingItem oi = OnBoardingItems.loadOnboardItem()[index];
              return Container(
                width: width,
                height: height,
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        top: Dimensions.topHeight,
                        left: Dimensions.marginSize,
                        right: Dimensions.marginSize,
                      ),
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: Image.asset(
                          'assets/images/hegga_logo_1a.png',
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: -10,
                      left: -10,
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: Dimensions.marginSize * 1.5,
                          right: Dimensions.marginSize * 1.5,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: Dimensions.marginSize,
                                      right: Dimensions.marginSize),
                                  child: Text(
                                    oi.title,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: Dimensions.extraLargeTextSize * 1.5,
                                        fontWeight: FontWeight.bold
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                SizedBox(height: Dimensions.heightSize * 2,),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: Dimensions.marginSize,
                                      right: Dimensions.marginSize),
                                  child: Text(
                                    oi.subTitle,
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: Dimensions.largeTextSize,
                                      fontWeight: FontWeight.bold
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: Dimensions.heightSize * 4),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              child: Align(
                                alignment: Alignment.center,
                                child: index != (totalPages - 1) ? Padding(
                                  padding: const EdgeInsets.only(left: 40.0),
                                  child: Container(
                                    width: 110.0,
                                    height: 40.0,
                                    child: ListView.builder(
                                      itemCount: totalPages,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, i){
                                        return Padding(
                                          padding: const EdgeInsets.only(right: 10.0),
                                          child: Text(
                                              (i + 1).toString(),
                                            style: TextStyle(
                                              color: index == i ? Colors.black :
                                              Colors.black.withOpacity(0.5),
                                              fontSize: Dimensions.largeTextSize,
                                              fontWeight: index == i ? FontWeight.bold : FontWeight.normal
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                )
                                    : Column(
                                      children: [
                                        SecondaryButtonWidget(
                                          title: Strings.createAnAccount,
                                          onTap: () {
                                            //Navigator.of(context).push(MaterialPageRoute(builder:
                                           // (context) => SignUpScreen()));
                                          },
                                        ),
                                        SizedBox(height: Dimensions.heightSize,),
                                        PrimaryButtonWidget(
                                          title: Strings.signInAccount,
                                          onTap: () {
                                            Navigator.of(context).push(MaterialPageRoute(builder:
                                                (context) => SignInScreen()));
                                          },
                                        )
                                      ],
                                    ),
                              ),
                            ),
                            index != (totalPages - 1) ? Padding(
                              padding: const EdgeInsets.only(
                                left: Dimensions.marginSize,
                                right: Dimensions.marginSize,
                              ),
                              child:  Column(
                                      children: [
                                        SecondaryButtonWidget(
                                          title: Strings.createAnAccount,
                                          onTap: () {
                                            //Navigator.of(context).push(MaterialPageRoute(builder:
                                           // (context) => SignUpScreen()));
                                          },
                                        ),
                                        SizedBox(height: Dimensions.heightSize,),
                                        PrimaryButtonWidget(
                                          title: Strings.signInAccount,
                                          onTap: () {
                                            Navigator.of(context).push(MaterialPageRoute(builder:
                                                (context) => SignInScreen()));
                                          },
                                        )
                                      ],
                                    ),
                            ) : Container(),
                            SizedBox(height: Dimensions.heightSize),
                          ],
                        ),
                      ),
                    )
                  ],
                )
              );
            }),
      ),
    );
  }
}
