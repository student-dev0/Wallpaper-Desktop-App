import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wallpaper_desktop_app/models/wallpaper_grid.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F7),
      body: Column(
        children: [
          // First Column
          Column(
            children: [
              ShaderMask(
                shaderCallback: (bounds) => LinearGradient(
                  colors: [Color(0xFFFBB03B), Color(0xFFEC0C43)],
                ).createShader(bounds),
                child: Text(
                  "Saved Wallpapers",
                  style: TextStyle(
                    fontFamily: 'ClashDisplay',
                    fontSize: 60,
                    fontWeight: FontWeight.w500,
                    // This is important for the ShaderMask to work correctly.
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 8),
              Text(
                "Your saved wallpaper collections",
                style: GoogleFonts.poppins(
                  fontSize: 24,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          SizedBox(height: 30),
          Expanded(child: WallpaperGridPage()),
        ],
      ),
    );
  }
}
