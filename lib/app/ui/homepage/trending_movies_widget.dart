import 'package:flutter/material.dart';
import 'package:trending_movies/app/repository/model/movies_model.dart';
import 'package:trending_movies/app/ui/homepage/widgets/movie_card.dart';
import 'package:trending_movies/app/ui/movie_details_page/movie_details_page.dart';

class TrendingMoviesWidget extends StatelessWidget {
  final List<MovieModel> trendingMoviesList;
  const TrendingMoviesWidget({required this.trendingMoviesList, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 10,
        ),
        Container(
          height: 250,
          decoration: BoxDecoration(),
          child: ListView.separated(
            itemCount: trendingMoviesList.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MovieDetailsPage(
                              movieId:
                                  trendingMoviesList[index].id.toString())));
                },
                child: Padding(
                  padding: EdgeInsets.only(
                      left: index == 0 ? 10.0 : 0,
                      right: index == trendingMoviesList.length - 1 ? 10 : 0),
                  child: MovieCard(
                    movie: trendingMoviesList[index],
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox(
                width: 10,
              );
            },
          ),
        )
      ],
    );
  }
}
