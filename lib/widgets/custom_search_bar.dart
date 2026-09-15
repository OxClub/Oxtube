import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String> onSubmitted;

  const CustomSearchBar({
    super.key,
    required this.controller,
    required this.onSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30.0),
        border: Border.all(color: Colors.grey.shade300, width: 1.5),
      ),
      child: Row(
        children: [
          const SizedBox(width: 16),
          Icon(
            Icons.south_west_rounded,
            color: Colors.grey.shade600,
            size: 22,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: TextField(
              controller: controller,
              onSubmitted: onSubmitted,
              decoration: InputDecoration(
                hintText: 'jai radha madhav jai kunj bihari',
                hintStyle: TextStyle(
                  color: Colors.grey.shade400,
                  fontSize: 15,
                ),
                border: InputBorder.none,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Material(
              color: Colors.amber.shade600,
              shape: const CircleBorder(),
              clipBehavior: Clip.antiAlias,
              child: IconButton(
                icon: const Icon(Icons.search, color: Colors.black87),
                onPressed: () => onSubmitted(controller.text),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
