// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:howse_app/screens/dashboard/booking.dart';
import 'package:howse_app/screens/servicesAviable/cleaning.dart';
import 'package:howse_app/screens/servicesAviable/removals.dart';

import 'package:howse_app/utils/custom_color.dart';
import 'package:howse_app/utils/custom_style.dart';
import 'package:howse_app/utils/dimensions.dart';
import 'package:howse_app/utils/strings.dart';
import 'package:howse_app/widgets/drawer_header_widget.dart';
import 'package:howse_app/widgets/list_data_widget.dart';
import 'package:howse_app/screens/auth/sign_in_screen.dart';

import '../../widgets/circle_button_widget.dart';
import '../../widgets/primary_button_widget.dart';
import '../../widgets/secondary_button_widget.dart';
import '../servicesAviable/locksmithment.dart';
import '../servicesAviable/plumbing.dart';
import 'more_info.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

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
            color: CustomColor.primaryColor,
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
                ListDataWidget(
                  icon: 'assets/images/icon/coupon.png',
                  title: Strings.myCoupon,
                  onTap: () {
                    /*Navigator.of(context).pop();
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
                        MyCouponScreen()));*/
                  },
                ),
                ListDataWidget(
                  icon: 'assets/images/icon/wallet.png',
                  title: Strings.myWallet,
                  onTap: () {
                    /*Navigator.of(context).pop();
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
                        MyWalletScreen()));*/
                  },
                ),
                ListDataWidget(
                  icon: 'assets/images/icon/settings.png',
                  title: Strings.changePassword,
                  onTap: () {
                    /*Navigator.of(context).pop();
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
                        ChangePasswordScreen
                          ()));*/
                  },
                ),
                ListDataWidget(
                  icon: 'assets/images/icon/help.png',
                  title: Strings.helpSupport,
                  onTap: () {
                    /*Navigator.of(context).pop();
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
                        MessagingScreen()));*/
                  },
                ),
                ListDataWidget(
                  icon: 'assets/images/icon/logout.png',
                  title: Strings.signOut,
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const SignInScreen()));
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
                        child: Image.asset('assets/images/lorem-image.jpeg',
                        height: MediaQuery.of(context).size.height * 0.6,
                        width: MediaQuery.of(context).size.width,),
                        onTap: () => print('hola'),
                      ),
                    ),
                    Positioned(
                      top: MediaQuery.of(context).size.height * 0.12,
                      right: 0,
                      child: Column(
                        children: [
                          circularButtonWidget(context, const Plumbing() ),
                          const SizedBox(height: Dimensions.heightSize * 2,),
                          circularButtonWidget(context, const Locksmithment()),
                          const SizedBox(height: Dimensions.heightSize * 2,),
                          circularButtonWidget(context, const Cleaning()),
                          const SizedBox(height: Dimensions.heightSize * 2,),
                          circularButtonWidget(context, const Removals()),
                          const SizedBox(height: Dimensions.heightSize * 2,),
                          
                        ],
                      ),
                    ),

                    // TODO: revisar
                    Positioned(
                      bottom: 30,
                      child: circularButtonWidget(context,  go(context)),
                      ),
                    
                    _menuWidget(context),
                      
                  ],
                  
                ),
                 
                    const SizedBox(height: Dimensions.heightSize,),
                    _bannerWidget(context),
                    const SizedBox(height: Dimensions.heightSize * 3,),
                    // SecondaryButtonWidget(
                    //     title: "Ver más",
                    //       onTap: () {
                    //       Navigator.of(context).push(MaterialPageRoute(builder:
                    //       (context) => const MoreInfo()));
                    //     },
                    //   ),
                    const SizedBox(height: Dimensions.heightSize * 3,),
                    Padding(
                      padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.1,
                        right: MediaQuery.of(context).size.width * 0.1
                      ),
                      child: SecondaryButtonWidget(
                          title: "Reseva visita ahora",
                            onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(builder:
                            (context) => const Booking()));
                          },
                        ),
                    ),

                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),

                    Padding(
                      padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.1,
                      right: MediaQuery.of(context).size.width * 0.1
                    ),
                      child: PrimaryButtonWidget(
                        title: "Programar visita",
                          onTap: () {
                          /*Navigator.of(context).push(MaterialPageRoute(builder:
                          (context) => const SignUpScreen10()));*/
                        },
                      ),
                    ),
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

  _locationWidget(BuildContext context) {
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
  }

  _menuWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: Dimensions.marginSize,
        right: Dimensions.marginSize,
        top: Dimensions.heightSize
      ),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.07,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: CustomColor.accentColor.withOpacity(0.3)
            )
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
                if(scaffoldKey.currentState.isDrawerOpen) {
                  return scaffoldKey.currentState.openEndDrawer();
                } else {
                  return scaffoldKey.currentState.openDrawer();
                }
              },
            ),
            const SizedBox(width: Dimensions.widthSize,),
            Expanded(
              child: TextFormField(
                style: CustomStyle.textStyle,
                controller: searchController,
                keyboardType: TextInputType.text,
                validator: (String value){
                  if(value.isEmpty){
                    return Strings.pleaseFillOutTheField;
                  }else{
                    return null;
                  }
                },
                decoration: InputDecoration(
                  hintText: Strings.searchResult,
                  contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
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
            const SizedBox(width: Dimensions.widthSize,),
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

  /*_discountBannerWidget(BuildContext context) {
    return Container(
      height: 180,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: DiscountList.list().length,
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          Discount discount = DiscountList.list()[index];
          return Padding(
            padding: const EdgeInsets.only(
              left: Dimensions.marginSize
            ),
            child: Container(
              height: 180,
              width: MediaQuery.of(context).size.width - 100,
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(Dimensions.radius),
                    child: Image.asset(
                      discount.image,
                      fit: BoxFit.cover,
                      height: 180,
                      width: MediaQuery.of(context).size.width - 100,
                    ),
                  ),
                  Container(
                    height: 180,
                    width: MediaQuery.of(context).size.width - 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius),
                      color: Colors.black.withOpacity(0.4),
                    ),
                  ),
                  Positioned(
                    bottom: Dimensions.heightSize,
                    left: Dimensions.marginSize,
                    child: Text(
                      'Get ${discount.discount}% off',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: Dimensions.extraLargeTextSize
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }*/

  /*_categoryWidget(BuildContext context) {
    return Container(
      height: 180,
      child: ListView.builder(
        itemCount: CategoryList.list().length,
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          Category category = CategoryList.list()[index];
          return Padding(
            padding: const EdgeInsets.only(
              left: Dimensions.marginSize,
              right: Dimensions.marginSize,
            ),
            child: GestureDetector(
              child: Container(
                child: Column(
                  children: [
                    Image.asset(
                      category.image
                    ),
                    const SizedBox(height: Dimensions.heightSize,),
                    Text(
                      category.name,
                      style: TextStyle(
                        color: CustomColor.accentColor,
                        fontWeight: FontWeight.bold,
                        fontSize: Dimensions.largeTextSize
                      ),
                    )
                  ],
                ),
              ),
              onTap: () {
                /*Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
                CategoryDetailsScreen(name: category.name,)));*/
              },
            ),
          );
        },
      ),
    );
  }*/

  _todayGroceryDealsWidget(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: Dimensions.marginSize,
            right: Dimensions.marginSize,
            bottom: Dimensions.heightSize
          ),
          child: Text(
            Strings.todayGroceryDeals,
            style: TextStyle(
              color: CustomColor.accentColor,
              fontSize: Dimensions.extraLargeTextSize,
              fontWeight: FontWeight.bold
            ),
          ),
        ),
        /*StaggeredGridView.countBuilder(
          crossAxisCount: 3,
          itemCount: GroceryList.list().length,
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            Grocery grocery = GroceryList.list()[index];
            return GestureDetector(
              child: Container(
                height: 120,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.grey.withOpacity(0.2)
                    )
                  ),
                  child: Stack(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Image.asset(
                            grocery.image
                          ),
                          const SizedBox(height: Dimensions.heightSize * 0.5,),
                          Text(
                            grocery.name,
                            style: const TextStyle(
                              color: CustomColor.accentColor,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: Dimensions.widthSize * 0.5,
                              right: Dimensions.widthSize * 0.5,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      '\$${grocery.oldPrice.toString()}',
                                      style: TextStyle(
                                        color: CustomColor.accentColor.withOpacity(0.8),
                                        decoration: TextDecoration.lineThrough,
                                          fontSize: Dimensions.smallTextSize
                                      ),
                                    ),
                                    const SizedBox(width: Dimensions.widthSize * 0.5,),
                                    Text(
                                      '\$${grocery.newPrice.toString()}',
                                      style: TextStyle(
                                        color: CustomColor.accentColor,
                                        fontWeight: FontWeight.bold,
                                          fontSize: Dimensions.smallTextSize
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.star,
                                      size: 15,
                                      color: Colors.orange,
                                    ),
                                    Text(
                                      '\$${grocery.rating.toString()}',
                                      style: TextStyle(
                                          color: CustomColor.accentColor.withOpacity(0.8),
                                          decoration: TextDecoration.lineThrough,
                                        fontSize: Dimensions.smallTextSize
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const Positioned(
                        right: Dimensions.marginSize * 0.5,
                        top: Dimensions.heightSize * 0.5,
                        child: Icon(
                          Icons.favorite_border,
                          size: 18,
                          color: Colors.grey,
                        ),
                      )
                    ],
                  )
              ),
              onTap: () {
                /*Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
                GroceryDetailsScreen(grocery: grocery,)));*/
              },
            );
          },
          /*staggeredTileBuilder: (int index) =>
          StaggeredTile.fit(1),
          mainAxisSpacing: 0.0,
          crossAxisSpacing: 0.0,*/
        ),*/
      ],
    );
  }

  _bannerWidget(BuildContext context) {
    return Image.asset(
      'assets/images/hegga_logo_1a.png',
      width: MediaQuery.of(context).size.width,
      fit: BoxFit.fitWidth,
    );
  }

  _groceryMemberDealsWidget(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
              left: Dimensions.marginSize,
              right: Dimensions.marginSize,
              bottom: Dimensions.heightSize
          ),
          child: Text(
            Strings.groceryMemberDeals,
            style: TextStyle(
                color: CustomColor.accentColor,
                fontSize: Dimensions.extraLargeTextSize,
                fontWeight: FontWeight.bold
            ),
          ),
        ),
        /*StaggeredGridView.countBuilder(
          crossAxisCount: 3,
          itemCount: GroceryList.list().length,
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            Grocery grocery = GroceryList.list()[index];
            return Container(
                height: 120,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                        color: Colors.grey.withOpacity(0.2)
                    )
                ),
                child: Stack(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Image.asset(
                            grocery.image
                        ),
                        const SizedBox(height: Dimensions.heightSize * 0.5,),
                        Text(
                          grocery.name,
                          style: const TextStyle(
                              color: CustomColor.accentColor,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: Dimensions.widthSize * 0.5,
                            right: Dimensions.widthSize * 0.5,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    '\$${grocery.oldPrice.toString()}',
                                    style: TextStyle(
                                        color: CustomColor.accentColor.withOpacity(0.8),
                                        decoration: TextDecoration.lineThrough,
                                        fontSize: Dimensions.smallTextSize
                                    ),
                                  ),
                                  const SizedBox(width: Dimensions.widthSize * 0.5,),
                                  Text(
                                    '\$${grocery.newPrice.toString()}',
                                    style: TextStyle(
                                        color: CustomColor.accentColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: Dimensions.smallTextSize
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.star,
                                    size: 15,
                                    color: Colors.orange,
                                  ),
                                  Text(
                                    '\$${grocery.rating.toString()}',
                                    style: TextStyle(
                                        color: CustomColor.accentColor.withOpacity(0.8),
                                        decoration: TextDecoration.lineThrough,
                                        fontSize: Dimensions.smallTextSize
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const Positioned(
                      right: Dimensions.marginSize * 0.5,
                      top: Dimensions.heightSize * 0.5,
                      child: Icon(
                        Icons.favorite_border,
                        size: 18,
                        color: Colors.grey,
                      ),
                    )
                  ],
                )
            );
          },
          /*staggeredTileBuilder: (int index) =>
              StaggeredTile.fit(1),
          mainAxisSpacing: 0.0,
          crossAxisSpacing: 0.0,*/
        ),*/
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
          Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
              page));
        },
      ),
    );
  }

//Menú flotante para reservas
  go(BuildContext context){

     return Padding(
      padding: const EdgeInsets.only(
          left: Dimensions.marginSize, right: Dimensions.marginSize),
      child: CircleButtonWidget(
        icon: const Icon(
          Icons.arrow_forward,
          color: CustomColor.whiteColor,
        ),
        onTap: () {
        
        },
      ),
    );
  }
    
}
