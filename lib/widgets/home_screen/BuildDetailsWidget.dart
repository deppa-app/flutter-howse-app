import 'package:flutter/material.dart';
//import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../utils/utils.dart';
import '../widget.dart';

class BuildDetailsWidget extends StatelessWidget {
  const BuildDetailsWidget({
    Key? key,
    required this.direction,
    required this.comuna,

  }) : super(key: key);

  final String direction;
  final String comuna;


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(9),
          child: Container(
            padding: EdgeInsets.symmetric(
                horizontal:
                    MediaQuery.of(context).size.width * 0.025,
                vertical: MediaQuery.of(context).size.width * .025),
            width: MediaQuery.of(context).size.width * 10,
            height: MediaQuery.of(context).size.height * .34,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: CustomColor.whiteColor2,
              border: Border.all(
                  color: CustomColor.greyColor, 
                  width: 1),
            ),
            child: Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                        width:
                            MediaQuery.of(context).size.width * .5,
                        child: const Text(
                          'Arriendo de departamento a pasos del metro provincia',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              ),
                        )),
                    const SizedBox(
                      height: 10,
                    ),
                    _buildDetails(
                      toilet: 2,
                      codigo: 123456,
                      parking: 2,
                      bedroom: 2,
                      squareMeter: 80,
                      servicios: 'Lavandería, Patio',
                      otros:
                          'La conserjería funciona las 24 horas, el edificio dispone de piscina, portón automático.',
                      storage: 0,
                      totalViews: 12,
                      comuna: comuna == ''
                          ? 'Av. Providencia'
                          : comuna,
                    ),
                  ],
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width *.11 ,
                        ),
                        const GreenOutlineButtonWidget(
                          title: 'Próximos',
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    FadeInImage(
                      placeholder:
                          const AssetImage('assets/images/no-image.jpg'),
                      fit: BoxFit.cover,
                      image: const AssetImage('assets/images/casita.png'),
                      width:
                          MediaQuery.of(context).size.width * .35,
                      height:
                          MediaQuery.of(context).size.height * .18,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      '\$480.000',
                      style: TextStyle(
                          color: CustomColor.brownColor2,
                          fontWeight: FontWeight.w600,
                          fontSize: Dimensions.defaultTextSize + 1),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        const Icon(
                          FontAwesomeIcons.personWalkingArrowRight,
                          size: 14,
                          color: CustomColor.greyColor,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Container(
                          width: 100,
                          child: Text(
                            direction == '' ? '200 Rafael Soto Mayor': direction,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: CustomColor.greyColor,
                                fontWeight: FontWeight.normal,
                                fontSize:
                                    Dimensions.defaultTextSize ),
                          ),
                        ),
                        const SizedBox(width: 28,)
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}


class _buildDetails extends StatelessWidget {
  const _buildDetails({
    Key? key,
    required this.toilet,
    required this.bedroom,
    required this.storage,
    required this.parking,
    required this.squareMeter,
    required this.codigo,
    this.servicios,
    this.otros,
    this.totalViews,
    required this.comuna,
  }) : super(key: key);
  final int? toilet;
  final int? codigo;
  final String? otros;
  final String? servicios;
  final int? bedroom;
  final int? storage;
  final int? parking;
  final int? squareMeter;
  final int? totalViews;
  final String? comuna;

  @override
  Widget build(BuildContext context) {
    return Column(
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
                      color: CustomColor.greenColor,
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
                      color: CustomColor.greenColor,
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
                      color: CustomColor.greenColor,
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
                Row(
                  children: [
                    const Icon(
                      FontAwesomeIcons.circleCheck,
                      color: CustomColor.greenColor,
                      size: 10,
                    ),
                    const SizedBox(
                      width: 5,
                      height: 5,
                    ),
                    Text('${Strings.square_meter2}: $squareMeter',
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
                      color: CustomColor.greenColor,
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
                      color: CustomColor.greenColor,
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
                      color: CustomColor.greenColor,
                      size: 10,
                    ),
                    const SizedBox(
                      width: 5,
                      height: 5,
                    ),
                    Text(Strings.interno,
                        style: TextStyle(
                          fontSize: Dimensions.defaultTextSize,
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                        )),
                  ],
                ),
                Row(
                  children: [
                    Column(
                      children: [
                        const Icon(
                          FontAwesomeIcons.circleCheck,
                          color: CustomColor.greenColor,
                          size: 10,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .035,
                        )
                      ],
                    ),
                    const SizedBox(
                      width: 5,
                      height: 5,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * .5,
                      child: Text('${Strings.others}: $otros',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                          style: TextStyle(
                            fontSize: Dimensions.defaultTextSize,
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                          )),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 5,
                  height: 15,
                ),
                Row(
                      children: [
                        
                    const Icon(
                      FontAwesomeIcons.eye,
                      color: CustomColor.greenColor,
                      size: 15,
                    ),
                    const SizedBox(
                      width: 5,
                      height: 5,
                    ),
                    Text(
                      '$totalViews ',
                        style: TextStyle(
                          fontSize: Dimensions.defaultTextSize,
                          fontWeight: FontWeight.normal,
                          color: CustomColor.greyColor,
                        )),
                    Text(
                      Strings.persons,
                        style: TextStyle(
                          fontSize: Dimensions.defaultTextSize,
                          fontWeight: FontWeight.normal,
                          color: CustomColor.greyColor,
                        )),
                      ],
                    ),
                    const SizedBox(
                      width: 5,
                      height: 5,
                    ),
                Row(
                      children: [
                        
                    const Icon(
                      FontAwesomeIcons.podcast,
                      color: CustomColor.greenColor,
                      size: 15,
                    ),
                    const SizedBox(
                      width: 5,
                      height: 5,
                    ),
                    Text(
                      '${comuna} ',
                        style: TextStyle(
                          fontSize: Dimensions.defaultTextSize,
                          fontWeight: FontWeight.normal,
                          color: CustomColor.greenColor,
                        )
                        ),
                      ],
                    )
              ],
            ),
          ],
        ),
      ],
    );
  }
}
