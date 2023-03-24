import 'package:flutter/material.dart';

import '../../../utils/custom_color.dart';
import '../../../utils/dimensions.dart';
import '../../../utils/strings.dart';

class DetailedServicePrice extends StatefulWidget {
  const DetailedServicePrice({Key key}) : super(key: key);

  @override
  State<DetailedServicePrice> createState() => _DetailedServicePriceState();
}

class _DetailedServicePriceState extends State<DetailedServicePrice> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Descripción",
              style: TextStyle(
                  color: CustomColor.colorBlack,
                  fontSize: Dimensions.radius,
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: Dimensions.heightSize * 0.5,
            ),
            Text(
              Strings.detail_value_visit,
              style: const TextStyle(
                  color: CustomColor.colorBlack,
                  fontSize: Dimensions.radius,
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: Dimensions.heightSize * 0.5,
            ),
            Text(
              Strings.additional_time_detail,
              style: const TextStyle(
                  color: CustomColor.colorBlack,
                  fontSize: Dimensions.radius,
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: Dimensions.heightSize * 0.5,
            ),
            Text(
              Strings.plumbing_service_detail,
              style: const TextStyle(
                  color: CustomColor.colorBlack,
                  fontSize: Dimensions.radius,
                  fontWeight: FontWeight.w600),
            ),
            Text(
              Strings.toilet_service_detail,
              style: const TextStyle(
                  color: CustomColor.colorBlack,
                  fontSize: Dimensions.radius,
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: Dimensions.heightSize * 1.5,
            ),
            const Text(
              "Subtotal",
              style: TextStyle(
                  color: CustomColor.colorBlack,
                  fontSize: Dimensions.radius,
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: Dimensions.heightSize * 0.5,
            ),
            const Text(
              "Descuento",
              style: TextStyle(
                  color: CustomColor.colorBlack,
                  fontSize: Dimensions.radius,
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: Dimensions.heightSize * 0.5,
            ),
            const Text(
              "Total",
              style: TextStyle(
                  color: CustomColor.colorBlack,
                  fontSize: Dimensions.radius,
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: Dimensions.heightSize * 0.5,
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Monto",
              style: TextStyle(
                  color: CustomColor.colorBlack,
                  fontSize: Dimensions.radius,
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: Dimensions.heightSize * 0.5,
            ),
            Text(
              Strings.price_value_visit,
              style: const TextStyle(
                  color: CustomColor.colorBlack,
                  fontSize: Dimensions.radius,
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: Dimensions.heightSize * 0.5,
            ),
            Text(
              Strings.additional_time_price,
              style: const TextStyle(
                  color: CustomColor.colorBlack,
                  fontSize: Dimensions.radius,
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: Dimensions.heightSize * 0.5,
            ),
            Text(
              Strings.plumbing_service_price,
              style: const TextStyle(
                  color: CustomColor.colorBlack,
                  fontSize: Dimensions.radius,
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: Dimensions.heightSize * 0.5,
            ),
            Text(
              Strings.toilet_service_price,
              style: const TextStyle(
                  color: CustomColor.colorBlack,
                  fontSize: Dimensions.radius,
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: Dimensions.heightSize * 1.5,
            ),
            Text(
              Strings.Subtotal,
              style: const TextStyle(
                  color: CustomColor.colorBlack,
                  fontSize: Dimensions.radius,
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: Dimensions.heightSize * 0.5,
            ),
            Text(
              Strings.discount,
              style: const TextStyle(
                  color: CustomColor.colorBlack,
                  fontSize: Dimensions.radius,
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: Dimensions.heightSize * 0.5,
            ),
            Text(
              Strings.total_price,
              style: const TextStyle(
                  color: CustomColor.colorBlack,
                  fontSize: Dimensions.radius,
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: Dimensions.heightSize * 2,
            ),
          ],
        ),
      ],
    );
  }
}
