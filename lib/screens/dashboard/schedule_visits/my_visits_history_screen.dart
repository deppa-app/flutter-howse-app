import 'package:flutter/material.dart';
import 'package:howse_app/widgets/widget.dart';

import '../../../utils/dimensions.dart';
import '../../../utils/utils.dart';

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
            children: const[
               BackButtonGeneralWidget(),
              SizedBox(height: Dimensions.heightSize),
              _principalString(),
              _HiredSection()
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
   
  const _HiredSection({Key key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Container(
         child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: const FadeInImage(
                placeholder: AssetImage('assets/images/no-image.jpg'),
                image:  AssetImage('assets/images/room1.png'),
                height: 150,
                width: 110,
              ),
              ),
          const SizedBox(width: 20),
          ],
         ),
      );

  }
}