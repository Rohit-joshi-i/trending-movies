import 'package:flutter/material.dart';
import 'package:trending_movies/app/repository/model/movie_details_model.dart';
import 'package:trending_movies/app/ui/movie_details_page/widgets/bookmark_button.dart';

import 'genre_tile.dart';

class MovieTitleWidget extends StatelessWidget {
  final MovieDetailsModel movieDetailsModel;
  final bool isAlreadySaved;
  const MovieTitleWidget({this.isAlreadySaved = false,required this.movieDetailsModel, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  '${movieDetailsModel.title}',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Icon(
                Icons.star,
                color: Colors.amber,
                size: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Text(
                  ' ${(movieDetailsModel.voteAverage ?? 0).toStringAsFixed(1)}/10',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          if (movieDetailsModel.genres != null)
            Row(
              children: [
                ...movieDetailsModel.genres!.map((genre) {
                  return GenreTile(
                    genre: genre.name ?? "",
                  );
                }),
                Spacer(),
                BookmarkButton(
                  isSaved: isAlreadySaved,
                ),
              ],
            ),
          SizedBox(
            height: 5,
          ),
          Text(
            '${movieDetailsModel.tagline}',
            style: TextStyle(
                color: Colors.white, fontSize: 15, fontStyle: FontStyle.italic),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 16
            ),
            decoration: BoxDecoration(
              color: Colors.grey.shade900,
              borderRadius: BorderRadius.circular(16)
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Overview',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                Text('${movieDetailsModel.overview}',
                    style: TextStyle(fontSize: 14, color: Colors.white)),
              ],
            ),
          )
        ],
      ),
    );
  }
}
