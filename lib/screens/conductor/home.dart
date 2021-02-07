import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class ConductorHome extends StatefulWidget {
  @override
  _ConductorHomeState createState() => _ConductorHomeState();
}

class _ConductorHomeState extends State<ConductorHome> {
  String qrCode = "";
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Scan QR Code ",
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: "Rubik",
                    fontSize: 32,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                qrCode,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Rubik",
                    fontSize: 18),
              ),
              Spacer(
                flex: 10,
              ),
              Align(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () async {
                        try {
                          final qrCode =
                              await FlutterBarcodeScanner.scanBarcode(
                            '#ff6666',
                            'Cancel',
                            false,
                            ScanMode.QR,
                          );

                          if (!mounted) return;

                          setState(() {
                            this.qrCode = qrCode;
                          });
                        } on Exception catch (_) {
                          qrCode = 'Failed to get platform version.';
                        }
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
                          "Scan QR Code",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Rubik"),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          qrCode = "";
                        });
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
                          "Reset",
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
            ],
          ),
        ),
      ),
    );
  }
}

Future<void> scanQRCode() async {}
