import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:trending_movies/app/repository/model/movie_details_model.dart';
import 'package:trending_movies/app/utils/links.dart';

class BookMarkCardWidget extends StatelessWidget {
  final MovieDetailsModel movie;
  const BookMarkCardWidget({required this.movie, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: CachedNetworkImage(
            errorWidget: (context, url, error) {
              return SizedBox(
                width: 100,
                height: 150,
                child: Icon(
                  Icons.error,
                  color: Colors.white,
                  size: 50,
                ),
              );
            },
            width: 100,
            imageUrl: '$imageUrl780/${movie.posterPath}',
            fit: BoxFit.fill,
          ),
        ),
        SizedBox(
          width: 20,
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 3),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  movie.title ?? '',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                  height: 1,
                ),
                Row(
                  children: [
                    Text(
                      '${movie.releaseDate}',
                      style:
                          TextStyle(color: Colors.grey.shade400, fontSize: 15),
                    ),
                    Spacer(),
                    RichText(
                        text: TextSpan(children: <TextSpan>[
                      TextSpan(
                          text: 'Rating',
                          style: TextStyle(color: Colors.amber, fontSize: 12)),
                      TextSpan(
                          text:
                              ' ${(movie.voteAverage ?? 0).toStringAsFixed(1)}/10',
                          style: TextStyle(color: Colors.amber, fontSize: 12)),
                    ])),
                  ],
                ),
                SizedBox(
                  height: 1,
                ),
                Text(
                  '${movie.overview}',
                  style: TextStyle(
                      color: Colors.grey.shade200,
                      fontSize: 12,
                      overflow: TextOverflow.ellipsis),
                  maxLines: 5,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
