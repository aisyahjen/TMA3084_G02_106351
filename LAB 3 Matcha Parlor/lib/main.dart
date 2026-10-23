import 'package:flutter/material.dart';

void main() {
  runApp(const MatchaParlorApp());
}

class MatchaParlorApp extends StatelessWidget {
  const MatchaParlorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'matchaesya co.',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFF8F7F0),
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF78966B)),
        fontFamily: 'Arial',
      ),
      home: const MenuScreen(),
    );
  }
}

class MenuItemData {
  final String name;
  final String description;
  final double price;
  final String category;
  final String imageUrl;
  final IconData icon;

  const MenuItemData({
    required this.name,
    required this.description,
    required this.price,
    required this.category,
    required this.imageUrl,
    required this.icon,
  });
}

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  String selectedCategory = 'All';
  int cartCount = 0;

  final List<MenuItemData> menuItems = const [
    MenuItemData(
      name: 'Classic Matcha Latte',
      description: 'Smooth Japanese matcha with fresh milk',
      price: 12.00,
      category: 'Drinks',
      imageUrl:
          'https://images.unsplash.com/photo-1515823064-d6e0c04616a7?w=700',
      icon: Icons.local_cafe_outlined,
    ),
    MenuItemData(
      name: 'Strawberry Matcha',
      description: 'Sweet strawberry meets earthy matcha',
      price: 15.00,
      category: 'Drinks',
      imageUrl:
          'https://images.unsplash.com/photo-1544787219-7f47ccb76574?w=700',
      icon: Icons.local_drink_outlined,
    ),
    MenuItemData(
      name: 'Matcha Soft-Serve',
      description: 'Creamy matcha ice cream in a waffle cone',
      price: 9.00,
      category: 'Soft-Serve',
      imageUrl:
          'https://images.unsplash.com/photo-1563805042-7684c019e1cb?w=700',
      icon: Icons.icecream_outlined,
    ),
    MenuItemData(
      name: 'Matcha Vanilla Twist',
      description: 'The perfect swirl of matcha and vanilla',
      price: 10.00,
      category: 'Soft-Serve',
      imageUrl:
          'https://images.unsplash.com/photo-1497034825429-c343d7c6a68f?w=700',
      icon: Icons.icecream,
    ),
    MenuItemData(
      name: 'Matcha Affogato',
      description: 'Matcha poured over a scoop of vanilla',
      price: 14.00,
      category: 'Specials',
      imageUrl:
          'https://images.unsplash.com/photo-1570197788417-0e82375c9371?w=700',
      icon: Icons.coffee_outlined,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final categories = ['All', 'Drinks', 'Soft-Serve', 'Specials'];

    final filteredItems = selectedCategory == 'All'
        ? menuItems
        : menuItems.where((item) => item.category == selectedCategory).toList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFF8F7F0),
        title: const Row(
          children: [
            Icon(Icons.eco, color: Color(0xFF52734D)),
            SizedBox(width: 8),
            Text(
              'matchaesya co.',
              style: TextStyle(
                color: Color(0xFF344A32),
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Badge(
              label: Text('$cartCount'),
              isLabelVisible: cartCount > 0,
              child: const Icon(
                Icons.shopping_bag_outlined,
                color: Color(0xFF344A32),
                size: 28,
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: const Color(0xFFE5EEDC),
                borderRadius: BorderRadius.circular(24),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'A LITTLE GREEN,',
                    style: TextStyle(
                      letterSpacing: 3,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF52734D),
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'A LOT OF SWEET.',
                    style: TextStyle(
                      fontSize: 28,
                      height: 1.2,
                      fontWeight: FontWeight.w900,
                      color: Color(0xFF344A32),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Your little matcha and ice cream escape.',
                    style: TextStyle(fontSize: 14, color: Color(0xFF52644D)),
                  ),
                  const SizedBox(height: 18),
                  Row(
                    children: [
                      const Icon(Icons.spa_outlined, color: Color(0xFF52734D)),
                      const SizedBox(width: 6),
                      const Text(
                        'Made with love & matcha',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF344A32),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 28),
            const Text(
              'Our Menu',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Color(0xFF344A32),
              ),
            ),
            const SizedBox(height: 6),
            const Text(
              'Find your new favourite treat.',
              style: TextStyle(color: Colors.black54),
            ),
            const SizedBox(height: 18),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: categories.map((category) {
                  final isSelected = selectedCategory == category;

                  return Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: ChoiceChip(
                      label: Text(category),
                      selected: isSelected,
                      selectedColor: const Color(0xFF52734D),
                      backgroundColor: Colors.white,
                      labelStyle: TextStyle(
                        color: isSelected
                            ? Colors.white
                            : const Color(0xFF344A32),
                        fontWeight: FontWeight.w600,
                      ),
                      onSelected: (_) {
                        setState(() {
                          selectedCategory = category;
                        });
                      },
                    ),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 16),
            ...filteredItems.map((item) {
              return Card(
                color: Colors.white,
                elevation: 1,
                margin: const EdgeInsets.only(bottom: 16),
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.network(
                      item.imageUrl,
                      height: 180,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          height: 180,
                          width: double.infinity,
                          color: const Color(0xFFE5EEDC),
                          child: Icon(
                            item.icon,
                            size: 64,
                            color: const Color(0xFF52734D),
                          ),
                        );
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item.name,
                                  style: const TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF344A32),
                                  ),
                                ),
                                const SizedBox(height: 6),
                                Text(
                                  item.description,
                                  style: const TextStyle(
                                    color: Colors.black54,
                                    fontSize: 13,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  'RM ${item.price.toStringAsFixed(2)}',
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF52734D),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 8),
                          IconButton.filled(
                            onPressed: () {
                              setState(() {
                                cartCount++;
                              });

                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    '${item.name} added to your bag!',
                                  ),
                                  duration: const Duration(seconds: 1),
                                ),
                              );
                            },
                            style: IconButton.styleFrom(
                              backgroundColor: const Color(0xFF52734D),
                            ),
                            icon: const Icon(Icons.add, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }),
            const SizedBox(height: 12),
            const Center(
              child: Text(
                'made with ♡ and matcha',
                style: TextStyle(
                  color: Color(0xFF52734D),
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
