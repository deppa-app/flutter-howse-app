import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:howse_app/utils/dimensions.dart';

import '../../../utils/custom_color.dart';

class Carousel extends StatelessWidget {
  const Carousel({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        width: Dimensions.wide_carousel,
        height: Dimensions.height_carousel,
        color: CustomColor.whiteColor,
        child: Swiper(
          itemBuilder: (BuildContext context, int index) {
            return Image.asset(
              "assets/images/hegga_logo_1a.png",
              fit: BoxFit.fill,
            );
          },
          itemCount: 6,
          viewportFraction: 0.8,
          scale: 0.9,
        ),
      ),
    );
  }
}
