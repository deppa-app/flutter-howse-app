// import 'dart:html';

import 'package:flutter/material.dart';

import 'package:howse_app/screens/dashboard/billing.dart';
import 'package:howse_app/screens/dashboard/booking.dart';
import 'package:howse_app/screens/dashboard/rental_history.dart';
import 'package:howse_app/screens/dashboard/schedule_visits/book_your_visit.dart';
import 'package:howse_app/screens/dashboard/schedule_visits/my_visits_history_screen.dart';
import 'package:howse_app/screens/servicesAviable/cleaning.dart';
import 'package:howse_app/screens/servicesAviable/removals.dart';

import 'package:howse_app/utils/custom_color.dart';
import 'package:howse_app/utils/custom_style.dart';
import 'package:howse_app/utils/dimensions.dart';
import 'package:howse_app/utils/strings.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:howse_app/widgets/buttons/filter_button_widget.dart';

import '../../widgets/widget.dart';
import '../auth/my_account_screen.dart';

import '../../widgets/list_data/list_data_widget.dart';
import '../auth/sign_in_screen.dart';
import 'functional_adult_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key, this.idProfile}) : super(key: key);
  final int idProfile;
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String currentLocation;
  TextEditingController searchController = TextEditingController();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();

    //_determinePosition();
    currentLocation = '';
    //getUserLocation();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        key: scaffoldKey,
        drawer: Drawer(
          child: Container(
            color: CustomColor.whiteColor2,
            child: ListView(
              children: <Widget>[
                const SizedBox(
                  height: 200,
                  child: DrawerHeader(
                    child: DrawerHeaderWidget(),
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                    ),
                  ),
                ),
                ListDataFontawesomeWidget(
                  icon: FontAwesomeIcons.userPen,
                  title: Strings.myAccountEsp,
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => MyAccountScreen()));
                  },
                ),
                ListDataFontawesomeWidget(
                  icon: FontAwesomeIcons.houseChimneyUser,
                  title: Strings.visitsEsp,
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const MyVisitsHistory()));
                  },
                ),
                ListDataFontawesomeWidget(
                  icon: FontAwesomeIcons.fileInvoiceDollar,
                  title: Strings.billing,
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => Billing()));
                  },
                ),

                /* ListDataWidget(
                  icon: 'assets/images/icon/settings.png',
                  title: Strings.billing,
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const Billing()));
                  },
                ),*/
                ListDataWidget(
                  icon: 'assets/images/icon/help.png',
                  title: Strings.helpSupport,
                  onTap: () {
                    /*Navigator.of(context).pop();
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
                        MessagingScreen()));*/
                  },
                ),
                ListDataFontawesomeWidget(
                  icon: FontAwesomeIcons.peopleRobbery,
                  title: Strings.functionalAdult,
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => FunctionalAdultScreen()));
                  },
                ),
                ListDataFontawesomeWidget(
                  icon: FontAwesomeIcons.houseCircleCheck,
                  title: Strings.hired,
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const SignInScreen()));
                  },
                ),
                ListDataFontawesomeWidget(
                  icon: FontAwesomeIcons.rightFromBracket,
                  title: Strings.signOut,
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const SignInScreen()));
                  },
                ),
                ListDataFontawesomeWidget(
                  icon: FontAwesomeIcons.houseCircleCheck,
                  title: Strings.rental_history,
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Rental_History()));
                  },
                ),
              ],
            ),
          ),
        ),
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
                          'assets/images/lorem-image.jpeg',
                          height: MediaQuery.of(context).size.height * 0.6,
                          width: MediaQuery.of(context).size.width,
                        ),
                        onTap: () => {},
                      ),
                    ),
                    /*Positioned(
                      top: MediaQuery.of(context).size.height * 0.12,
                      right: 0,
                      child: Column(
                        children: [
                          circularButtonWidget(context, const Plumbing()),
                          const SizedBox(
                            height: Dimensions.heightSize * 2,
                          ),
                          circularButtonWidget(context, const Locksmithment()),
                          const SizedBox(
                            height: Dimensions.heightSize * 2,
                          ),
                          circularButtonWidget(context, const Cleaning()),
                          const SizedBox(
                            height: Dimensions.heightSize * 2,
                          ),
                          circularButtonWidget(context, const Removals()),
                          const SizedBox(
                            height: Dimensions.heightSize * 2,
                          ),
                        ],
                      ),
                    ),

                    // TODO: revisar
                    Positioned(
                      bottom: 30,
                      child: circularButtonWidget(context,  go(context)),
                      ),*/

                    const Positioned(
                        right: 0,
                        bottom: 30,
                        child: Padding(
                            padding: EdgeInsets.only(
                                left: Dimensions.marginSize,
                                right: Dimensions.marginSize),
                            child: FilterButtonWidget(
                              icon: Icon(FontAwesomeIcons.filter),
                            ))),

                    _menuWidget(context),
                  ],
                ),

                const SizedBox(
                  height: Dimensions.heightSize,
                ),
                _bannerWidget(context),
                // SecondaryButtonWidget(
                //     title: "Ver más",
                //       onTap: () {
                //       Navigator.of(context).push(MaterialPageRoute(builder:
                //       (context) => const MoreInfo()));
                //     },
                //   ),
                const SizedBox(
                  height: Dimensions.heightSize * 1,
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.08,
                      right: MediaQuery.of(context).size.width * 0.08),
                  child: SecondaryButtonWidget(
                    title: "Reserva visita ahora",
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const Booking()));
                    },
                  ),
                ),

                SizedBox(height: MediaQuery.of(context).size.height * 0.02),

                Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.08,
                      right: MediaQuery.of(context).size.width * 0.08),
                  child: PrimaryButtonWidget(
                    title: "Programar visita",
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const BookYourVisit()));
                    },
                  ),
                ),
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
    return Padding(
      padding: const EdgeInsets.only(
          left: Dimensions.marginSize,
          right: Dimensions.marginSize,
          top: Dimensions.heightSize),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.06,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(color: CustomColor.accentColor.withOpacity(0.3))
          ],
          borderRadius: BorderRadius.circular(10),
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
                  Icons.menu,
                  color: CustomColor.accentColor,
                ),
              ),
              onTap: () {
                if (scaffoldKey.currentState.isDrawerOpen) {
                  return scaffoldKey.currentState.openEndDrawer();
                } else {
                  return scaffoldKey.currentState.openDrawer();
                }
              },
            ),
            const SizedBox(
              width: Dimensions.widthSize,
            ),
            Expanded(
              child: Container(
                alignment: Alignment.center,
                height: MediaQuery.of(context).size.height * 0.04,
                child: TextFormField(
                  style: CustomStyle.textStyle,
                  controller: searchController,
                  keyboardType: TextInputType.text,
                  validator: (String value) {
                    if (value.isEmpty) {
                      return Strings.pleaseFillOutTheField;
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                    hintText: Strings.searchResult,
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 5.0, horizontal: 20.0),
                    labelStyle: CustomStyle.textStyle,
                    filled: true,
                    fillColor: Colors.white,
                    hintStyle: CustomStyle.textStyle,
                    focusedBorder: CustomStyle.searchBox,
                    enabledBorder: CustomStyle.searchBox,
                    focusedErrorBorder: CustomStyle.searchBox,
                    errorBorder: CustomStyle.searchBox,
                    suffixIcon: const Icon(
                      Icons.search,
                      size: 20,
                      color: CustomColor.accentColor,
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
                  Icons.drafts,
                  color: CustomColor.accentColor,
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
    );
  }

  _bannerWidget(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: MediaQuery.of(context).size.width * 0.05,
        right: MediaQuery.of(context).size.width * 0.05,
      ),
      child: Container(
          height: MediaQuery.of(context).size.height * 0.25,
          decoration: BoxDecoration(
            border: Border.all(color: CustomColor.primaryColor),
            borderRadius: BorderRadius.circular(12),
          ),
          child: (Image.asset(
            'assets/images/hegga_logo_1a.png',
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.fitWidth,
          ))),
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
