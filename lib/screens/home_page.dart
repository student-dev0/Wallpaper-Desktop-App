import 'package:flutter/material.dart';

import 'package:wallpaper_desktop_app/screens/select_nav_item.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wallpaper_desktop_app/screens/view/browse_screen.dart';
import 'package:wallpaper_desktop_app/screens/view/favorites_screen.dart';
import 'package:wallpaper_desktop_app/screens/view/home_screen.dart';
import 'package:wallpaper_desktop_app/screens/view/settings_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _selectedLabel = 'Home';

  final List<Map<String, String>> _navItems = [
    {'label': 'Home', 'asset': 'assets/images/Home.png'},
    {'label': 'Browse', 'asset': 'assets/images/Browse.png'},
    {'label': 'Favorites', 'asset': 'assets/images/Heart.png'},
    {'label': 'Settings', 'asset': 'assets/images/Settings.png'},
  ];

  void _onNavItemTapped(String label) {
    setState(() {
      _selectedLabel = label;
    });
    print('$label tapped');
  }


  
Widget _buildBody(){
  switch(_selectedLabel){
    case 'Home':
      return HomeScreen();
    case 'Browse':
      return BrowseScreen();
    case 'Favorites':
      return FavoriteScreen();
    case 'Settings':
      return SettingsScreen();
    default:
      return HomeScreen ();
  }
}

  @override
  Widget build(BuildContext context) {
    // final screenWidth = MediaQuery.of(context).size.width;
    // final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
    
      appBar: AppBar(backgroundColor: Colors.white,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
            child: Row(
              children: _navItems.map((item) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: SelectNavItem(
                    isSelected: _selectedLabel == item['label'],
                    label: item['label']!,
                    onTap: _onNavItemTapped,
                    assetImage: AssetImage(item['asset']!),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
        leadingWidth: 300,
        leading: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Image.asset(
                "assets/images/vscode-icons_file-type-codemagic.png",
                height: 16,
                width: 16,
              ),
              SizedBox(width: 8),
              Expanded(
                child: Text(
                  "Wallpaper Studio",
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: _buildBody()
    );
  }
}

