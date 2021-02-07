import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  double positionLat, positionLong;
  LatLng _center;
  @override
  void initState() {
    super.initState();
    locationPermissionCheck();
    // getLocation();
  }

  void locationPermissionCheck() async {
    if (!kIsWeb) {
      final location = Location();
      final hasPermissions = await location.hasPermission();
      if (hasPermissions != PermissionStatus.granted) {
        await location.requestPermission();
      }
      final position = await location.getLocation();
      positionLat = position.latitude;
      positionLong = position.longitude;
      _center = new LatLng(positionLat, positionLong);
      print("Lat: " +
          positionLat.toString() +
          "Long: " +
          positionLong.toString());
    }
  }

  Completer<GoogleMapController> _controller = Completer();
  MapType _currentMapType = MapType.normal;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "App Name",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Rubik"),
                ),
                SizedBox(height: 20),
                LocationCard(
                  size: size,
                  leadingIcon: Icons.location_on,
                  text: "Start Location",
                  iconBgColor: Colors.purple,
                ),
                LocationCard(
                  size: size,
                  leadingIcon: Icons.location_pin,
                  text: "Destination Location",
                  iconBgColor: Colors.orangeAccent,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                    height: size.height * 0.5,
                    width: size.width,
                    color: Colors.redAccent,
                   )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LocationCard extends StatelessWidget {
  const LocationCard({
    Key key,
    @required this.size,
    this.text,
    this.leadingIcon,
    this.iconBgColor,
  }) : super(key: key);

  final Size size;
  final String text;
  final IconData leadingIcon;
  final Color iconBgColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: iconBgColor,
            ),
            child: Icon(leadingIcon, color: Colors.white),
          ),
          SizedBox(width: 20),
          Container(
            width: size.width * 0.5,
            child: Text(text,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Rubik")),
          ),
          SizedBox(
            width: 20,
          ),
          Icon(
            Icons.arrow_forward_ios_rounded,
            size: 24,
            color: Colors.black,
          )
        ],
      ),
    );
  }
}
