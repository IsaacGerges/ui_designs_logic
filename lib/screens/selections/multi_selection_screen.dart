import 'package:flutter/material.dart';

class MultiSelectionScreen extends StatefulWidget {
  const MultiSelectionScreen({super.key});

  @override
  State<MultiSelectionScreen> createState() => _MultiSelectionScreenState();
}

class _MultiSelectionScreenState extends State<MultiSelectionScreen> {
  List<String> items = [
    'news',
    'sports',
    'entertainment',
    'business',
    'health',
    'science',
    'technology',
    'trending',
    'cooking',
    'fashion & dressing',
    'Ai',
    'Tech',
  ];

  Set<String> selectedItems = {};
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 80),

            Text(
              'What do you want to see on X?',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 40),

            Wrap(
              spacing: 30,
              runSpacing: 20,
              children: List.generate(items.length, (index) {
                final String type = items[index];

                final bool isSelected = selectedItems.contains(type);

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      if (isSelected) {
                        selectedItems.remove(type);
                      } else {
                        selectedItems.add(type);
                      }
                    });
                  },
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: isSelected ? Colors.blue : Colors.grey.shade800,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      type,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
