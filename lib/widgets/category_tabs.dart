import 'package:flutter/material.dart';

class CategoryTabs extends StatefulWidget {
  const CategoryTabs({super.key});

  @override
  State<CategoryTabs> createState() => _CategoryTabsState();
}

class _CategoryTabsState extends State<CategoryTabs> {
  int _selectedIndex = 0;
  final List<String> _categories = ['Search', 'YouTube', 'Music', 'More'];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _categories.length,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemBuilder: (context, index) {
          final isSelected = _selectedIndex == index;
          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedIndex = index;
              });
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    _categories[index],
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                      color: isSelected ? Colors.black87 : Colors.black45,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Container(
                    height: 3,
                    width: 24,
                    decoration: BoxDecoration(
                      color: isSelected ? Colors.amber.shade700 : Colors.transparent,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
