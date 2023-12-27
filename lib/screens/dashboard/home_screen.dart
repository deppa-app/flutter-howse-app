// import 'dart:html';
import 'package:flutter/material.dart';

import 'package:deppa_app/screens/dashboard/my_reservations.dart';

import 'package:deppa_app/utils/custom_color.dart';
import 'package:deppa_app/utils/custom_style.dart';
import 'package:deppa_app/utils/dimensions.dart';
import 'package:deppa_app/utils/strings.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../models/property.dart';
import '../../search/search_department.dart';
import '../../services/properties.dart';
import '../../widgets/buttons/filter_buttons/filter_button_widget.dart';
import '../../widgets/widget.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen(
      {Key? key,
      this.idProfile,
      this.direction = '',
      this.comuna = '',
      this.changeMessage = false,
      this.totalViews = 0, 
      this.tokenSession})
      : super(key: key);
  final String direction;
  final String comuna;
  final bool changeMessage;
  final int? idProfile;
  final int totalViews;
  final String? tokenSession;
  
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? currentLocation;
  TextEditingController searchController = TextEditingController();
  late Future<PropertyList?> properties;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    print(widget.tokenSession);
    properties = getProperties(widget.tokenSession!)
    .then(((PropertyList? properties){
      
  print("imprimiendo desde el home");
  for (var property in properties!.data) {
    print('Property ID: ${property.id}');
    print('Cod: ${property.attributes.cod}');
    print('Direction: ${property.attributes.direction}');
    print('---');
  }
    }))
    ; 
    
  }

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        key: scaffoldKey,
        drawer: const SideBar(),
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    //TODO: Cambiar por mapa.
                    Container(
                      color: Colors.blue,
                      child: GestureDetector(
                        child: Image.asset(
                          'assets/images/googlemapsimg.png',
                        ),
                        onTap: () => {
          
                        },
                      ),
                    ),
                    const Positioned(
                        right: 0,
                        bottom: 30,
                        child: Padding(
                            padding: EdgeInsets.only(
                                left: Dimensions.marginSize,
                                right: Dimensions.marginSize),
                            child: FilterPopUpButtonWidget())),
                    const Positioned(
                        left: 0,
                        bottom: 30,
                        child: Padding(
                            padding: EdgeInsets.only(
                                left: Dimensions.marginSize,
                                right: Dimensions.marginSize),
                            child: MyReservations())),
                    _menuWidget(context),
                  ],
                ),
                const SizedBox(
                  height: Dimensions.heightSize,
                ),
                const GreenDivider(),
                
                BuildDetailsWidget(
                    comuna: widget.comuna, direction: widget.direction),
                const SizedBox(
                  height: Dimensions.heightSize * 1,
                ),
                GoToBookingAction(changeMessage: widget.changeMessage),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                const GoToBookYourVisitAction(),
                SizedBox(height: MediaQuery.of(context).size.height * 0.04)
              ],
            ),
          ),
        ),
      ),
    );
  }

  /*Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }*/

  /*getUserLocation() async {//call this async method from whereever you need

    LocationData myLocation;
    String error;
    Location location = new Location();
    try {
      myLocation = await location.getLocation();
    } on PlatformException catch (e) {
      if (e.code == 'PERMISSION_DENIED') {
        error = 'please grant permission';
        print(error);
      }
      if (e.code == 'PERMISSION_DENIED_NEVER_ASK') {
        error = 'permission denied- please enable it from app settings';
        print(error);
      }
      myLocation = null;
    }
    currentLocation = myLocation;
    final coordinates = new Coordinates(
        myLocation.latitude, myLocation.longitude);
    var addresses = await Geocoder.local.findAddressesFromCoordinates(
        coordinates);
    var first = addresses.first;
    setState(() {
      currentLocation = first.locality;
    });
    print('${first.locality}, ${first.adminArea},${first.subLocality}, ${first.subAdminArea},${first.addressLine}, ${first.featureName},${first.thoroughfare}, ${first.subThoroughfare}');
    return first;
  }*/

  /*_locationWidget(BuildContext context) {
    return Row(
      children: [
        /*IconButton(
            icon: const Icon(
              Icons.location_on_outlined,
              color: CustomColor.accentColor,
            ),
            onPressed: () {
              //getUserLocation();
            }
        ),*/
        /*Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              Strings.currentLocation,
              style: TextStyle(
                  color: CustomColor.accentColor,
                  fontSize: Dimensions.defaultTextSize,
                  fontWeight: FontWeight.bold
              ),
            ),
            Text(
              currentLocation.toString(),
              style: TextStyle(
                  color: Colors.black,
                  fontSize: Dimensions.smallTextSize,
                  fontWeight: FontWeight.bold
              ),
            ),
          ],
        ),*/
        const Spacer(),
        IconButton(
            icon: const Icon(
              Icons.notifications_outlined,
              color: CustomColor.accentColor,
            ),
            onPressed: () {
              /*Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
                  NotificationScreen()));*/
            }
        )
      ],
    );
  }*/

  _menuWidget(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
              left: Dimensions.marginSize,
              right: Dimensions.marginSize,
              top: Dimensions.heightSize),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.06,
            width: MediaQuery.of(context).size.width* .89,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(color: CustomColor.accentColor.withOpacity(0.3))
              ],
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  child: Container(
                    height: Dimensions.buttonHeight,
                    width: Dimensions.buttonHeight,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(Dimensions.radius),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.white,
                          spreadRadius: 0,
                          blurRadius: 0.5,
                          offset: Offset(0, 0), // changes position of shadow
                        ),
                      ],
                    ),
                    child: const Icon(
                      FontAwesomeIcons.bars,
                      color: CustomColor.greyColor,
                    ),
                  ),
                  onTap: () {
                    if (scaffoldKey.currentState!.isDrawerOpen) {
                      return scaffoldKey.currentState!.openEndDrawer();
                    } else {
                      return scaffoldKey.currentState!.openDrawer();
                    }
                  },
                ),
                const SizedBox(
                  width: Dimensions.widthSize,
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () => scaffoldKey.currentState!.setState(() {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const SearchDepartment()));
                    }),
                    child: Container(
                      alignment: Alignment.center,
                      color: Colors.white,
                      height: MediaQuery.of(context).size.height * 0.04,
                      child: IgnorePointer(
                        ignoring: true,
                        child: TextFormField(
                          style: CustomStyle.textStyle,
                          controller: searchController,
                          keyboardType: TextInputType.text,
                          readOnly: true,
                          /* validator: (String ?value) {
                            if (value!.isEmpty) {
                              return Strings.pleaseFillOutTheField;
                            } else {
                              return null;
                            }
                          }, */
                          decoration: InputDecoration(
                            /*                       hintText: Strings.searchResult, */
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 5.0, horizontal: 20.0),
                            /*                       labelStyle: CustomStyle.textStyle,
                            filled: true, */
                            fillColor: Colors.white,
                            hintStyle: CustomStyle.textStyle,
                            focusedBorder: CustomStyle.searchBox,
                            enabledBorder: CustomStyle.searchBox,
                            focusedErrorBorder: CustomStyle.searchBox,
                            errorBorder: CustomStyle.searchBox,
                            suffixIcon: const Icon(
                              Icons.search,
                              size: 20,
                              color: CustomColor.greyColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: Dimensions.widthSize,
                ),
                GestureDetector(
                  child: Container(
                    height: Dimensions.buttonHeight,
                    width: Dimensions.buttonHeight,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(Dimensions.radius),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.white,
                          spreadRadius: 0,
                          blurRadius: 0.5,
                          offset: Offset(0, 0), // changes position of shadow
                        ),
                      ],
                    ),
                    child: const Icon(
                      FontAwesomeIcons.envelopeOpenText,
                      color: CustomColor.greyColor,
                    ),
                  ),
                  onTap: () {
                    /*Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
                        FilterScreen()));*/
                  },
                )
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: () => scaffoldKey.currentState!.setState(() {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const SearchDepartment()));
                    }),
          child: Padding(
            padding: const EdgeInsets.only(
                left: Dimensions.marginSize,
                right: Dimensions.marginSize,
                top: Dimensions.heightSize),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.06,
              width: MediaQuery.of(context).size.width * .70,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: CustomColor.accentColor.withOpacity(0.3),
                    spreadRadius: 1,
                    blurRadius: 2,
                    offset: const Offset(0, 3)
                    )
                ],
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width *.03),
                    child: const Icon(FontAwesomeIcons.podcast, color: CustomColor.greenColor,),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height *.01),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          Strings.nearYourCurrentLocation,
                          style: TextStyle(
                            color: CustomColor.greenColor,
                            fontWeight: FontWeight.w600,
                            fontSize: Dimensions.defaultTextSize
                            ),
                          ),
                          Text(
                          widget.comuna == ''
                              ? 'Av. Providencia'
                              : widget.comuna,
                          style: TextStyle(
                            color: CustomColor.colorBlack,
                            fontWeight: FontWeight.normal,
                            fontSize: Dimensions.defaultTextSize
                            ),
                          )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  circularButtonWidget(BuildContext context, Widget page) {
    return Padding(
      padding: const EdgeInsets.only(
          left: Dimensions.marginSize, right: Dimensions.marginSize),
      child: CircleButtonWidget(
        icon: const Icon(
          Icons.arrow_forward,
          color: CustomColor.whiteColor,
        ),
        onTap: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => page));
        },
      ),
    );
  }

//Menú flotante para reservas
  go(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          left: Dimensions.marginSize, right: Dimensions.marginSize),
      child: CircleButtonWidget(
        icon: const Icon(
          Icons.arrow_forward,
          color: CustomColor.whiteColor,
        ),
        onTap: () {},
      ),
    );
  }
}
