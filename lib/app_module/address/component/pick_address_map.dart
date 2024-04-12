import 'dart:async';
import 'dart:convert';
import 'package:bomjour/app_module/address/controller/address_controller.dart';
import 'package:uuid/uuid.dart';
import 'package:http/http.dart' as http;
import 'package:bomjour/utils/app_common_widgets/app_button.dart';
import 'package:bomjour/utils/app_common_widgets/app_text.dart';
import 'package:bomjour/utils/app_common_widgets/app_text_field.dart';
import 'package:bomjour/utils/app_constants/app_config.dart';
import 'package:bomjour/utils/app_constants/app_images.dart';
import 'package:bomjour/utils/app_constants/localization.dart';
import 'package:bomjour/utils/app_themes/app_colors.dart';
import 'package:bomjour/utils/dark_theme_provider/dark_theme.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'dart:ui' as ui;
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PickAddressMap extends StatefulWidget {
  PickAddressMap({Key? key}) : super(key: key);

  @override
  State<PickAddressMap> createState() => _PickAddressMapState();
}

class _PickAddressMapState extends State<PickAddressMap> {
  late GoogleMapController _controller;
  String location = "";

  CameraPosition? cameraPosition;
  late Position currentLocation;
  var geoLocator = Geolocator();
  void locationPosition() async {
    await Geolocator.checkPermission();
    await Geolocator.requestPermission();
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    currentLocation = position;
    LatLng latlatPostion = LatLng(position.latitude, position.longitude);
    CameraPosition cameraPositions =
    CameraPosition(target: latlatPostion, zoom: 16);
    _controller.animateCamera(CameraUpdate.newCameraPosition(cameraPositions));
  }

  var controllerLoc = TextEditingController();

  final dropOffFocus = FocusNode();

  String _sessionToken2 = '12345';
  var uuid = Uuid();
  bool isListViewOpenDropOf = false;
  List<dynamic> placesListDropOf = [];
  Timer? _debounce;

  void onChangeDropOff() {
    if (_sessionToken2 == null || _sessionToken2.isEmpty) {
      setState(() {
        _sessionToken2 = uuid.v4();
      });
    }
    if (controllerLoc.text.isNotEmpty) {
      setState(() {
        getSuggestionDrop(controllerLoc.text);
      });
    }
  }

  String status = "";

  void getSuggestionDrop(String input) async {
    String baseURL = 'https://maps.googleapis.com/maps/api/place/autocomplete/json';
    String request =
        '$baseURL?input=$input&key=AIzaSyAysRadDCKNl8GCE25tLN8bTOe2Y9HoLCE&sessiontoken=$_sessionToken2';

    var response = await http.get(Uri.parse(request));
    var data = response.body.toString();
    debugPrint('data:::::::::${data}');
    if (response.statusCode == 200) {
      setState(() {
        placesListDropOf = jsonDecode(response.body.toString())['predictions'];
        status = jsonDecode(response.body.toString())['status'];
        print("This is status$status");
      });
    } else {
      print("Error fetching suggestions");
      throw Exception();
    }
  }

  @override
  void initState() {
    controllerLoc.addListener(() {
      if (_debounce?.isActive ?? false) _debounce?.cancel();
      _debounce = Timer(const Duration(milliseconds: 300), () {
        onChangeDropOff();
      });
    });
    super.initState();
    locationPosition();
  }

  void moveCameraToPlace(double latitude, double longitude) {
    LatLng targetLocation = LatLng(latitude, longitude);
    CameraPosition cameraPosition = CameraPosition(target: targetLocation, zoom: 16);
    _controller.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
  }

  Future<LatLng?> getLatLngFromAddress(String address) async {
    try {
      List<Location> locations = await locationFromAddress(address);
      if (locations.isNotEmpty) {
        return LatLng(locations.first.latitude, locations.first.longitude);
      }
    } catch (e) {
      print("Error: $e");
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final isKeyBoard = MediaQuery.of(context).viewInsets.bottom != 0;
    final themeChange = Provider.of<ThemeLocalizationProvider>(context);
    final addressController = Provider.of<AddressController>(context);
    return Directionality(
      textDirection:
      themeChange.locale.languageCode == "en" ? ui.TextDirection.ltr : ui.TextDirection.rtl,
      child: Scaffold(
        body: Stack(
          children: [
            Column(
              children: [
                Container(
                  width: double.infinity,
                  color: themeChange.darkTheme
                      ? AppLightColors.textField_back_dark
                      : AppLightColors.white_color,
                  child: Column(
                    children: [
                      SizedBox(height: AppConfig(context).height * 0.06),
                      Directionality(
                        textDirection: themeChange.locale.languageCode == "en"
                            ? ui.TextDirection.ltr
                            : ui.TextDirection.ltr,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Container(
                                      height: 15,
                                      width: 10,
                                      color: Colors.transparent,
                                      child: SvgPicture.asset(
                                        "assets/icons/left.svg",
                                        color: themeChange.darkTheme
                                            ? AppLightColors.white_color
                                            : AppLightColors.black_color,
                                      ))),
                              AppText(
                                text: AppLocalizations.of(context).addNewAddress,
                                size: 16,
                                fontWeight: FontWeight.w600,
                                color: Theme.of(context).primaryColor,
                              ),
                              Container()
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: double.infinity,
                        height: 76,
                        color: themeChange.darkTheme
                            ? AppLightColors.textField_back_dark
                            : AppLightColors.profileBackColor,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: Center(
                            child: appField(
                                context: context,
                                hint: "Hotel Bultaan near sky view",
                                border: themeChange.darkTheme
                                    ? AppLightColors.black_color
                                    : AppLightColors.border_color,
                                borderRadius: BorderRadius.circular(100),
                                onChange: (value) {
                                  setState(() {
                                    if (controllerLoc.text.isNotEmpty) {
                                      isListViewOpenDropOf = true;
                                      setState(() {});
                                    } else {
                                      isListViewOpenDropOf = false;
                                    }
                                  });
                                },
                                isPrefix: true,
                                fillColor: themeChange.darkTheme
                                    ? AppLightColors.textField_back_dark
                                    : AppLightColors.white_color,
                                textInputAction: TextInputAction.done,
                                controller: controllerLoc,
                                child1: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 16, right: 16, bottom: 3, top: 5),
                                  child: SvgPicture.asset(
                                    AppImages.search_icon,
                                    color: AppLightColors.border_color,
                                  ),
                                )),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Stack(
                    children: [
                      GoogleMap(
                        initialCameraPosition: const CameraPosition(
                          target: LatLng(48.8561, 2.2930),
                          zoom: 13.0,
                        ),
                        myLocationEnabled: true,
                        zoomGesturesEnabled: true,
                        zoomControlsEnabled: false,
                        mapToolbarEnabled: false,
                        myLocationButtonEnabled: false,
                        onMapCreated: (GoogleMapController controller) {
                          _controller = controller;
                          locationPosition();
                        },
                        onCameraMove: (CameraPosition cameraPositiona) {
                          cameraPosition = cameraPositiona;
                        },
                        onCameraIdle: () async {
                          List<Placemark> placemarks = await placemarkFromCoordinates(
                              cameraPosition!.target.latitude,
                              cameraPosition!.target.longitude);
                          setState(() {
                            addressController.updateLat(cameraPosition!.target.latitude.toString());
                            addressController.updateLng(cameraPosition!.target.longitude.toString());
                            controllerLoc.text = placemarks.first.administrativeArea.toString() +
                                ", " +
                                placemarks.first.street.toString() +
                                ", " +
                                placemarks.first.subLocality.toString() +
                                ", " +
                                placemarks.first.locality.toString();
                          });
                        },
                      ),
                      Positioned(
                          top: AppConfig(context).height * 0.06,
                          right: AppConfig(context).width * 0.03,
                          child: InkWell(
                              onTap: () {
                                locationPosition();
                                setState(() {});
                              },
                              child: CircleAvatar(
                                radius: 22,
                                backgroundColor: AppLightColors.primary_color,
                                child: Icon(
                                  Icons.location_searching,
                                  color: AppLightColors.white_color,
                                ),
                              ))),
                      Center(
                        // picker image on google map
                        child: InkWell(
                            onTap: () {
                              location;
                              print(location);
                            },
                            child: Icon(
                              Icons.location_on,
                              color: Colors.red,
                              size: AppConfig(context).height * 0.04,
                            )),
                      )
                    ],
                  ),
                ),
                isKeyBoard
                    ? SizedBox.shrink()
                    : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  child: AppButton(
                      buttonName: AppLocalizations.of(context).Add,
                      onTap: () {
                        Navigator.pop(context);
                        setState(() {
                          addressController.addressCon.text=controllerLoc.text;
                        });
                      }),
                )
              ],
            ),
            Positioned(
                top: 160,
                right: 16,
                left: 16,
                child: status == "ZERO_RESULTS"
                    ? SizedBox.shrink()
                    : isListViewOpenDropOf
                    ? Container(
                  height: AppConfig(context).height * 0.3,
                  width: AppConfig(context).width,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: themeChange.darkTheme
                          ? AppLightColors.black_color
                          : AppLightColors.border_color,
                    ),
                    borderRadius: BorderRadius.circular(10),
                    color: themeChange.darkTheme
                        ? AppLightColors.textField_back_dark
                        : Colors.white,
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            primary: false,
                            itemCount: placesListDropOf.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () async {

                                  String address = placesListDropOf[index]['description'];
                                  LatLng? latLng = await getLatLngFromAddress(address);
                                  addressController.updateLat(latLng?.latitude.toString());
                                  addressController.updateLng(latLng?.longitude.toString());

                                  if (latLng != null) {
                                    moveCameraToPlace(
                                        latLng.latitude, latLng.longitude);
                                  } else {
                                    print("Unable to get LatLng from address");
                                  }
                                  setState(() {
                                    isListViewOpenDropOf=false;
                                    addressController.addressCon.text=placesListDropOf[index]['description'];
                                    controllerLoc.text=placesListDropOf[index]['description'];
                                  });
                                },
                                child: Container(
                                  color: Colors.transparent,
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 16, vertical: 12),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        CircleAvatar(
                                          radius: 12,
                                          backgroundColor: AppLightColors.primary_color,
                                          child: Icon(
                                            Icons.location_on_rounded,
                                            color: AppLightColors.white_color,
                                            size: AppConfig(context).height * 0.014,
                                          ),
                                        ),
                                        SizedBox(
                                          width: AppConfig(context).width * 0.02,
                                        ),
                                        Expanded(
                                          child: AppText(
                                            text: placesListDropOf[index]['description'],
                                            size: 14,
                                            fontWeight: FontWeight.w400,
                                            color: Theme.of(context).primaryColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }),
                      )
                    ],
                  ),
                )
                    : SizedBox.shrink())
          ],
        ),
      ),
    );
  }
}
