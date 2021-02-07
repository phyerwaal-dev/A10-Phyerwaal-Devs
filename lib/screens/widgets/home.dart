import 'dart:async';

import 'package:busapp/data/loc.dart';
import 'package:busapp/screens/buslist.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Completer<GoogleMapController> _controller = Completer();
  MapType _currentMapType = MapType.normal;
  double positionLat, positionLong;
  LatLng _center, lastKnownPosition;
  bool _loading = true;
  final Set<Marker> _markers = {};
  String startLoc = "";
  String endLoc = "";

  @override
  void initState() {
    super.initState();
    locationPermissionCheck();
    setMarkers();
    print("Inint");
  }

  setMarkers() {
    _markers.add(Marker(
        markerId: MarkerId(lastKnownPosition.toString()),
        position: LatLng(19.2147766, 72.9761107),
        infoWindow: InfoWindow(title: "Majiwada Bus Stop"),
        icon: BitmapDescriptor.defaultMarker));

    _markers.add(Marker(
        markerId: MarkerId(lastKnownPosition.toString()),
        position: LatLng(19.2142768, 72.9779733),
        infoWindow: InfoWindow(title: "Majiwada Naka"),
        icon: BitmapDescriptor.defaultMarker));

    _markers.add(Marker(
        markerId: MarkerId(lastKnownPosition.toString()),
        position: LatLng(19.2114232, 72.9757179),
        infoWindow: InfoWindow(title: "Gokul Nagar Bus Stop"),
        icon: BitmapDescriptor.defaultMarker));

    _markers.add(Marker(
        markerId: MarkerId(lastKnownPosition.toString()),
        position: LatLng(19.2107653, 72.9770193),
        infoWindow: InfoWindow(title: "Muktai Nagar Bus Stop"),
        icon: BitmapDescriptor.defaultMarker));

    _markers.add(Marker(
        markerId: MarkerId(lastKnownPosition.toString()),
        position: LatLng(19.2087306, 72.9730385),
        infoWindow: InfoWindow(title: "Viviana Mall Bus Stop"),
        icon: BitmapDescriptor.defaultMarker));
  }

  _onMapCreate(GoogleMapController controller) {
    _controller.complete(controller);
  }

  _onCameraMove(CameraPosition position) {
    lastKnownPosition = position.target;
  }

  void locationPermissionCheck() async {
    print("LOC");
    if (!kIsWeb) {
      final location = Location();
      final hasPermissions = await location.hasPermission();
      if (hasPermissions != PermissionStatus.granted) {
        await location.requestPermission();
      }
      setState(() {
        _loading = true;
      });
      final position = await location.getLocation();
      setState(() {
        _loading = false;
      });
      // var busLoc = await http.get(
      //     "https://maps.googleapis.com/maps/api/directions/json?origin=$positionLat,$positionLong&destination=transit&key=AIzaSyBOZvqUL0gErKcGNcYN8HtgMBB5KZg8as4");

      // print(busLoc.body);
      print(position);
      positionLat = position.latitude;
      positionLong = position.longitude;
      _center = new LatLng(positionLat, positionLong);
      lastKnownPosition = _center;
      print(_center);
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Servo Bus",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Rubik"),
              ),
              SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: new Text("Select Start Location"),
                          content: Container(
                            width: size.width * 0.8,
                            height: size.height * 0.35,
                            child: ListView.builder(
                                itemCount: loc.length,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      print(loc[index]);
                                      setState(() {
                                        startLoc = loc[index];
                                      });
                                      Navigator.of(context).pop();
                                    },
                                    child: Container(
                                      child: Column(
                                        children: [
                                          Text(
                                            loc[index],
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.normal,
                                                fontFamily: "Rubik",
                                                fontSize: 22),
                                          ),
                                          Divider()
                                        ],
                                      ),
                                    ),
                                  );
                                }),
                          ),
                          actions: <Widget>[
                            // usually buttons at the bottom of the dialog
                            new FlatButton(
                              child: new Text("Close"),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      });
                },
                child: Container(
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
                          color: Colors.purple,
                        ),
                        child: Icon(Icons.location_on, color: Colors.white),
                      ),
                      SizedBox(width: 20),
                      Container(
                        width: size.width * 0.5,
                        child: Text(
                            startLoc == "" ? "Start Location" : startLoc,
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
                ),
              ),
              GestureDetector(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: new Text("Select End Location"),
                          content: Container(
                            width: size.width * 0.8,
                            height: size.height * 0.35,
                            child: ListView.builder(
                                itemCount: dloc.length,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      print(dloc[index]);
                                      setState(() {
                                        endLoc = loc[index];
                                      });
                                      Navigator.of(context).pop();
                                    },
                                    child: Container(
                                      child: Column(
                                        children: [
                                          Text(
                                            dloc[index],
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.normal,
                                                fontFamily: "Rubik",
                                                fontSize: 22),
                                          ),
                                          Divider()
                                        ],
                                      ),
                                    ),
                                  );
                                }),
                          ),
                          actions: <Widget>[
                            // usually buttons at the bottom of the dialog
                            new FlatButton(
                              child: new Text("Close"),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      });
                },
                child: Container(
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
                          color: Colors.orangeAccent,
                        ),
                        child: Icon(Icons.location_on, color: Colors.white),
                      ),
                      SizedBox(width: 20),
                      Container(
                        width: size.width * 0.5,
                        child: Text(endLoc == "" ? "Start Location" : endLoc,
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
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                  height: size.height * 0.48,
                  width: size.width,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(8)),
                  child: !_loading
                      ? GoogleMap(
                          myLocationEnabled: true,
                          onMapCreated: _onMapCreate,
                          onCameraMove: _onCameraMove,
                          mapType: _currentMapType,
                          markers: _markers,
                          initialCameraPosition:
                              CameraPosition(target: _center, zoom: 15.0),
                        )
                      : Center(child: CircularProgressIndicator())),
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
                    color: Colors.black,
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
    );
  }
}

AlertDialog alert = AlertDialog(
  title: Text("Select Start Location"),
  content: ListView.builder(itemBuilder: null),
);

// void startLoc(BuildContext context) {
//   showDialog(context: context, builder: (BuildContext context))
// }

class LocationCard extends StatefulWidget {
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
  _LocationCardState createState() => _LocationCardState();
}

class _LocationCardState extends State<LocationCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: new Text("Select Start Location"),
                content: Container(
                  width: widget.size.width * 0.8,
                  height: widget.size.height * 0.35,
                  child: ListView.builder(
                      itemCount: loc.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            print(loc[index]);
                            // setState(() {
                            //   var startLoc = ""
                            // });
                            Navigator.of(context).pop();
                          },
                          child: Container(
                            child: Column(
                              children: [
                                Text(
                                  loc[index],
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.normal,
                                      fontFamily: "Rubik",
                                      fontSize: 22),
                                ),
                                Divider()
                              ],
                            ),
                          ),
                        );
                      }),
                ),
                actions: <Widget>[
                  // usually buttons at the bottom of the dialog
                  new FlatButton(
                    child: new Text("Close"),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            });
      },
      child: Container(
        height: 100,
        width: widget.size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: widget.iconBgColor,
              ),
              child: Icon(widget.leadingIcon, color: Colors.white),
            ),
            SizedBox(width: 20),
            Container(
              width: widget.size.width * 0.5,
              child: Text(widget.text,
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
      ),
    );
  }
}
