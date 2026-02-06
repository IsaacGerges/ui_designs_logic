import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UploadMultiImageScreen extends StatefulWidget {
  const UploadMultiImageScreen({super.key});

  @override
  State<UploadMultiImageScreen> createState() => _UploadMultiImageScreenState();
}

class _UploadMultiImageScreenState extends State<UploadMultiImageScreen> {
  List<XFile?> selectedImages = [null, null, null];

  Future<void> _uploadImages() async {
    List<XFile> pickedImages = await ImagePicker().pickMultiImage(limit: 3);

    for (int i = 0; i < 3; i++) {
      selectedImages[i] = i < pickedImages.length ? pickedImages[i] : null;
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink.shade900,

      body: Center(
        child: Column(
          children: [
            SizedBox(height: 120),

            /// Containers
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(3, (index) {
                  final image = selectedImages[index];
                  return Container(
                    margin: EdgeInsets.only(right: 8),
                    height: 120,
                    width: 120,
                    decoration: BoxDecoration(
                      color: Colors.grey.withValues(alpha: 0.3),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: image == null ? null : Image.file(File(image.path)),
                  );
                }),
              ),
            ),

            SizedBox(height: 50),

            /// Upload Button
            GestureDetector(
              onTap: _uploadImages,
              child: Container(
                height: 50,
                width: 200,
                decoration: BoxDecoration(
                  color: Colors.green.withValues(alpha: 0.4),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Text(
                    'Upload Multi Image',
                    style: TextStyle(color: Colors.white, fontSize: 15),
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
