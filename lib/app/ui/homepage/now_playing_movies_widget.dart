import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:trending_movies/app/repository/model/movies_model.dart';
import 'package:trending_movies/app/ui/movie_details_page/movie_details_page.dart';
import 'package:trending_movies/app/utils/links.dart';

class NowPlayingMoviesWidget extends StatelessWidget {
  final List<MovieModel> nowPlayingMovieList;
  const NowPlayingMoviesWidget({required this.nowPlayingMovieList, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
      ),
      child: CarouselSlider(
        options: CarouselOptions(
          height: 250,
          enlargeCenterPage: true,
          autoPlay: false,
        ),
        items: nowPlayingMovieList.map((movies) {
          return Builder(
            builder: (BuildContext context) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              MovieDetailsPage(movieId: movies.id.toString())));
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.6),
                        blurRadius: 12,
                        offset: const Offset(0, 6),
                      ),
                    ],
                  ),
                  child: Stack(
                    children: [
                      // Backdrop image with color filter
                      ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: ColorFiltered(
                          colorFilter: ColorFilter.mode(
                            Colors.black.withOpacity(0.4), // dark filter
                            BlendMode.darken,
                          ),
                          child: CachedNetworkImage(
                            imageUrl: '$imageUrl780/${movies.backdropPath}',
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: double.infinity,
                          ),
                        ),
                      ),
                      // Poster image in the center
                      Center(
                        child: CachedNetworkImage(
                          imageUrl: '$imageUrl200/${movies.posterPath}',
                          fit: BoxFit.fill,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        }).toList(),
      ),
    );
  }
}
