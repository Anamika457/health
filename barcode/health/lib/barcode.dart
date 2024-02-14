import 'dart:async';
import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Barcode extends StatefulWidget {
  @override
  _BarcodeState createState() => _BarcodeState();
}

class _BarcodeState extends State<Barcode> {
  String scannedBarcode = "";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back_ios),
          ),
        ),
        body: Center(
          child: Column(
            children:[
              Container(
                child: ElevatedButton(
                  onPressed: main,
                  child: Text(
                    "Capture Image",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(primary: Colors.green),
                ),
                padding: const EdgeInsets.all(10.0),
                margin: EdgeInsets.all(10),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
              ),
              Text(
                "Scanned Barcode Number",
                style: TextStyle(fontSize: 20),
              ),
              Text(
                scannedBarcode,
                style: TextStyle(fontSize: 25, color: Colors.green),
              ),
            ],
          ),
        ),
      ),
    );
  }

}
void main() async {
  var result = await BarcodeScanner.scan();

  print(result.type); 
  print(result.rawContent); 
  print(result.format); 
  print(result.formatNote); 
  
  }