import 'package:flutter/material.dart';
import 'package:health/search.dart';
import 'package:health/danger_list.dart';
import 'package:health/upload.dart';



class Options extends StatelessWidget {
  const Options({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Choose an Option',
              style: TextStyle(fontSize: 40)
              ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return const Search();
                    },
                  )
                  );
              },
              child: const Text('Search by text'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return ImageUpload();
                    },
                  )
                  );
              },
              child: const Text('Upload image'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return const Danger_List();
                    },
                  )
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
