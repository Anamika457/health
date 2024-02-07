import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(),
      body: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15,vertical:15),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 234, 218, 236),
                borderRadius: BorderRadius.circular(20)
              ),
            
              child: const TextField(
                  decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(0),
                  prefixIcon: Icon(Icons.search,color: Colors.black,size:20,),
                  prefixIconConstraints: BoxConstraints(maxHeight: 20,minWidth: 25),
                  border: InputBorder.none,
                  hintText: 'Search',
                  
                ),

              ),
      )
            );
  }
}