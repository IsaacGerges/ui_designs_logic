import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:open_file/open_file.dart';

class UploadFileScreen extends StatefulWidget {
  const UploadFileScreen({super.key});

  @override
  State<UploadFileScreen> createState() => _UploadFileScreenState();
}

class _UploadFileScreenState extends State<UploadFileScreen> {
  String? _fileName;
  String? _filePath;

  /// pick file method
  Future<void> _pickFile() async {
    final FilePickerResult? file = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'docx', 'doc', 'jpg'],
    );

    if (file != null && file.files.single.name.isNotEmpty) {
      setState(() {
        _fileName = file.files.single.name;
        _filePath = file.files.single.path;
      });
    }
  }

  /// open file method
  void _openFIle(String? path) {
    OpenFile.open(path);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 140),

            Container(
              width: 370,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4),
                border: Border.all(color: Colors.black26),
              ),
              child: Row(
                children: [
                  SvgPicture.asset('assets/svgs/doc.svg', width: 60),

                  GestureDetector(
                    onTap: _filePath != null
                        ? () => _openFIle(_filePath)
                        : null,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _fileName != null ? '$_fileName' : 'Upload File',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text('pdf, docx, doc, jpg'),
                      ],
                    ),
                  ),

                  Spacer(),

                  PopupMenuButton(
                    color: Colors.white,
                    itemBuilder: (context) {
                      return [
                        /// upload
                        PopupMenuItem(
                          onTap: _pickFile,
                          child: Row(
                            children: [
                              Icon(CupertinoIcons.arrow_up_doc),
                              SizedBox(width: 10),
                              Text('Upload'),
                            ],
                          ),
                        ),

                        /// View
                        if (_filePath != null)
                          PopupMenuItem(
                            onTap: () => _openFIle(_filePath),
                            child: Row(
                              children: [
                                Icon(CupertinoIcons.eye),
                                SizedBox(width: 10),
                                Text('VIew'),
                              ],
                            ),
                          ),
                        if (_filePath != null)
                          /// Change
                          PopupMenuItem(
                            onTap: _pickFile,
                            child: Row(
                              children: [
                                Icon(CupertinoIcons.refresh),
                                SizedBox(width: 10),
                                Text('Change'),
                              ],
                            ),
                          ),
                        if (_filePath != null)
                          /// delete
                          PopupMenuItem(
                            onTap: () {
                              setState(() {
                                _fileName = null;
                              });
                            },
                            child: Row(
                              children: [
                                Icon(CupertinoIcons.delete, color: Colors.red),
                                SizedBox(width: 10),
                                Text(
                                  'Delete',
                                  style: TextStyle(color: Colors.red),
                                ),
                              ],
                            ),
                          ),
                      ];
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
