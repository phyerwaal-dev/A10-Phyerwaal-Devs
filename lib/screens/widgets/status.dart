import 'package:flutter/material.dart';

class Status extends StatefulWidget {
  @override
  _StatusState createState() => _StatusState();
}

class _StatusState extends State<Status> {
  @override
  Widget build(BuildContext context) {
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
        child: Padding(padding: EdgeInsets.all(20.0), child: Text("AV")),
      ),
    );
  }
}
