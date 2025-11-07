import 'package:flutter/material.dart';

class WallpaperGridPage extends StatelessWidget {
  const WallpaperGridPage({super.key});

  @override
  Widget build(BuildContext context) {
    final wallpapers = [
      "assets/images/Construction.png",
      "assets/images/Nature.png",
      "assets/images/Animal.png",
      "assets/images/Art.png",
      "assets/images/Cosmic.png",
      "assets/images/Patterns.png",
    ];

    return Padding(
      padding: const EdgeInsets.all(16),
      child: LayoutBuilder(
        builder: (context, constraints) {
          // Responsive grid: adjusts number of columns dynamically
          final crossAxisCount = constraints.maxWidth > 800
              ? 5
              : constraints.maxWidth > 600
              ? 4
              : constraints.maxWidth > 400
              ? 3
              : 2;

          return GridView.builder(
            itemCount: 12,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 0.65, // makes cards taller
            ),
            itemBuilder: (context, index) {
              final image = wallpapers[index % wallpapers.length];
              return WallpaperCard(
                assetImage: image,
                title: 'Nature ${index + 1}',
                category: 'Nature',
              );
            },
          );
        },
      ),
    );
  }
}

class WallpaperCard extends StatefulWidget {
  final String assetImage;
  final String title;
  final String category;

  const WallpaperCard({
    super.key,
    required this.assetImage,
    required this.title,
    required this.category,
  });

  @override
  State<WallpaperCard> createState() => _WallpaperCardState();
}

class _WallpaperCardState extends State<WallpaperCard> {
  bool _isFavorite = false;

  final double cardWidth = 100; // Define the width
  final double cardHeight = 100; // Define the height
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => setState(() => _isFavorite = !_isFavorite),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),

          image: DecorationImage(
            image: AssetImage(widget.assetImage),
            fit: BoxFit.cover,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black12.withAlpha(800),
              blurRadius: 6,
              offset: const Offset(2, 3),
            ),
          ],
        ),
        child: Stack(
          children: [
            // Gradient overlay for better text visibility
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                gradient: LinearGradient(
                  colors: [
                    Colors.black.withAlpha(600),
                    Colors.transparent,
                    Colors.black.withAlpha(200),
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
            ),

            // Favorite icon (top-right)
            Positioned(
              top: 10,
              right: 10,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white70,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  _isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: Colors.orangeAccent,
                  size: 22,
                ),
              ),
            ),

            // Bottom text area
            Positioned(
              bottom: 10,
              left: 10,
              right: 10,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      height: 1.2,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 3,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white.withAlpha(300),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      widget.category,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
