import 'package:busapp/screens/booking.dart';
import 'package:flutter/material.dart';

class BookTicket extends StatefulWidget {
  @override
  _BookTicketState createState() => _BookTicketState();
}

class _BookTicketState extends State<BookTicket> {
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
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                // padding: EdgeInsets.fromLTRB(15.00, 30.0, 0.0, 0.0),
                child: Text(
                  'Book A Ticket',
                  style: TextStyle(
                      fontSize: 32.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Rubik",
                      color: Colors.black),
                ),
              ),
              SizedBox(
                height: size.height * 0.1,
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
                            backgroundColor: Colors.purple[200],
                            radius: 25,
                            child: Icon(Icons.location_on,
                                size: 30, color: Colors.white),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            width: 150,
                            child: Text(
                              "Start Location",
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
                      margin: EdgeInsets.only(top: 10, bottom: 10, left: 19),
                      padding: EdgeInsets.only(left: 10, right: 10),
                      height: 30,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.pink[50]),
                      child: Row(
                        children: [
                          Text(
                            "Current Location",
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
                            backgroundColor: Colors.pink[200],
                            radius: 25,
                            child: Icon(Icons.location_on,
                                size: 30, color: Colors.white),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            width: 150,
                            child: Text(
                              "End Location",
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
                      margin: EdgeInsets.only(top: 10, bottom: 10, left: 19),
                      padding: EdgeInsets.only(left: 10, right: 10),
                      height: 30,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.pink[50]),
                      child: Row(
                        children: [
                          Text(
                            "Destination",
                            style: TextStyle(
                                color: Colors.pink[400],
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
                            backgroundColor: Colors.orange[200],
                            radius: 25,
                            child: Text(
                              '\u{20B9}',
                              //Icon(Icons.currency,
                              style:
                                  TextStyle(fontSize: 30, color: Colors.white),
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
                      margin: EdgeInsets.only(top: 10, bottom: 10, left: 19),
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
              Spacer(),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => Booking(),
                  ));
                  // validate();
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
                    "Proceed To Pay",
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
