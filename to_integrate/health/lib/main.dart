import 'package:flutter/material.dart';
import 'package:health/option.dart';
import 'package:health/login.dart';


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
                      return Login();
                    },
                  ),
                );
              },
              child: const Text('Get started'),
            ),
           
          ],
        ),
      ),
    );
  }
}
