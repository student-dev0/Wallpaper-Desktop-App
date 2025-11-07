import 'package:flutter/material.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  bool _showAll = false;
  final ScrollController _scrollController = ScrollController();

  final List<Map<String, String>> _categories = [
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

  void _toggleShowAll() {
    setState(() {
      _showAll = !_showAll;
    });
  }

  @override
  void didUpdateWidget(covariant CategoryScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    // if showAll animate scroll to bottom
    if (_showAll) {
      Future.delayed(const Duration(milliseconds: 300), () {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeInOut,
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final displayedCategories = _showAll
        ? _categories
        : _categories.take(3).toList();
    return SingleChildScrollView(
      controller: _scrollController,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Categories",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              GestureDetector(
                onTap: _toggleShowAll,
                child: Text(
                  _showAll ? "See Less" : "See All",
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 13),

          //Animated Expansion
          AnimatedContainer(
            height: 280,
            duration: Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            child: GridView.builder(
              
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 15,
                mainAxisSpacing: 12,
                childAspectRatio: 1.8,
              ),
              itemCount: displayedCategories.length,
              itemBuilder: (context, index) {
                final catey = displayedCategories[index];
                return CategoryCard(
                  title: catey["title"]!,
                  subtitle: catey["subtitle"]!,
                  assetImage: catey["assetImage"]!,
                  count: catey["count"]!,
                );
              },
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
    return GestureDetector(
      onTap: (){},
      child: Container(
         
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          image: DecorationImage(
            image: AssetImage(assetImage),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
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
            Padding(
              padding: EdgeInsets.all(12),
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
      ),
    );
  }
}
