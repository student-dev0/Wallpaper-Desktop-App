import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wallpaper_desktop_app/models/settings_model.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F7),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 16),
          child: Column(
            children: [
              // First Column
              Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  children: [
                    ShaderMask(
                      shaderCallback: (bounds) => LinearGradient(
                        colors: [Color(0xFFFBB03B), Color(0xFFEC0C43)],
                      ).createShader(bounds),
                      child: Text(
                        "Settings",
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
                    Padding(
                      padding: const EdgeInsets.only(left:8.0),
                      child: Text(
                        "Customize your Wallpaper Studio Experience",
                        style: GoogleFonts.poppins(
                          fontSize: 24,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 50),
              WallpaperSetupScreen(),
            ],
          ),
        ),
      ),
    );
  }
}
