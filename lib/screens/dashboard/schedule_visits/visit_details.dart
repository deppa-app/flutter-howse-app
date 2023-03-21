import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../utils/utils.dart';
import '../../../widgets/widget.dart';

class VisitDetailsScreen extends StatelessWidget {
   
  const VisitDetailsScreen({Key key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:  Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Colors.white,
          child: ListView(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            children: const[
              BackButtonGeneralWidget(),
              SizedBox(height: Dimensions.heightSize),
              _principalString(),
              _buildImage(),
              _PriceAndText(),
              _DescriptionText(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 150),
                child: _buildDetails(toilet: 2, bedroom: 2, storage: 2, parking: 2, squareMeter: 2),
              )



            ],
          ),
        )
        ),
      );
  }
}

class _principalString extends StatelessWidget {
  const _principalString({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text('Detalle de mis visitas', textAlign: TextAlign.center, style: TextStyle(fontSize: Dimensions.semilarge, fontWeight: FontWeight.w600));
  }
}

class _buildImage extends StatelessWidget {
  const _buildImage({
    Key key,
    @required this.price,
  }) : super(key: key);

  final String price;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 15,),
          ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: const FadeInImage(
              placeholder: AssetImage('assets/images/no-image.jpg'),
              fit: BoxFit.cover,
              image:  AssetImage('assets/images/casita.png'),
              width: 400,
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
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(
              left: 24,
              right: 24,
              bottom: 5,
  
            ),
      child: Text(
        'Est quis sint velit laborum quis officia ea qui dolore ad excepteur qui. In et ex minim mollit sunt sint eiusmod ullamco. Elit incididunt tempor esse cupidatat exercitation eu ipsum ad est laborum. Occaecat cupidatat qui proident id sint sit et laboris cillum aliqua culpa. Sit enim commodo officia adipisicing excepteur qui magna. Nisi id enim minim ullamco elit ipsum consectetur quis aute.\n.'),
    );
  }
}

class _PriceAndText extends StatelessWidget {
  const _PriceAndText({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.only(
              left: 40,
              right: 40,
              bottom: 12
            ),
            child: RichText(textAlign: TextAlign.center, text: TextSpan(text: "Valor de arriendo mensual: ", style: TextStyle(
              color: CustomColor.colorBlack,
              fontSize: Dimensions.largeTextSize,
              fontWeight: FontWeight.w600,
              height: 1.5
              ),
              children:[
                TextSpan(text: '123.000', style: TextStyle(
                color: CustomColor.brownColor2,
                fontSize: Dimensions.largeTextSize,
                fontWeight: FontWeight.w600
                ), ),
              ]
              )
              ),
            );
  }
}

class _buildDetails extends StatelessWidget {
  const _buildDetails({
    Key key,
    @required this.toilet,
    @required this.bedroom,
    @required this.storage,
    @required this.parking,
    @required this.squareMeter,
  }) : super(key: key);
  final int toilet;
  final int bedroom;
  final int storage;
  final int parking;
  final int squareMeter;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 50),
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
                    const Icon(FontAwesomeIcons.toilet, color: CustomColor.greyColor, size: 10,),
                    const SizedBox(width: 5, height: 5,),
                    Text( 
                      '$toilet ${Strings.bathroom}',
                      style: TextStyle(
                        fontSize: Dimensions.defaultTextSize,
                                fontWeight: FontWeight.normal,
                                color: Colors.black,
                      )
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Icon(FontAwesomeIcons.bed, color: CustomColor.greyColor, size: 10,),
                    const SizedBox(width: 5, height: 5,),
                    Text( 
                      '$bedroom ${Strings.bedrooms}',
                      style: TextStyle(
                        fontSize: Dimensions.defaultTextSize,
                                fontWeight: FontWeight.normal,
                                color: Colors.black,
                      )
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Icon(FontAwesomeIcons.boxArchive, color: CustomColor.greyColor, size: 10,),
                    const SizedBox(width: 5, height: 5,),
                    Text( 
                      '$storage ${Strings.storage}',
                      style: TextStyle(
                        fontSize: Dimensions.defaultTextSize,
                                fontWeight: FontWeight.normal,
                                color: Colors.black,
                      )
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(width: 25,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(FontAwesomeIcons.carOn, color: CustomColor.greyColor, size: 10,),
                    const SizedBox(width: 5, height: 5,),
                    Text( 
                      '$parking ${Strings.parking}',
                      style: TextStyle(
                        fontSize: Dimensions.defaultTextSize,
                                fontWeight: FontWeight.normal,
                                color: Colors.black,
                      )
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Icon(FontAwesomeIcons.house, color: CustomColor.greyColor, size: 10,),
                    const SizedBox(width: 5, height: 5,),
                    Text( 
                      '$squareMeter ${Strings.square_meter2}',
                      style: TextStyle(
                        fontSize: Dimensions.defaultTextSize,
                                fontWeight: FontWeight.normal,
                                color: Colors.black,
                      )
                    ),
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