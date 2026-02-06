import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UploadImageScreen extends StatefulWidget {
  const UploadImageScreen({super.key});

  @override
  State<UploadImageScreen> createState() => _UploadImageScreenState();
}

class _UploadImageScreenState extends State<UploadImageScreen> {
  XFile? selectedImage;

  Future<void> _uploadImage() async {
    final pickedImage = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    setState(() {
      selectedImage = pickedImage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade900,
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 100),

            /// Image Container
            Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                color: Colors.grey.withValues(alpha: 0.3),
                borderRadius: BorderRadius.circular(20),
              ),
              child: selectedImage == null
                  ? null
                  : Image.file(File(selectedImage!.path)),
            ),

            SizedBox(height: 20),

            /// Upload or Change Button
            GestureDetector(
              onTap: _uploadImage,
              child: Container(
                height: 50,
                width: 200,
                decoration: BoxDecoration(
                  color: Colors.green.withValues(alpha: 0.4),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Text(
                    selectedImage != null ? 'change Image' : 'Upload Image',
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                ),
              ),
            ),

            SizedBox(height: 20),

            /// Remove Image
            if (selectedImage != null)
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedImage = null;
                  });
                },
                child: Container(
                  height: 50,
                  width: 200,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Text(
                      'Remove Image',
                      style: TextStyle(color: Colors.red, fontSize: 15),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
