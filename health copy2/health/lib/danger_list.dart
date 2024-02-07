import 'package:flutter/material.dart';

class Danger_List extends StatefulWidget {
  const Danger_List({super.key});

  @override
  State<Danger_List> createState() => _Danger_ListState();
}

class _Danger_ListState extends State<Danger_List> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Column(
          children: [
            Center(
              child: Text(
              'Danger List',
             style: TextStyle(fontSize:20), 
              )
            )
            
          ],

        )
      )
    );
  }
}