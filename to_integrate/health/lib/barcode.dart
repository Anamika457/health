import 'dart:async';
import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:health/results.dart';
import 'package:health/allergens.dart';
import 'package:health/danger_list.dart';

class Barcode extends StatefulWidget {
  @override
  _BarcodeState createState() => _BarcodeState();
}

class _BarcodeState extends State<Barcode> {
  String scannedBarcode = "";
  int currentPage = 1;

  @override
  void initState() {
    super.initState();
  }

  Future<void> scanBarcode() async {
    try {
      var result = await BarcodeScanner.scan();

      setState(() {
        scannedBarcode = result.rawContent;
      });
    } on PlatformException catch (e) {
      if (e.code == BarcodeScanner.cameraAccessDenied) {
        setState(() {
          scannedBarcode = 'Camera permission was denied';
        });
      } else {
        setState(() {
          scannedBarcode = 'Error: $e';
        });
      }
    } on FormatException {
      setState(() {
        scannedBarcode = 'User returned using the back button before scanning';
      });
    } catch (e) {
      setState(() {
        scannedBarcode = 'Error: $e';
      });
    }
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
        bottomNavigationBar: NavigationBar(
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.local_hospital_outlined),
              label: 'Allergens',
            ),
            NavigationDestination(
              icon: Icon(Icons.barcode_reader),
              label: 'Barcode',
            ),
            NavigationDestination(
              icon: Icon(Icons.dangerous_outlined),
              label: 'Danger List',
            ),
          ],
          onDestinationSelected: (int index) {
            if (index == 0) {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => Allergens(),
              ));
            } else if (index == 2) {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => Danger_List(),
              ));
            } else {
              setState(() {
                currentPage = index;
              });
            }
          },
          selectedIndex: currentPage,
        ),
        body: Center(
          child: getPage(currentPage),
        ),
      ),
    );
  }

  Widget getPage(int index) {
    switch (index) {
      case 0:
        return Allergens();
      case 1:
        return BarcodeBody(scannedBarcode: scannedBarcode);
      case 2:
        return Danger_List();
      default:
        return BarcodeBody(scannedBarcode: scannedBarcode);
    }
  }
}

class BarcodeBody extends StatelessWidget {
  final String scannedBarcode;

  const BarcodeBody({required this.scannedBarcode});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Container(
            child: ElevatedButton(
              onPressed: () {},
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
            style: const TextStyle(fontSize: 25, color: Colors.green),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return const Results();
                  },
                ),
              );
            },
            child: const Text('Results'),
          )
        ],
      ),
    );
  }
}

void main() {
  runApp(Barcode());
}
