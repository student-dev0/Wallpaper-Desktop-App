import 'package:flutter/material.dart';
import 'package:wallpaper_desktop_app/layout/responsive_layout.dart';
import 'package:wallpaper_desktop_app/screens/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wallpaper App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: DesktopResponsiveLayout(
        compactView: HomePage(),
        normalView: HomePage(),
        wideView: HomePage(),
      ),
    );
  }
}