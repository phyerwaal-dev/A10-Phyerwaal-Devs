import 'package:busapp/data/stops.dart';
import 'package:busapp/screens/bookticket.dart';
import 'package:flutter/material.dart';

class BusData extends StatefulWidget {
  @override
  _BusDataState createState() => _BusDataState();
}

class _BusDataState extends State<BusData> {
  @override
  void initState() {
    super.initState();
    print(stops[0]["name"]);
  }

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
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(15.00, 50.0, 0.0, 0.0),
                child: Text(
                  'Bus Info',
                  style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Rubik",
                      color: Colors.black),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(20, 60, 0.0, 0.0),
                child: Text(
                  'Bus Name(this is a place holder)',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Rubik',
                      color: Colors.black),
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
                            backgroundColor: Colors.purple[300],
                            radius: 25,
                            child: Icon(Icons.location_on,
                                size: 30, color: Colors.white),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Location",
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
                          color: Colors.purple[50]),
                      child: Row(
                        children: [
                          Text(
                            "Location",
                            style: TextStyle(
                                color: Colors.purple[400],
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
                margin: EdgeInsets.only(top: 20, bottom: 10.0),
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
                            child: Icon(Icons.people,
                                size: 30, color: Colors.white),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Passanger Count",
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
                            "20",
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
                margin: EdgeInsets.only(top: 20, bottom: 10.0),
                padding: EdgeInsets.only(left: 10, right: 10),
                height: size.width * 0.4,
                //width: size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.pink[200],
                                radius: 25,
                                child: Icon(Icons.radio_button_on_sharp,
                                    size: 30, color: Colors.white),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Stops",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: "Rubik",
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Container(
                        width: size.width,
                        height: 100,
                        child: GridView.builder(
                            itemCount: stops.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 4),
                            itemBuilder: (context, index) {
                              return Align(
                                alignment: Alignment.center,
                                child: Container(
                                  margin: EdgeInsets.all(2),
                                  padding: EdgeInsets.all(2),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: stops[index]["status"] != "No"
                                        ? Colors.grey[200]
                                        : Colors.purple[50],
                                  ),
                                  height: 50,
                                  child: Text(
                                    stops[index]['name'],
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "Rubik"),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              );
                            }))
                  ],
                ),
              ),
              Spacer(),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => BookTicket(),
                  ));
                  // validate();
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 50,
                  //width: size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.black,
                  ),
                  child: Text(
                    "Book Ticket",
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
