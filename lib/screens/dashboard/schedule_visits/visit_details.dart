import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../utils/utils.dart';
import '../../../widgets/widget.dart';

class VisitDetailsScreen extends StatelessWidget {
  const VisitDetailsScreen({Key ?key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
             const _principalString(),
             const _buildImage(
              price: '',
            ),
             const _PriceAndText(),
             const _DescriptionText(),
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child:  const _buildDetails(
                  codigo: 123456,
                  toilet: 2,
                  parking: 2,
                  bedroom: 2,
                  squareMeter: 80,
                  servicios: 0,
                  otros: 0, 
                  storage: 0,
                )),
            const SizedBox(height: Dimensions.heightSize),
             const SellerContactButtonWidget(
                title: 'Contactate con el vendedor',
                phoneNumber: '+569 86479870'),
             const _buildDivider(),
             const _SecondaryString(title: 'Detalles de mi visita',),
            const SizedBox(height: Dimensions.heightSize * 1.5),
             const _buildDetailsSection(),
             const _buildDivider(),
             const _SecondaryString(title: 'Direccion',),
            const SizedBox(height: Dimensions.heightSize * 1.5),
             const _buildAddresSection(),
            const SizedBox(height: Dimensions.heightSize * 1.5),
             const _buildTotalPrice(totalPrice: 12470,),
            const SizedBox(height: Dimensions.heightSize * 1.5),
             const _seeTicket(),
            const SizedBox(height: Dimensions.heightSize * 1.5),
            SecondaryButtonWidget(title: Strings.iWantToRent,),
            const SizedBox(height: Dimensions.heightSize * 1.5),
            SecondaryOutlineButtonWidget(title: Strings.donwloadProperty)
          ],
        ),
      )),
    );
  }
}

class _seeTicket extends StatelessWidget {
  const _seeTicket({
    Key ?key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Padding(
      padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * .7),
      child: Text(
        'Ver boleta',
        style: TextStyle(
          fontSize: Dimensions.largeTextSize, 
          fontWeight: FontWeight.w600, 
          color: CustomColor.brownColor2,
          decoration: TextDecoration.underline),
        ),
      ),
    );
  }
}

class _buildTotalPrice extends StatelessWidget {

  final int totalPrice;

  const _buildTotalPrice({
    Key ?key, this.totalPrice = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: CustomColor.greyColor2,
      height: 70,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:[
              const Icon(FontAwesomeIcons.handHoldingDollar, color: CustomColor.brownColor2, size: 40,),
              const SizedBox(width: 15,),
              Text(
                Strings.visitValue,
                style: TextStyle(fontSize: Dimensions.largeTextSize, fontWeight: FontWeight.w600, color: CustomColor.brownColor2),
              ),
              SizedBox(width: MediaQuery.of(context).size.width *.2,),
              Text(
                '\$ $totalPrice',
                style: TextStyle(fontSize: Dimensions.largeTextSize, fontWeight: FontWeight.normal, color: CustomColor.brownColor2),
              )
              ]
          ),
         
        ],
      ),
    );
  }
}

class _buildAddresSection extends StatelessWidget {
  const _buildAddresSection({
    Key ?key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(FontAwesomeIcons.locationDot, color: CustomColor.greyColor,),
            Text(
              'Av Nueva Providencia 2394, Santiago',
              style: TextStyle(fontSize: Dimensions.smallTextSize, fontWeight: FontWeight.normal),
              )
          ],
        ),
        const SizedBox(height: Dimensions.heightSize),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(width: 5,),
            const Icon(FontAwesomeIcons.podcast, color: CustomColor.greyColor,size: 20,),
            Text(
              'AV. Providencia sector norte, Santiago',
              style: TextStyle(fontSize: Dimensions.smallTextSize, fontWeight: FontWeight.normal),
              )
          ],
        )
      ],
    );
  }
}

class _buildDivider extends StatelessWidget {
  const _buildDivider({
    Key ?key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.9,
          child: const Divider(
              height: 25, color: CustomColor.greyColor, thickness: 1)),
    );
  }
}

class _buildDetailsSection extends StatelessWidget {
  const _buildDetailsSection({
    Key ?key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            Icon(FontAwesomeIcons.clock,
                size: 70, color: CustomColor.greenColor),
            Text('40 minutos')
          ],
        ),
        SizedBox(width: MediaQuery.of(context).size.width *0.08),
        Column(
          children: [
            Icon(FontAwesomeIcons.clock,
                size: 70, color: CustomColor.greenColor),
            Text('40 minutos')
          ],
        ),
        SizedBox(width: MediaQuery.of(context).size.width *0.1),
        Column(
          children: [
            Icon(FontAwesomeIcons.personCircleCheck,
                size: 70, color: CustomColor.greenColor),
            Text('2 visitas')
          ],
        )
      ],
    );
  }
}

class _SecondaryString extends StatelessWidget {

  final String title;

  const _SecondaryString({
    Key ?key, this.title ='',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
          fontSize: Dimensions.defaultTextSize, fontWeight: FontWeight.w600),
      textAlign: TextAlign.center,
    );
  }
}

class _principalString extends StatelessWidget {
  const _principalString({
    Key ?key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text('Detalle de mis visitas',
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: Dimensions.semilarge, fontWeight: FontWeight.w600));
  }
}

class _buildImage extends StatelessWidget {
  const _buildImage({
    Key ?key,
    required this.price,
  }) : super(key: key);

  final String price;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 15,
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: FadeInImage(
            placeholder: AssetImage('assets/images/no-image.jpg'),
            fit: BoxFit.cover,
            image: AssetImage('assets/images/casita.png'),
            width: MediaQuery.of(context).size.width *.9,
            height: 250,
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}

class _DescriptionText extends StatelessWidget {
  const _DescriptionText({
    Key ?key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(
        left: 50,
        right: 50,
        bottom: 15,
      ),
      child: Text(
          'Est quis sint velit laborum quis officia ea qui dolore ad excepteur qui. In et ex minim mollit sunt sint eiusmod ullamco. Elit incididunt tempor esse cupidatat exercitation eu ipsum ad est laborum. Occaecat cupidatat qui proident id sint sit et laboris cillum aliqua culpa. Sit enim commodo officia adipisicing excepteur qui magna. Nisi id enim minim ullamco elit ipsum consectetur quis aute.'),
    );
  }
}

class _PriceAndText extends StatelessWidget {
  const _PriceAndText({
    Key ?key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 40, right: 40, bottom: 12),
      child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
              text: "Valor de arriendo mensual: ",
              style: TextStyle(
                  color: CustomColor.colorBlack,
                  fontSize: Dimensions.largeTextSize,
                  fontWeight: FontWeight.w600,
                  height: 1.5),
              children: [
                TextSpan(
                  text: '123.000',
                  style: TextStyle(
                      color: CustomColor.brownColor2,
                      fontSize: Dimensions.largeTextSize,
                      fontWeight: FontWeight.w600),
                ),
              ])),
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
  final int ?servicios;
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
                      Text('${Strings.services}: $servicios',
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
