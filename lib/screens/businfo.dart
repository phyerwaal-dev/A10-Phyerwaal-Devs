import 'dart:async';

import 'package:busapp/screens/buslist.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class BusInfo extends StatefulWidget {
  @override
  _BusInfoState createState() => _BusInfoState();
}

class _BusInfoState extends State<BusInfo> {
  double positionLat, positionLong;
  LatLng _center;
  @override

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
                  "Bus Info",
                  style: TextStyle(
                      color: Color(0xFF070417),
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Rubik"),
                ),
                SizedBox(height: 20),
                LocationCard(
                  size: size,
                  leadingIcon: Icons.location_on,
                  text: "Location",
                  iconBgColor: Colors.purple,
                ),

                LocationCard(
                  size: size,
                  leadingIcon: Icons.location_pin,
                  text: "Passenger Count",
                  iconBgColor: Colors.orangeAccent,
                ),
                SizedBox(
                  height: 20,
                ),

                SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => BusList(),
                    ));
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 50,
                    width: size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Color(0xFF070417),
                    ),
                    child: Text(
                      "View Bus",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Rubik"),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        currentIndex: 0, // this will be set when a new tab is tapped
        selectedItemColor: Colors.black,
        items: [
          BottomNavigationBarItem(
            icon: new Icon(
              Icons.bus_alert,
              size: 32,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: new Icon(
              Icons.home,
              size: 32,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.lock_clock,
              size: 32,
            ),
            label: "",
          )
        ],
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
