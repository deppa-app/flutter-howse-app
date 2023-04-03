import 'package:deppa_app/screens/dashboard/home_screen.dart';
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
final List<Map<String, String>> locations = [  {'comuna': 'Providencia', 'direction': 'Av Holanda'},  {'comuna': 'Las Condes', 'direction': 'Av Apoquindo 1000'},  {'comuna': 'Vitacura', 'direction': 'Luis Pasteur 6600'},];

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
                mainAxisAlignment: MainAxisAlignment.start,
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
                      padding: EdgeInsets.symmetric(vertical: 8, horizontal: MediaQuery.of(context).size.width * .2),
                      child:  Row(
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
                    Container(
                      child: _showLocation
                          ? ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Container(
                                color: Colors.grey[200],
                                width: MediaQuery.of(context).size.width * 0.73,
                                child: Column(
                                  children: locations
                                      .asMap()
                                      .map((index, location) => MapEntry(
                                          index,
                                          GestureDetector(
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) => HomeScreen(
                                                    comuna: location['comuna']!,
                                                    direction: location['direction']!,
                                                    changeMessage: true,
                                                  ),
                                                ),
                                              );
                                            },
                                            child: _LocationListItem(
                                              comuna: location['comuna']!,
                                              direction: location['direction']!,
                                              icon: FontAwesomeIcons.podcast,
                                              colorDirection: CustomColor.brownColor2,
                                            ),
                                          )))
                                      .values
                                      .toList(),
                                ),
                              ),
                            )
                          : Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: MediaQuery.of(context).size.width * .1),
                              child: Text(
                                'Búsquedas recientes',
                                style: TextStyle(
                                    fontSize: Dimensions.semilarge,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                    ),

                  SizedBox(height: MediaQuery.of(context).size.height - (MediaQuery.of(context).size.height * .98),),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.73,
                    child: Column(
                      children: const[
                        _LocationListItem(
                          comuna: 'Av. Providencia. Santiago', 
                          direction: 'Santiago', 
                          icon: FontAwesomeIcons.clockRotateLeft, 
                          colorDirection: CustomColor.colorBlack),
                      ],
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height - (MediaQuery.of(context).size.height * .98),),
                  Container(
                          padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * .1),
                          child: Text( 
                            'Ver todas las búsquedas recientes',
                            style: TextStyle(
                              fontSize: Dimensions.defaultTextSize + 1,
                              fontWeight: FontWeight.w600
                            ),
                            ),
                        )
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
  const _LocationListItem({Key? key, required this.comuna, required this.direction, required this.icon, required this.colorDirection}) : super(key: key);

  final String comuna;
  final String direction;
  final IconData icon;
  final Color colorDirection;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox( width: MediaQuery.of(context).size.width * .07,),
                        Icon(
                          icon,
                          color: CustomColor.greenColor,
                          ),
                          SizedBox( width: MediaQuery.of(context).size.width * .03,),
                        RichText(
                          text: TextSpan(
                            text: '$direction\n',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: Dimensions.defaultTextSize + 1,
                              color: colorDirection
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
        ],
      ),
    );
  }
}
