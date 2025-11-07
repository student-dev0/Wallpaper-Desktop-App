import 'package:flutter/material.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({super.key});

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  bool _isGridView = true; // toggle between grid and list
  final List<Map<String, String>> categories = [
    {
      "title": "Nature",
      "subtitle": "Mountain Forest and landscapes",
      "assetImage": "assets/images/Nature.png",
      "count": '3 Wallpaper',
    },
    {
      "title": "Abstract",
      "subtitle": "Modern Geometric and abstract designs",
      "assetImage": "assets/images/Patterns.png",
      "count": '4 Wallpaper',
    },
    {
      "title": "Urban",
      "subtitle": "Cities, architecture and street",
      "assetImage": "assets/images/Construction.png",
      "count": '6 Wallpaper',
    },
    {
      "title": "Space",
      "subtitle": "Cosmos, planet and galaxies",
      "assetImage": "assets/images/Cosmic.png",
      "count": '3 Wallpaper',
    },
    {
      "title": "Minimalist",
      "subtitle": "Clean, simple and elegant",
      "assetImage": "assets/images/Art.png",
      "count": '6 Wallpaper',
    },
    {
      "title": "Animal",
      "subtitle": "Wildlife and nature photography",
      "assetImage": "assets/images/Animal.png",
      "count": '4 Wallpaper',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ===== Header Row =====
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Expanded(
                child: Text(
                  "Explore our curated collections of stunning wallpapers",
                  style: TextStyle(color: Colors.black54),
                ),
              ),

              // Toggle Buttons
              Row(
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.grid_view_outlined,
                      color: _isGridView ? Colors.orange : Colors.grey,
                    ),
                    tooltip: "Grid View",
                    onPressed: () {
                      setState(() => _isGridView = true);
                    },
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.view_agenda_outlined,
                      color: !_isGridView ? Colors.orange : Colors.grey,
                    ),
                    tooltip: "List View",
                    onPressed: () {
                      setState(() => _isGridView = false);
                    },
                  ),
                ],
              ),
            ],
          ),

          const SizedBox(height: 12),

          // ===== Layout Switcher =====
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 400),
            child: _isGridView
                ? GridView.builder(
                    key: const ValueKey('grid'),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 12,
                          mainAxisSpacing: 12,
                          childAspectRatio: 2.3,
                        ),
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      final cat = categories[index];
                      return CategoryCard(
                        title: cat["title"]!,
                        subtitle: cat["subtitle"]!,
                        assetImage: cat["assetImage"]!,
                        count: cat["count"]!,
                      );
                    },
                  )
                : SizedBox(
                    height:
                        400, // Constrains the height for the scrollable list
                    child: ListView.builder(
                      key: const ValueKey('list'),
                      itemCount: categories.length,
                      itemBuilder: (context, index) {
                        final cat = categories[index];
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 16.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 250,
                                height: 100,
                                child: CategoryCard(
                                  title: cat["title"]!,
                                  subtitle: cat["subtitle"]!,
                                  assetImage: cat["assetImage"]!,
                                  count: cat["count"]!,
                                ),
                              ),
                              const SizedBox(width: 20),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(height: 8),
                                    Text(
                                      cat["title"]!,
                                      style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      cat["subtitle"]!,
                                      style: const TextStyle(
                                        fontSize: 16,
                                        color: Colors.black54,
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                     Text(
                                      cat["count"]!,
                                      style: const TextStyle(
                                        fontSize: 16,
                                        color: Colors.black54,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String assetImage;
  final String count;

  const CategoryCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.assetImage,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(
          image: AssetImage(assetImage),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          // Container
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              gradient: LinearGradient(
                colors: [Colors.black.withAlpha(600), Colors.transparent],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
          ),
          // Text content
          Padding(
            padding: const EdgeInsets.all(12),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    subtitle,
                    style: const TextStyle(fontSize: 12, color: Colors.white70),
                  ),
                  const SizedBox(height: 4),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white.withAlpha(300),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      count,
                      style: const TextStyle(fontSize: 11, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
