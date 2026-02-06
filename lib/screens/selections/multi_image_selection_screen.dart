import 'package:flutter/material.dart';

class MultiImageSelectScreen extends StatefulWidget {
  const MultiImageSelectScreen({super.key});

  @override
  State<MultiImageSelectScreen> createState() => _MultiImageSelectScreenState();
}

class _MultiImageSelectScreenState extends State<MultiImageSelectScreen> {
  List<String> photos = [
    'assets/laptop/labtop4.png',
    'assets/laptop/labtop1.png',
    'assets/laptop/labtop3.png',
    'assets/laptop/labtop2.png',
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 243, 77),

      body: Column(
        children: [
          SizedBox(height: 50),

          /// main SizedBox
          SizedBox(
            width: double.infinity,
            height: 300,
            child: Image.asset(
              photos[selectedIndex],
              fit: BoxFit.cover,
              height: 200,
            ),
          ),

          SizedBox(height: 30),

          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: List.generate(photos.length, (index) {
                  return AnimatedContainer(
                    duration: Duration(milliseconds: 400),
                    margin: EdgeInsetsDirectional.symmetric(horizontal: 5),
                    height: selectedIndex == index ? 110 : 100,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: selectedIndex == index
                            ? Colors.blue
                            : Colors.transparent,
                        width: 2,
                      ),
                    ),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });
                      },

                      child: Image.asset(photos[index], fit: BoxFit.cover),
                    ),
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
