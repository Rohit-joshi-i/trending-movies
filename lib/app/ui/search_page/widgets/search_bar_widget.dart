import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trending_movies/app/bloc/search_page_bloc/search_page_bloc.dart';
import 'package:trending_movies/app/bloc/search_page_bloc/search_page_event.dart';
import 'package:trending_movies/app/bloc/search_page_bloc/search_page_state.dart';

class SearchBarWidget extends StatefulWidget {
  final SearchPageBloc searchPageBloc;
  final TextEditingController searchController;
  const SearchBarWidget(
      {required this.searchPageBloc,
      required this.searchController,
      super.key});

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  Timer? _debounce;

  @override
  void initState() {
    super.initState();
  }

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
        controller: widget.searchController,
        onChanged: (text) {
          if (_debounce?.isActive ?? false) _debounce?.cancel();
          _debounce = Timer(const Duration(milliseconds: 800), () async {
            widget.searchPageBloc
                .add(SearchMovieEvent(keyWord: text, pageNo: 1));
          });
        },
        style: TextStyle(color: Colors.white),
        cursorColor: Colors.redAccent,
        decoration: InputDecoration(
          hintText: "Search movies...",
          hintStyle: TextStyle(color: Colors.grey),
          prefixIcon: Icon(Icons.search, color: Colors.white70),
          suffixIcon: BlocBuilder(
              bloc: widget.searchPageBloc,
              builder: (context, state) {
                if (state is SearchResultLoading) {
                  return Transform.scale(
                      scale: .5,
                      child: CircularProgressIndicator(
                        color: Colors.white,
                        strokeWidth: 1,
                      ));
                }
                return SizedBox();
              }),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: 14),
        ),
      ),
    );
  }
}
