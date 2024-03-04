import 'package:flutter/material.dart';
import 'package:health/barcode.dart';
import 'package:health/allergens.dart';


class Danger_List extends StatefulWidget {
  const Danger_List({super.key});

  @override
  State<Danger_List> createState() => _Danger_ListState();
}

class _Danger_ListState extends State<Danger_List> {
  @override
  int currentPage = 2;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
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
            if (index == 1) {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => Barcode(),
              ));
            } else if (index == 0) {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => Allergens(),
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
          child: Column(
            children: [
              Text('Danger List'),
            ],
          )
        )
    );
  }
}