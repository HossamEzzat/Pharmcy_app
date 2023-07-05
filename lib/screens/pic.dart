import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class picedit extends StatefulWidget {
  const picedit({super.key});

  @override
  State<picedit> createState() => _piceditState();
}

class _piceditState extends State<picedit> {


 List<XFile> _imageFiles = [];

  Future<void> _pickImages() async {
    final imagePicker = ImagePicker();
    final pickedImages = await imagePicker.pickMultiImage();
    if (pickedImages != null) {
      setState(() {
        _imageFiles = pickedImages;
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
            ElevatedButton(
                    onPressed: _pickImages,
                    child: const Text('اختر الصور',
                        style: TextStyle(fontSize: 16)),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blueGrey[900],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
    
                         SizedBox(
                    height: 100,
                    child: GridView.count(
                      crossAxisCount: 3,
                      children: _imageFiles
                          .map((imageFile) =>
                              Image.file(File(imageFile.path), fit: BoxFit.cover))
                          .toList(),
                    ),
                  ),
        ],
      ),
    );
  }
}