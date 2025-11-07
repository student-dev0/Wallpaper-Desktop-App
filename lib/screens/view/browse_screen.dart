import 'package:flutter/material.dart';

import 'package:wallpaper_desktop_app/models/category_browse_card.dart';

class BrowseScreen extends StatelessWidget {
  const BrowseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F7),
      body: Padding(
        padding: EdgeInsets.only(left: 17),
        child: Column(
          children: [
            // First Column
            Padding(
              padding: EdgeInsetsGeometry.only(left: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ShaderMask(
                    shaderCallback: (bounds) => LinearGradient(
                      colors: [Color(0xFFFBB03B), Color(0xFFEC0C43)],
                    ).createShader(bounds),
                    child: Text(
                      "Browse Categories",
                      style: TextStyle(
                        fontFamily: 'ClashDisplay',
                        fontSize: 60,
                        fontWeight: FontWeight.w500,
                        // This is important for the ShaderMask to work correctly.
                        color: Colors.white,
                      ),
                    ),
                  ),

                  const CategoriesPage(),
                  SizedBox(height: 50),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
