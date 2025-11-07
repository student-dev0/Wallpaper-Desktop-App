import 'package:flutter/material.dart';

class WallpaperSetupScreen extends StatefulWidget {
  @override
  State<WallpaperSetupScreen> createState() => _WallpaperSetupScreenState();
}

class _WallpaperSetupScreenState extends State<WallpaperSetupScreen> {
  String _imageQuality = "High (Best Quality)";
  bool _notify = true;
  bool _connected = true; // fake connection status

  final List<String> qualityOptions = ["Low", "Medium", "High (Best Quality)"];

  void saveSettings() {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text("Settings saved ✅")));
  }

  void toggleConnection() {
    setState(() {
      _connected = !_connected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 550, // Defined height for the container
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Padding(
          padding: const EdgeInsets.only(left: 8),
          child: IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Left Panel
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Wallpaper Setup",
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "Configure your wallpaper settings and enable auto-rotation",
                        style: TextStyle(fontSize: 14, color: Colors.black54),
                      ),
                      const SizedBox(height: 30),

                      // Dropdown
                      const Text("Image Quality"),
                      const SizedBox(height: 5),
                      Container(
                        width: 300, // Added width for better layout
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.black26),
                        ),
                        child: DropdownButton<String>(
                          value: _imageQuality,
                          underline: SizedBox(),
                          isExpanded: true,
                          items: qualityOptions
                              .map(
                                (e) =>
                                    DropdownMenuItem(value: e, child: Text(e)),
                              )
                              .toList(),
                          onChanged: (value) {
                            setState(() => _imageQuality = value!);
                          },
                        ),
                      ),

                      const SizedBox(height: 20),

                      // Notification Toggle
                      SizedBox(
                        width: 300, // Added width for better layout
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("Notification"),
                            Switch(
                              value: _notify,
                              onChanged: (v) => setState(() => _notify = v),
                              activeColor: Colors.orange,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 40),

                      Row(
                        children: [
                          OutlinedButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text("Cancel"),
                          ),
                          const SizedBox(width: 15),
                          ElevatedButton(
                            onPressed: saveSettings,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.orange,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 25,
                              ),
                            ),
                            child: const Text("Save Settings"),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 50),
                // Right: Device Preview Box
                Container(
                  width: 250,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: Colors.blue),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          _connected ? Icons.check_circle : Icons.cancel,
                          size: 40,
                          color: _connected ? Colors.green : Colors.red,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          _connected ? "Connected to device" : "Disconnected",
                          style: TextStyle(
                            fontSize: 16,
                            color: _connected ? Colors.green : Colors.red,
                          ),
                        ),
                        const SizedBox(height: 5),
                        InkWell(
                          onTap: toggleConnection,
                          child: Text(
                            _connected
                                ? "Click to disconnect"
                                : "Click to connect",
                            style: const TextStyle(
                              decoration: TextDecoration.underline,
                              color: Colors.black54,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
