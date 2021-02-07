import 'package:busapp/screens/businfo.dart';
import 'package:flutter/material.dart';

class BusList extends StatefulWidget {
  @override
  _BusListState createState() => _BusListState();
}

class _BusListState extends State<BusList> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          "View Buses",
          style: TextStyle(
              color: Colors.black,
              fontFamily: "Rubik",
              fontWeight: FontWeight.bold,
              fontSize: 22),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              GestureDetector(onTap: (){
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => BusInfo()
                ));
              },
                child: Container(
                  padding: EdgeInsets.all(8.0),
                  height: 75,
                  width: size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [

                      Container(

                        child: Row(
                          children: [
                            Icon(
                              Icons.bus_alert,
                              size: 22,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "123",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: "Rubik",
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                      Container(
                        // width: 200,
                        child: Row(
                          children: [
                            Icon(
                              Icons.location_on,
                              size: 22,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "Thane Station",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: "Rubik",
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                      Container(
                        child: Row(
                          children: [
                            Icon(
                              Icons.person,
                              size: 22,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "18",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: "Rubik",
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}
