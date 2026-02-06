import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

class UploadVideoScreen extends StatefulWidget {
  const UploadVideoScreen({super.key});

  @override
  State<UploadVideoScreen> createState() => _UploadVideoScreenState();
}

class _UploadVideoScreenState extends State<UploadVideoScreen> {
  XFile? selectedVideo;

  VideoPlayerController? _controller;

  Future<void> _uploadVideo() async {
    final XFile? pickedVideo = await ImagePicker().pickVideo(
      source: ImageSource.gallery,
    );

    if (pickedVideo != null) {
      _controller = VideoPlayerController.file(File(pickedVideo.path));
      await _controller!.initialize();
    }

    setState(() {
      selectedVideo = pickedVideo;
    });
    _controller!.play();
    _controller!.setLooping(true);
  }

  @override
  void dispose() {
    if (_controller != null) {
      _controller!.dispose();
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red.withRed(10),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 140),

            /// Video Container
            Container(
              height: 200,
              width: 350,
              decoration: BoxDecoration(
                color: Colors.grey.withValues(alpha: 0.4),
                borderRadius: BorderRadius.circular(20),
              ),

              child: _controller != null && _controller!.value.isInitialized
                  ? AspectRatio(
                      aspectRatio: _controller!.value.aspectRatio,
                      child: VideoPlayer(_controller!),
                    )
                  : null,
            ),

            SizedBox(height: 40),

            /// Upload  Button
            GestureDetector(
              onTap: _uploadVideo,
              child: Container(
                height: 50,
                width: 200,
                decoration: BoxDecoration(
                  color: Colors.green.withValues(alpha: 0.3),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Text(
                    'Upload Video',
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
