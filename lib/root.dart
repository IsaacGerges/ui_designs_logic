import 'package:flutter/material.dart';
import 'package:ui_designs_logic/screens/attachments/upload_file_screen.dart';
import 'package:ui_designs_logic/screens/attachments/upload_image_screen.dart';
import 'package:ui_designs_logic/screens/attachments/upload_multi_image_screen.dart';
import 'package:ui_designs_logic/screens/attachments/upload_video_screen.dart';
import 'package:ui_designs_logic/screens/form/form.dart';
import 'package:ui_designs_logic/screens/pagination/pagination.dart';
import 'package:ui_designs_logic/screens/search_and_list_filtering/search_feature_screen.dart';
import 'package:ui_designs_logic/screens/selections/multi_image_selection_screen.dart';
import 'package:ui_designs_logic/screens/selections/multi_selection_screen.dart';
import 'package:ui_designs_logic/screens/selections/single_selection_screen.dart';
import 'package:ui_designs_logic/screens/selections/toggle_selection_screen.dart';

class Root extends StatefulWidget {
  const Root({super.key});

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
  PageController controller = PageController();
  List<Widget> screens = [
    /// Selection Screens
    const SingleSelectionScreen(),
    const MultiImageSelectScreen(),
    const ToggleSelectionScreen(),
    const MultiSelectionScreen(),

    /// Attachment Screens
    const UploadImageScreen(),
    const UploadMultiImageScreen(),
    const UploadVideoScreen(),
    const UploadFileScreen(),

    /// Search Feature
    const SearchFeatureScreen(),

    /// Form Lesson
    const FormLesson(),

    /// pagination
    const Pagination(),
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: controller,
        onPageChanged: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        children: screens,
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /// back
            GestureDetector(
              onTap: () {
                setState(() {
                  controller.jumpToPage(selectedIndex - 1);
                });
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.black),
                ),
                child: Row(
                  children: [Icon(Icons.arrow_back, color: Colors.black)],
                ),
              ),
            ),

            SizedBox(width: 10),

            /// next
            GestureDetector(
              onTap: () {
                setState(() {
                  controller.jumpToPage(selectedIndex + 1);
                });
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                height: 40,
                color: Colors.black,
                child: Row(
                  children: [
                    Text(
                      'Next Page',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 10),
                    Icon(Icons.arrow_forward, color: Colors.white),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
