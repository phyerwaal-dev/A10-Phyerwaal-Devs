import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:qr_flutter/qr_flutter.dart';

class Booking extends StatefulWidget {
  @override
  _BookingState createState() => _BookingState();
}

class _BookingState extends State<Booking> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    // padding: EdgeInsets.fromLTRB(15.00, 30.0, 0.0, 0.0),
                    child: Text(
                      'Your QR Code',
                      style: TextStyle(
                          fontSize: 32.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Rubik",
                          color: Colors.black),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Center(
                    child: QrImage(
                      data: "1234567890",
                      version: QrVersions.auto,
                      size: 200.0,
                    ),
                  ),
                  // Container(
                  //   margin: EdgeInsets.only(top: 10, bottom: 10.0),
                  //   padding: EdgeInsets.only(left: 3, right: 3),
                  //   height: 175,
                  //   //width: size.width,
                  //   decoration: BoxDecoration(
                  //       borderRadius: BorderRadius.circular(8),
                  //       color: Colors.white),
                  //   child: QrCode(),
                  // ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    padding: EdgeInsets.only(left: 5, right: 5),
                    height: 50,
                    //width: size.width,
                    child: Text(
                      "Ask your conductor to scan the above code",
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: "Rubik",
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10, bottom: 10.0),
                    padding: EdgeInsets.only(left: 10, right: 10),
                    height: 75,
                    //width: size.width,
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
                              CircleAvatar(
                                backgroundColor: Colors.purple[400],
                                radius: 25,
                                child: Icon(Icons.account_circle,
                                    size: 30, color: Colors.white),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                width: 150,
                                child: Text(
                                  "Name",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: "Rubik",
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin:
                              EdgeInsets.only(top: 10, bottom: 10, left: 19),
                          padding: EdgeInsets.only(left: 10, right: 10),
                          height: 30,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.pink[50]),
                          child: Row(
                            children: [
                              Text(
                                "User Name",
                                style: TextStyle(
                                    color: Colors.purple[400],
                                    fontFamily: "Rubik",
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10, bottom: 10.0),
                    padding: EdgeInsets.only(left: 10, right: 10),
                    height: 75,
                    //width: size.width,
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
                              CircleAvatar(
                                backgroundColor: Colors.orange[400],
                                radius: 25,
                                child: Text(
                                  '\u{20B9}',
                                  //Icon(Icons.currency,
                                  style: TextStyle(
                                      fontSize: 30, color: Colors.white),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Fare",
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
                          margin:
                              EdgeInsets.only(top: 10, bottom: 10, left: 19),
                          padding: EdgeInsets.only(left: 10, right: 10),
                          height: 30,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.orange[50]),
                          child: Row(
                            children: [
                              Text(
                                "20 \u{20B9}", //\u{20B9} is used for rupee symbol
                                style: TextStyle(
                                    color: Colors.orange[400],
                                    fontFamily: "Rubik",
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    padding: EdgeInsets.only(left: 10, right: 10),
                    height: 75,
                    //width: size.width,
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
                              CircleAvatar(
                                backgroundColor: Color(0xFF07e092),
                                radius: 25,
                                child: Icon(Icons.hourglass_bottom,
                                    size: 30, color: Colors.white),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Time",
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
                          margin:
                              EdgeInsets.only(top: 10, bottom: 10, left: 19),
                          padding: EdgeInsets.only(left: 10, right: 10),
                          height: 30,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Color(0xFFCDFFED)),
                          child: Row(
                            children: [
                              Text(
                                "20 \u{20B9}", //\u{20B9} is used for rupee symbol
                                style: TextStyle(
                                    color: Color(0xFF07e092),
                                    fontFamily: "Rubik",
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
