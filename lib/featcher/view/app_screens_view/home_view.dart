import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:runstore/featcher/core/colors/colors.dart';
import 'package:runstore/featcher/view/app_screens_view/search_view.dart';
import 'package:runstore/featcher/view/app_screens_view/tabbar_screens_view/all_view.dart';
import 'package:runstore/featcher/view/app_screens_view/tabbar_screens_view/kid_view.dart';
import 'package:runstore/featcher/view/app_screens_view/tabbar_screens_view/man_view.dart';
import 'package:runstore/featcher/view/app_screens_view/tabbar_screens_view/woman_view.dart';
import 'package:runstore/featcher/view/widgets/custom_text.dart';
import 'package:runstore/featcher/view_model/get_data_user_view_model.dart';
import 'package:runstore/utils/locale/language_all.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  static String addressName = '';
  static String cityName = '';
  static String zipCode = '';
  static String stateName = '';

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  String location ='Null, Press Button';
  String Address = 'search';
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        body: GetBuilder<DataUser>(
            init: DataUser(),
            builder: (controller) {
              return Container(
                height: double.infinity,
                width: double.infinity,
                color: ColorSelect.scaffoldBackgroundColorCatagories,
                child: Column(
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    ListTile(
                      leading: Container(
                        height: 48,
                        width: 48,
                      ),
                      title: CustomText(
                        text:
                            '${StringKey.hi.tr}, ${FirebaseAuth.instance.currentUser?.displayName}!',
                        color: ColorSelect.textColor,
                        fontsize: 17,
                        textAlign: TextAlign.center,
                        fontWeight: FontWeight.w600,
                        textOverflow: TextOverflow.clip,
                        height: 0.0,
                      ),
                      trailing: InkWell(
                        onTap: () => Get.to(() => SearchView()),
                        child: Container(
                          height: 48,
                          width: 48,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                            color: ColorSelect.whiteColor,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.15),
                                spreadRadius: 0,
                                blurRadius: 10,
                                offset: Offset(0, 0.75),
                              ),
                            ],
                          ),
                          child: Icon(
                            Icons.search_outlined,
                            color: ColorSelect.blackColor,
                            size: 30,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 45,
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.7893,
                        child: TabBar(
                          physics: BouncingScrollPhysics(),
                          indicatorSize: TabBarIndicatorSize.tab,
                          indicator: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: ColorSelect.whiteColor,
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 6,
                                  color:
                                      ColorSelect.blackColor.withOpacity(0.3))
                            ],
                          ),
                          unselectedLabelColor: Colors.grey,
                          labelColor: ColorSelect.blackColor,
                          tabs: [
                            Tab(
                              child: CustomText(
                                text: StringKey.all.tr,
                                color: ColorSelect.blackColor,
                                fontsize: 12,
                                textAlign: TextAlign.center,
                                fontWeight: FontWeight.w400,
                                textOverflow: TextOverflow.clip,
                                height: 0.0,
                              ),
                            ),
                            Tab(
                              child: CustomText(
                                text: StringKey.men.tr,
                                color: ColorSelect.blackColor,
                                fontsize: 12,
                                textAlign: TextAlign.center,
                                fontWeight: FontWeight.w400,
                                textOverflow: TextOverflow.clip,
                                height: 0.0,
                              ),
                            ),
                            Tab(
                              child: CustomText(
                                text: StringKey.women.tr,
                                color: ColorSelect.blackColor,
                                fontsize: 12,
                                textAlign: TextAlign.center,
                                fontWeight: FontWeight.w400,
                                textOverflow: TextOverflow.clip,
                                height: 0.0,
                              ),
                            ),
                            Tab(
                              child: CustomText(
                                text: StringKey.kid.tr,
                                color: ColorSelect.blackColor,
                                fontsize: 12,
                                textAlign: TextAlign.center,
                                fontWeight: FontWeight.w400,
                                textOverflow: TextOverflow.clip,
                                height: 0.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 24),
                        child: TabBarView(
                          physics: BouncingScrollPhysics(),
                          children: [
                            // first tab bar view widget
                            AllView(), 
                            // second tab bar viiew widget
                            ManView(),
                            // third tab bar view widget
                            WomenView(),
                            // forth tab bar view widget
                            KidView(),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }

  askPermission() async{
    PermissionStatus status = await Permission.locationAlways.request();
   
    if(status.isDenied == true)
      {
        askPermission();
      }
    else
      {
        return true;
      }
  }

  // ignore: unused_element
  Future<Position> _getGeoLocationPosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      await Geolocator.openLocationSettings();
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
    return await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  }

  Future<void> GetAddressFromLatLong() async {
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high , forceAndroidLocationManager: true);
    List<Placemark> placemarks = await placemarkFromCoordinates(position.latitude, position.longitude);
    print(placemarks);
    print(placemarks.length);
    Placemark place;
    placemarks.length == 1  ? place = placemarks[0] : place = placemarks[1];
    Address = '${place.street}, ${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';
    HomeView.addressName = place.name!;
    HomeView.cityName = place.country!;
    HomeView.stateName = place.subLocality!;
    HomeView.zipCode = place.postalCode!;
  }

}
