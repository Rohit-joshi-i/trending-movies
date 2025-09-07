import 'package:flutter/material.dart';
import 'package:trending_movies/app/repository/model/movies_model.dart';
import 'package:trending_movies/app/ui/homepage/now_playing_movies_widget.dart';
import 'package:trending_movies/app/ui/homepage/search_bar_widget.dart';

import 'trending_movies_widget.dart';

class MoviesPage extends StatelessWidget {
  final List<MovieModel> trendingMovies;
  final List<MovieModel> nowPlayingMovies;
  const MoviesPage(
      {required this.trendingMovies,
      required this.nowPlayingMovies,
      super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  Icons.person,
                  color: Colors.white,
                  size: 50,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hello User',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    Text(
                      'Enjoy your favourite Movie',
                      style: TextStyle(color: Colors.white, fontSize: 10),
                    ),
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          SearchBarWidget(),
          SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Now Playing',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          NowPlayingMoviesWidget(
            nowPlayingMovieList: nowPlayingMovies,
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Trending',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
          TrendingMoviesWidget(
            trendingMoviesList: trendingMovies,
          ),
        ],
      ),
    );
  }
}
