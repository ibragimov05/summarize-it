import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Search screen',
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
