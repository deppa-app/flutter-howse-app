import 'package:flutter/material.dart';

import 'package:deppa_app/screens/dashboard/billing/property_features.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../utils/custom_color.dart';
import '../../../utils/dimensions.dart';
import '../../../utils/strings.dart';
import '../../../../widgets/widget.dart';
import 'package:deppa_app/screens/screens.dart';

class BillingData extends StatefulWidget {
  const BillingData({Key ?key}) : super(key: key);

  @override
  State<BillingData> createState() => _BillingDataState();
}

class _BillingDataState extends State<BillingData> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Colors.white,
          child: Scrollbar(
              child: ListView(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            children: [
              const BackButtonGeneralWidget(),
              const SizedBox(
                height: Dimensions.heightSize * 2,
              ),
              Center(
                child: Text(
                  "Facturacion",
                  style: TextStyle(
                      color: CustomColor.colorBlack,
                      fontSize: Dimensions.semilarge,
                      fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(
                height: Dimensions.heightSize * 2,
              ),
              const Center(
                child: Image(
                  image: AssetImage('assets/images/room1.png'),
                  width: 320,
                  height: 200,
                ),
              ),
              const SizedBox(
                height: Dimensions.heightSize * 1,
              ),
              Center(
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(
                        fontSize: Dimensions.defaultTextSize +1,
                        fontWeight: FontWeight.w500),
                    children: <TextSpan>[
                      TextSpan(
                        text: Strings.billing_value,
                        style: const TextStyle(color: CustomColor.colorBlack),
                      ),
                      TextSpan(
                        text: Strings.billing_price,
                        style: const TextStyle(
                          color: CustomColor.greenColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: Dimensions.heightSize * 1.5,
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.12,
                    right: MediaQuery.of(context).size.width * 0.12),
                child: Text(
                  "detalles de terminos legales 2 Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      color: CustomColor.colorBlack,
                      fontSize: Dimensions.defaultTextSize +1,
                      fontWeight: FontWeight.normal),
                ),
              ),
              const SizedBox(
                height: Dimensions.heightSize * 2,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * .12),
                child: const _buildDetails(toilet: 4, bedroom: 6, storage: 1, parking: 1, squareMeter: 200, codigo: 2345,servicios: 'Conserjería',),
              ),
              const SizedBox(
                height: Dimensions.heightSize * .5,
              ),
              const Divider(),
              const SizedBox(
                height: Dimensions.heightSize * 2,
              ),
              Column(
                children: [
                  Text(
                    "Detalles de mi visita ",
                    style: TextStyle(
                        color: CustomColor.colorBlack,
                        fontSize: Dimensions.textSize18  ,
                        fontWeight: FontWeight.w600
                        ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * .03),
                  const _buildDetailsSection()
                ],
              ),
              const SizedBox(
                height: Dimensions.heightSize * 2,
              ),
              
              const Divider(),
              const SizedBox(
                height: Dimensions.heightSize * 2,
              ),
              Center(
                child: SecondaryButtonWidget(
                  title: "Descargar factura",
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const DownloadInvoice()));
                  },
                ),
              ),
              const SizedBox(
                height: Dimensions.heightSize * 2,
              ),
              Center(
                child: SecondaryOutlineButtonWidget(
                  title: "Desacargar propiedad ",
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const PropertyFeatures()));
                  },
                ),
              ),
              const SizedBox(
                height: Dimensions.heightSize * 2,
              ),
            ],
          )),
        ),
      ),
    );
  }
}

class _buildDetails extends StatelessWidget {
  const _buildDetails({
    Key ?key,
    required this.toilet,
    required this.bedroom,
    required this.storage,
    required this.parking,
    required this.squareMeter,
    this.codigo,
    this.servicios,
    this.otros,
  }) : super(key: key);
  final int ?toilet;
  final int ?codigo;
  final int ?otros;
  final String ?servicios;
  final int ?bedroom;
  final int ?storage;
  final int ?parking;
  final int ?squareMeter;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width - MediaQuery.of(context).size.width),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(
                        FontAwesomeIcons.circleCheck,
                        color: CustomColor.brownColor2,
                        size: 10,
                      ),
                      const SizedBox(
                        width: 5,
                        height: 5,
                      ),
                      Text('${Strings.code} $codigo ',
                          style: TextStyle(
                            fontSize: Dimensions.defaultTextSize,
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                          )),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(
                        FontAwesomeIcons.circleCheck,
                        color: CustomColor.brownColor2,
                        size: 10,
                      ),
                      const SizedBox(
                        width: 5,
                        height: 5,
                      ),
                      Text('${Strings.bathroom}: $toilet',
                          style: TextStyle(
                            fontSize: Dimensions.defaultTextSize,
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                          )),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(
                        FontAwesomeIcons.circleCheck,
                        color: CustomColor.brownColor2,
                        size: 10,
                      ),
                      const SizedBox(
                        width: 5,
                        height: 5,
                      ),
                      Text('${Strings.parking}: $parking',
                          style: TextStyle(
                            fontSize: Dimensions.defaultTextSize,
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                          )),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(
                        FontAwesomeIcons.circleCheck,
                        color: CustomColor.brownColor2,
                        size: 10,
                      ),
                      const SizedBox(
                        width: 5,
                        height: 5,
                      ),
                      Text('${Strings.bedrooms}: $bedroom',
                          style: TextStyle(
                            fontSize: Dimensions.defaultTextSize,
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                          )),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                width: 25,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(
                        FontAwesomeIcons.circleCheck,
                        color: CustomColor.brownColor2,
                        size: 10,
                      ),
                      const SizedBox(
                        width: 5,
                        height: 5,
                      ),
                      Text('${Strings.services} $servicios',
                          style: TextStyle(
                            fontSize: Dimensions.defaultTextSize,
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                          )),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(
                        FontAwesomeIcons.circleCheck,
                        color: CustomColor.brownColor2,
                        size: 10,
                      ),
                      const SizedBox(
                        width: 5,
                        height: 5,
                      ),
                      Text('${Strings.square_meter}: $squareMeter',
                          style: TextStyle(
                            fontSize: Dimensions.defaultTextSize,
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                          )),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(
                        FontAwesomeIcons.circleCheck,
                        color: CustomColor.brownColor2,
                        size: 10,
                      ),
                      const SizedBox(
                        width: 5,
                        height: 5,
                      ),
                      Text('${Strings.others}: $otros',
                          style: TextStyle(
                            fontSize: Dimensions.defaultTextSize,
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                          )),
                    ],
                  ),
                  const SizedBox(height: 15),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
class _buildDetailsSection extends StatelessWidget {
  const _buildDetailsSection({
    Key ?key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var iconClock = const Icon(FontAwesomeIcons.clock,
                size: 60, color: CustomColor.brownColor2);
    var iconPersonCircleCheck = const Icon(FontAwesomeIcons.personCircleCheck,
                size: 60, color: CustomColor.brownColor2);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            iconClock,
            const Text('Minutos \nreservados', textAlign: TextAlign.center,),
            SizedBox(height: MediaQuery.of(context).size.height* .015,),
            RichText(
                  text: TextSpan(
                    style: TextStyle(
                        fontSize: Dimensions.defaultTextSize +1,
                        fontWeight: FontWeight.w500),
                    children: <TextSpan>[
                      TextSpan(
                        text: '30',
                        style: TextStyle(
                          color: CustomColor.greenColor,
                          fontSize: Dimensions.semilargelarge - 1
                          ),
                      ),
                      TextSpan(
                        text: 'min',
                        style: TextStyle(
                          color: CustomColor.greenColor,
                          fontSize: Dimensions.largeTextSize
                        ),
                      ),
                    ],
                  ),
                ),
          ],
        ),
        SizedBox(width: MediaQuery.of(context).size.width *0.15),
        Column(
          children: [
            iconClock,
            const Text('Minutos \nocupados', textAlign: TextAlign.center),
            SizedBox(height: MediaQuery.of(context).size.height* .015,),
            RichText(
                  text: TextSpan(
                    style: TextStyle(
                        fontSize: Dimensions.defaultTextSize +1,
                        fontWeight: FontWeight.w500),
                    children: <TextSpan>[
                      TextSpan(
                        text: '10',
                        style: TextStyle(
                          color: CustomColor.greenColor,
                          fontSize: Dimensions.semilargelarge - 1
                          ),
                      ),
                      TextSpan(
                        text: 'min',
                        style: TextStyle(
                          color: CustomColor.greenColor,
                          fontSize: Dimensions.largeTextSize
                        ),
                      ),
                    ],
                  ),
                ),
          ],
        ),
        SizedBox(width: MediaQuery.of(context).size.width *0.15),
        Column(
          children: [
            iconPersonCircleCheck,
            const Text('Números \nde visitas', textAlign: TextAlign.center),
            SizedBox(height: MediaQuery.of(context).size.height* .015,),
            RichText(
                  text: TextSpan(
                    style: TextStyle(
                        fontSize: Dimensions.defaultTextSize +1,
                        fontWeight: FontWeight.w500),
                    children: <TextSpan>[
                      TextSpan(
                        text: '8',
                        style: TextStyle(
                          color: CustomColor.greenColor,
                          fontSize: Dimensions.semilargelarge - 1
                          ),
                      ),
                    ],
                  ),
                ),
          ],
        )
      ],
    );
  }
}