import 'package:flutter/material.dart';

class ToggleSelectionScreen extends StatefulWidget {
  const ToggleSelectionScreen({super.key});

  @override
  State<ToggleSelectionScreen> createState() => _ToggleSelectionScreenState();
}

class _ToggleSelectionScreenState extends State<ToggleSelectionScreen> {
  bool isFollowing = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: Center(
        child: Stack(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('assets/profile.jpg'),
              radius: 100,
            ),

            Positioned(
              top: 150,
              left: 0,
              right: 0,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    isFollowing = !isFollowing;
                  });
                },
                child: CircleAvatar(
                  backgroundColor: Colors.pink,
                  radius: 20,
                  child: isFollowing == true
                      ? Icon(Icons.check, color: Colors.white, size: 25)
                      : Icon(Icons.add, color: Colors.white, size: 25),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
