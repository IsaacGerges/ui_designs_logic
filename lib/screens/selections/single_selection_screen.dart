import 'package:flutter/material.dart';

class SingleSelectionScreen extends StatefulWidget {
  const SingleSelectionScreen({super.key});

  @override
  State<SingleSelectionScreen> createState() => _SingleSelectionScreenState();
}

class _SingleSelectionScreenState extends State<SingleSelectionScreen> {
  List<Map> gifts = [
    {'name': 'lion', 'image': 'assets/animals/lion.png'},
    {'name': 'tiger', 'image': 'assets/animals/tiger.png'},
    {'name': 'deer', 'image': 'assets/animals/deer.png'},
    {'name': 'cow', 'image': 'assets/animals/cow.png'},
    {'name': 'giraffe', 'image': 'assets/animals/giraffe.png'},
    {'name': 'pingeon', 'image': 'assets/animals/pingeon.png'},
    {'name': 'rat', 'image': 'assets/animals/rat.png'},
    {'name': 'white-tiger', 'image': 'assets/animals/white-tiger.png'},
  ];

  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: GridView.builder(
          itemCount: gifts.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 5,
            childAspectRatio: 0.7,
          ),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
              },
              child: Stack(
                children: [
                  /// gift container
                  if (selectedIndex == index)
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.grey.shade800,
                              Colors.grey.shade900,
                            ],
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),

                  /// gift image and name
                  Column(
                    children: [
                      Image.asset(
                        gifts[index]['image'],
                        height: selectedIndex == index ? 110 : 100,
                        width: 300,
                      ),
                      SizedBox(height: 5),
                      if (selectedIndex != index)
                        Text(
                          gifts[index]['name'].toUpperCase(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 12,
                          ),
                        ),
                    ],
                  ),

                  /// send button
                  if (selectedIndex == index)
                    Positioned(
                      bottom: 10,
                      left: 0,
                      right: 0,
                      child: Container(
                        height: 22,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: Colors.pink,
                        ),

                        child: Center(
                          child: Text(
                            'send',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
