import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:howse_app/widgets/widget.dart';

import '../../../utils/utils.dart';
import '../../screens.dart';

class MyVisitsHistory extends StatelessWidget {
   
  const MyVisitsHistory({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: Container(
           width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Colors.white,
          child: ListView(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            children: [
               BackButtonGeneralWidget(),
              SizedBox(height: Dimensions.heightSize),
              _principalString(),
              SizedBox(height: Dimensions.heightSize),

              GestureDetector(child: _HiredSection(), onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>  const VisitDetailsScreen()));
              },),
              
              SizedBox(height: Dimensions.heightSize),
              _HiredSection(),
              SizedBox(height: Dimensions.heightSize),
              _HiredSection(),
              SizedBox(height: Dimensions.heightSize),
              _HiredSection(),
              SizedBox(height: Dimensions.heightSize),
              _HiredSection(),
              SizedBox(height: Dimensions.heightSize),
              _HiredSection(),
              SizedBox(height: Dimensions.heightSize),
              _HiredSection(),
              SizedBox(height: Dimensions.heightSize),
              _HiredSection(),
              SizedBox(height: Dimensions.heightSize),
              _HiredSection(),
            ],
            )
        ),
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
    return Text(
      Strings.myVisitsHistoy,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.black,
        fontSize: Dimensions.extraLargeTextSize * 1.5,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}

class _HiredSection extends StatelessWidget {
   
  final String price;
  final int toilet;
  final int bedroom;
  final int storage;
  final int parking;
  final int squareMeter;


  const _HiredSection({
    Key key, 
    this.price = '385.000', 
    this.toilet = 0, 
    this.storage = 0, 
    this.parking = 0, 
    this.squareMeter = 0, 
    this.bedroom = 0
    }) 
    : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 1,
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(width: MediaQuery.of(context).size.width - (MediaQuery.of(context).size.width)),
              _buildImageAndPrice(price: price),
              _buildDetails(toilet: toilet, bedroom: bedroom, storage: storage, parking: parking, squareMeter: squareMeter),
              /* Expanded(child: _buildDate()), */
            ],
          ),
          const _buildLocation()
        ],
      ),
    );
  }
}

class _buildLocation extends StatelessWidget {
  const _buildLocation({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
    
      child: Row(
        children: [
          const SizedBox(width: Dimensions.marginSize *2),
          const Icon(FontAwesomeIcons.podcast, color: CustomColor.greenColor, size: 10,),
          const SizedBox(width: 5, height: 5,),
          Text(
            'AV. Providencia',
            style: TextStyle(
              fontSize: Dimensions.smallTextSize,
              color: CustomColor.greenColor
            ),
          ),
          const SizedBox(width: Dimensions.marginSize *1.2),
          const Icon(FontAwesomeIcons.personWalkingArrowRight, color: CustomColor.greyColor, size: 10,),
          const SizedBox(width: 5, height: 5,),
          Text(
            '200 Rafael Sotomayor #23',
            style: TextStyle(
              fontSize: Dimensions.smallTextSize,
              color: CustomColor.greyColor
            ),
          )
        ],
      ),
    );
  }
}

class _buildDate extends StatelessWidget {
  const _buildDate({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const SizedBox(
          height: 5,
        ),
        Text( 
          'Fecha: 14/3/2023',
          style: TextStyle(
            fontSize: Dimensions.extraSmallTextSize,
                    fontWeight: FontWeight.w600,
                    color: CustomColor.greenColor,
          )
        ),
      ],
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 8.5),

        Row(
          children: [
            Text( 
              Strings.aparmentRentals,
              style: TextStyle(
                fontSize: Dimensions.smallTextSize,
                        fontWeight: FontWeight.w600,
                        color: CustomColor.colorBlack,
              )
            ),
            SizedBox(width: MediaQuery.of(context).size.width - (MediaQuery.of(context).size.width *0.9) ),
            _buildDate()
          ],
        ),
        const SizedBox(height: 6),
        Row(
          mainAxisSize: MainAxisSize.min,
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
    );
  }
}

class _buildImageAndPrice extends StatelessWidget {
  const _buildImageAndPrice({
    Key key,
    @required this.price,
  }) : super(key: key);

  final String price;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 15,),
        const FadeInImage(
            placeholder: AssetImage('assets/images/no-image.jpg'),
            fit: BoxFit.cover,
            image:  AssetImage('assets/images/casita.png'),
            width: 56,
            height: 64,
        ),
        const SizedBox(height: 10),
        _builPrice(price: price),
      ],
    );
  }
}

class _builPrice extends StatelessWidget {
  const _builPrice({
    Key key,
    @required this.price,
  }) : super(key: key);

  final String price;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '\$$price',
          style: TextStyle(
            fontSize: Dimensions.smallTextSize,
            fontWeight: FontWeight.w600,
            color: CustomColor.brownColor2,),
        ),
      ],
    );
  }
}