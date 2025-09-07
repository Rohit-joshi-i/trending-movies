import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:trending_movies/app/repository/model/movie_details_model.dart';
import 'package:trending_movies/app/utils/links.dart';

class MovieDetailsWidget extends StatelessWidget {
  final MovieDetailsModel movieDetailsModel;
  const MovieDetailsWidget({required this.movieDetailsModel, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
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
          ColorFiltered(
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.4), // dark filter
              BlendMode.darken,
            ),
            child: CachedNetworkImage(
              imageUrl: '$imageUrl780/${movieDetailsModel.backdropPath}',
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
          ),
          // Poster image in the center
          Center(
            child: CachedNetworkImage(
              imageUrl: '$imageUrl780/${movieDetailsModel.posterPath}',
              fit: BoxFit.fill,
            ),
          ),
        ],
      ),
    );
  }
}
