/* import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../utils/utils.dart';
import '../widgets/widget.dart';

class SearchDeparment extends StatelessWidget {
  const SearchDeparment({Key ?key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool _showLocation = false;
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Colors.white,
          child: ListView(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const BackButtonGeneralWidget(),
                  const SizedBox(height: Dimensions.heightSize),
                  const _SearchBar(),
                  const SizedBox(height: Dimensions.heightSize),
                  Column(
                    children: [
                      Container(
                        color: Colors.grey[200],
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: const _LocationListItem(location: 'Av Holanda 754'),
                      )
                    ],
                  ),
                ],
              ),
            ],
          )
        )
        ),
    );
  }
}

class _SearchBar extends StatelessWidget {
  const _SearchBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 30),
    child: TextField(
      decoration:  InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          vertical: 8,  // altura de 32 - 16 (padding vertical)
          horizontal: 14, // anchura de 285 - 16 (padding horizontal)
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(
            width: 1,
            style: BorderStyle.solid,
            color: CustomColor.greyColor
          )
        ),
        suffixIcon: const Icon(FontAwesomeIcons.magnifyingGlass, color: CustomColor.greyColor, size: 16,),
        hintText: 'Búsquedas',
      ),
    ),
  );
  }
}

class _LocationListItem extends StatelessWidget {
  const _LocationListItem({Key? key, required this.location})
      : super(key: key);

  final String location;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(location),
    );
  }
} */

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../utils/utils.dart';
import '../widgets/widget.dart';

class SearchDepartment extends StatefulWidget {
  const SearchDepartment({Key? key}) : super(key: key);

  @override
  State<SearchDepartment> createState() => _SearchDepartmentState();
}

class _SearchDepartmentState extends State<SearchDepartment> {
  bool _showLocation = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Colors.white,
          child: ListView(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const BackButtonGeneralWidget(),
                  const SizedBox(height: Dimensions.heightSize),
                  const _SearchBar(),
                  const SizedBox(height: Dimensions.heightSize),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _showLocation = !_showLocation;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      width: MediaQuery.of(context).size.width * 0.5,
                      color: CustomColor.redColor,
                      child:  Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            FontAwesomeIcons.podcast,
                            color: CustomColor.greenColor,
                            ),
                            SizedBox( width: MediaQuery.of(context).size.width * .03,),
                          RichText(
                            text: TextSpan(
                              text: 'Cerca de tu ubicación actual\n',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: Dimensions.defaultTextSize + 1,
                                color: CustomColor.greenColor
                              ),
                              children: [
                                TextSpan(
                                  text: 'Av. Providencia. Santiago',
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: Dimensions.smallTextSize,
                                color: CustomColor.colorBlack
                              ),
                                )
                              ]
                              ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height - (MediaQuery.of(context).size.height * .97),),
                  if (_showLocation)
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        color: Colors.grey[200],
                        width: MediaQuery.of(context).size.width * 0.7,
                        child:  Column(
                          children: [
                            const _LocationListItem(comuna: 'Av. Providencia. Santiago', direction: 'Av Holanda 754 ',),
                            const _LocationListItem(comuna: 'Av. Providencia. Santiago', direction: 'Av Holanda 754',),
                            const _LocationListItem(comuna: 'Av. Providencia. Santiago', direction: 'Av Holanda 754',),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SearchBar extends StatelessWidget {
  const _SearchBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 50),
      child: TextField(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(
            vertical: 8, // altura de 32 - 16 (padding vertical)
            horizontal: 14, // anchura de 285 - 16 (padding horizontal)
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            borderSide: BorderSide(
              width: 1,
              style: BorderStyle.solid,
              color: CustomColor.greyColor,
            ),
          ),
          suffixIcon: Icon(
            FontAwesomeIcons.search,
            color: CustomColor.greyColor,
            size: 16,
          ),
          hintText: 'Búsquedas',
        ),
      ),
    );
  }
}

class _LocationListItem extends StatelessWidget {
  const _LocationListItem({Key? key, required this.comuna, required this.direction}) : super(key: key);

  final String comuna;
  final String direction;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Padding(
            padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.1, vertical: 2),
            child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Icon(
                            FontAwesomeIcons.podcast,
                            color: CustomColor.greenColor,
                            ),
                            SizedBox( width: MediaQuery.of(context).size.width * .03,),
                          RichText(
                            text: TextSpan(
                              text: '$direction\n',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: Dimensions.defaultTextSize + 1,
                                color: CustomColor.brownColor2
                              ),
                              children: [
                                TextSpan(
                                  text: comuna,
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: Dimensions.smallTextSize,
                                color: CustomColor.colorBlack
                              ),
                                )
                              ]
                              
                              ),
                          ),
                        ],
                      ),
          ),
        ],
      ),
    );
  }
}
