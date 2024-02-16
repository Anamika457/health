import 'package:flutter/material.dart';
import 'package:health/danger_list.dart';
import 'package:health/options.dart';
import 'package:health/barcode.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('TITLE', style: TextStyle(fontSize: 40)),
            const SizedBox(height: 200),
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
        ),
      ),
    );
  }
}
