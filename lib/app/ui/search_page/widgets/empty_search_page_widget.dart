import 'package:flutter/material.dart';

class EmptySearchPageWidget extends StatelessWidget {
  const EmptySearchPageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Text(
          'Search for your favourite movies here...',
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
      ),
    );
  }
}
