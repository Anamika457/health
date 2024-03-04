import 'package:flutter/material.dart';
import 'package:health/danger_list.dart';
import 'package:health/barcode.dart';

class Options extends StatelessWidget {
  const 
  Options({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Choose an option'),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return Barcode();
                    },
                  ),
                );
              },
              child: const Text('Scan Barcode'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return Danger_List();
                    },
                  ),
                );
              },
              child: const Text('Danger List'),
            ),


          ],
        )
      )
    );
  }
}