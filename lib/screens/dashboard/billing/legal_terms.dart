import 'package:flutter/material.dart';

import '../../../utils/custom_color.dart';
import '../../../utils/dimensions.dart';

class Legalterms extends StatelessWidget {
  const Legalterms({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: CustomColor.whiteColor,
          child: Scrollbar(
            child: ListView(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              children: [
                AppBar(
                  iconTheme: const IconThemeData(color: CustomColor.greenColor),
                  backgroundColor: CustomColor.whiteColor,
                  elevation: 0,
                ),
                const SizedBox(
                  height: Dimensions.heightSize * 2,
                ),
                Center(
                  child: Text(
                    "Terminos legales",
                    style: TextStyle(
                        color: CustomColor.greenColor,
                        fontSize: Dimensions.semilarge,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                const SizedBox(
                  height: Dimensions.heightSize * 2,
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.08,
                      right: MediaQuery.of(context).size.width * 0.08),
                  child: const Center(
                    child: Text(
                      "detalles de terminos legales 1 Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
                      style: TextStyle(
                          color: CustomColor.colorBlack,
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                const SizedBox(
                  height: Dimensions.heightSize * 2,
                ),
                const Center(
                  child: Image(
                    image: AssetImage('assets/images/seguridad.png'),
                    width: 352,
                    height: 284,
                  ),
                ),
                const SizedBox(
                  height: Dimensions.heightSize * 2,
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.08,
                      right: MediaQuery.of(context).size.width * 0.08),
                  child: const Center(
                    child: Text(
                      "detalles de terminos legales 2 Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat",
                      style: TextStyle(
                          color: CustomColor.colorBlack,
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                const SizedBox(
                  height: Dimensions.heightSize * 2,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
