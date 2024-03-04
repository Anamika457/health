import 'package:flutter/material.dart';
import 'package:health/danger_list.dart';
import 'package:health/barcode.dart';

class Allergens extends StatefulWidget {
  const Allergens({super.key});

  @override
  State<Allergens> createState() => _AllergensState();
}

class _AllergensState extends State<Allergens> {

  int currentPage = 0;

  
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
          
          child: Column(
            children: [
              Text('Allergens'),
              SizedBox(height: 20,),
              TextField(
              decoration: InputDecoration(
              contentPadding: EdgeInsets.all(0),
              border: OutlineInputBorder(),
              hintText: 'Enter allergen'
              ),
              ),
              SizedBox(height: 20,),
              ElevatedButton(onPressed: (){

              },
               child: Text('Done'))

              
            ],
          )
        ),
        floatingActionButton: FloatingActionButton(
        onPressed: () {
          debugPrint('Floating button pressed');
        },
        child: const Icon(Icons.add)
        )
    );
  }
}