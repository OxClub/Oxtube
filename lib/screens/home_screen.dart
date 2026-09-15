import 'package:flutter/material.dart';
import '../widgets/category_tabs.dart';
import '../widgets/custom_search_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentBottomNavIndex = 0;
  final TextEditingController _searchController = TextEditingController();

  void _onSearchSubmitted(String query) {
    if (query.trim().isEmpty) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Searching for: $query'),
        backgroundColor: Colors.amber.shade800,
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Widget _buildBody() {
    switch (_currentBottomNavIndex) {
      case 0:
        return Column(
          children: [
            const SizedBox(height: 12),
            const CategoryTabs(),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    children: [
                      const SizedBox(height: 60),
                      Text(
                        'Snaptube',
                        style: TextStyle(
                          fontSize: 42,
                          fontWeight: FontWeight.bold,
                          color: Colors.amber.shade700,
                          letterSpacing: -0.5,
                        ),
                      ),
                      const SizedBox(height: 40),
                      CustomSearchBar(
                        controller: _searchController,
                        onSubmitted: _onSearchSubmitted,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      case 1:
        return const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.play_circle_fill, size: 64, color: Colors.amber),
              SizedBox(height: 16),
              Text(
                'Media Player',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                'Downloaded videos and music will appear here',
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        );
      case 2:
        return const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.settings, size: 64, color: Colors.grey),
              SizedBox(height: 16),
              Text(
                'Settings',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                'Configure download path and preferences',
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        );
      default:
        return const SizedBox.shrink();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _buildBody(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentBottomNavIndex,
        onTap: (index) {
          setState(() {
            _currentBottomNavIndex = index;
          });
        },
        selectedItemColor: Colors.black87,
        unselectedItemColor: Colors.grey.shade500,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
        unselectedLabelStyle: const TextStyle(fontSize: 12),
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Download',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.play_circle_outline),
            label: 'Play',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
