//upload.dart 
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageUpload extends StatefulWidget {
  const ImageUpload({Key? key}) : super(key: key);

  @override
  _ImageUploadState createState() => _ImageUploadState();
}

class _ImageUploadState extends State<ImageUpload> {
  File? image;

  Future<void> pickImage(ImageSource source) async {
    try {
      final pickedImage = await ImagePicker().pickImage(source: source);
      if (pickedImage == null) return;
      final imageTemp = File(pickedImage.path);
      setState(() {
        image = imageTemp;
      });
    } catch (e) {
      print('Failed to pick image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            MaterialButton(
              color: Color.fromARGB(255, 182, 210, 234),
              child: const Text(
                "Pick Image from Gallery",
                style: TextStyle(
                    color: Color.fromARGB(179, 0, 0, 0),
                    fontWeight: FontWeight.bold),
              ),
              onPressed: () {
                pickImage(ImageSource.gallery);
              },
            ),
            SizedBox(height: 30,),
            MaterialButton(
              color: Color.fromARGB(255, 182, 210, 234),
              child: const Text(
                "Pick Image from Camera",
                style: TextStyle(
                    color: Color.fromARGB(179, 0, 0, 0),
                    fontWeight: FontWeight.bold),
              ),
              onPressed: () {
                pickImage(ImageSource.camera);
              },
            ),
            SizedBox(height: 30,),
            if (image != null) // Display the image if it's selected
              Image.file(image!), // Display the selected image
          ],
        ),
      ),
    );
  }
}
