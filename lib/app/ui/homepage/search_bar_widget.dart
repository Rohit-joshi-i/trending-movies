import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trending_movies/app/bloc/bottom_navigation_bloc/bottom_navigation_bloc.dart';
import 'package:trending_movies/app/bloc/bottom_navigation_bloc/bottom_navigation_event.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.grey[900], // dark field background
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.6),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: TextField(
        onTap: () {
          context
              .read<BottomNavigationBloc>()
              .add(BottomNavigationUpdateEvent(index: 1));
        },
        style: TextStyle(color: Colors.white),
        cursorColor: Colors.redAccent,
        decoration: InputDecoration(
          hintText: "Search movies...",
          hintStyle: TextStyle(color: Colors.grey),
          prefixIcon: Icon(Icons.search, color: Colors.white70),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: 14),
        ),
      ),
    );
  }
}
