import 'package:flutter/material.dart';

class GenreTile extends StatelessWidget {
  final String genre;
  const GenreTile({required this.genre, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.only(right: 8),
      color: Colors.grey.shade900,
      child: Center(
        child: Text(
          '${genre}',
          style: TextStyle(color: Colors.white, fontSize: 10),
        ),
      ),
    );
  }
}
