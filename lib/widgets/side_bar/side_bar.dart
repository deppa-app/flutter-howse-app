import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:deppa_app/screens/dashboard/billing/billing.dart';

import '../../screens/screens.dart';
import '../../utils/utils.dart';
import '../widget.dart';

class SideBar extends StatelessWidget {
  const SideBar({
    Key ?key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.7,
      decoration: BoxDecoration(
          border: Border.all(color: CustomColor.greyColor, width: 2),
          color: CustomColor.greyColor2,
          borderRadius: const BorderRadius.only(
              topRight: Radius.circular(25), bottomRight: Radius.circular(25))),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
            topRight: Radius.circular(25), bottomRight: Radius.circular(25)),
        child: Drawer(
          child: Container(
            decoration: const BoxDecoration(color: CustomColor.greyColor2),
            child: ListView(
              children: <Widget>[
                const SizedBox(
                  height: 25,
                  /* child: DrawerHeader(
                    child: DrawerHeaderWidget(),
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                    ),
                  ), */
                ),
                ListDataFontawesomeWidget(
                  icon: FontAwesomeIcons.userPen,
                  title: Strings.myAccountEsp,
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const MyAccountScreen()));
                  },
                ),
                ListDataFontawesomeWidget(
                  icon: FontAwesomeIcons.houseChimneyUser,
                  title: Strings.visitsEsp,
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const MyVisitsHistory()));
                  },
                ),
                ListDataFontawesomeWidget(
                  icon: FontAwesomeIcons.fileInvoiceDollar,
                  title: Strings.billingEsp,
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const Billing()));
                  },
                ),
                ListDataFontawesomeWidget(
                  icon: FontAwesomeIcons.phoneFlip,
                  title: Strings.callCenter,
                  onTap: () {
                    /*Navigator.of(context).pop();
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
                        MessagingScreen()));*/
                  },
                ),
                ListDataFontawesomeWidget(
                  icon: FontAwesomeIcons.peopleRobbery,
                  title: Strings.functionalAdult,
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const FunctionalAdultScreen()));
                  },
                ),
                ListDataFontawesomeWidget(
                  icon: FontAwesomeIcons.houseCircleCheck,
                  title: Strings.hired,
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const Rental_History()));
                  },
                ),
                ListDataFontawesomeWidget(
                  icon: FontAwesomeIcons.rightFromBracket,
                  title: Strings.signOut,
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const SignInScreen()));
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
