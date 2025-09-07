import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:trending_movies/app/repository/model/movies_model.dart';
import 'package:trending_movies/app/utils/links.dart';

class MovieCard extends StatelessWidget {
  final MovieModel movie;
  const MovieCard({required this.movie, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Center(
            child: CachedNetworkImage(
              height: 180,
              imageUrl: '$imageUrl200/${movie.posterPath}',
              fit: BoxFit.fill,
              errorWidget: (context, url, error) {
                return Center(
                  child: SizedBox(
                    width: 120,
                    height: 180,
                    child: Icon(
                      Icons.error,
                      color: Colors.white,
                      size: 50,
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        SizedBox(
            width: 100,
            child: Text(
              '${movie.originalTitle}',
              style: TextStyle(color: Colors.white, fontSize: 10),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ))
      ],
    );
  }
}
