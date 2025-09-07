import 'package:flutter/material.dart';
import 'package:trending_movies/app/repository/model/movie_details_model.dart';
import 'package:trending_movies/app/ui/bookmarks/widgets/bookmark_card_widget.dart';
import 'package:trending_movies/app/ui/movie_details_page/movie_details_page.dart';
import 'package:trending_movies/services/hivedb/hive_db.dart';
import 'package:trending_movies/services/hivedb/hive_mappers.dart.';

class BookmarksPage extends StatefulWidget {
  const BookmarksPage({super.key});

  @override
  State<BookmarksPage> createState() => _BookmarksPageState();
}

class _BookmarksPageState extends State<BookmarksPage> {
  List<MovieDetailsModel> movieList = [];

  @override
  void initState() {
    HiveManager().getAllMovie().forEach((movie) {
      movieList.add(movie.toApi());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 70,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'Bookmarks',
            style: TextStyle(color: Colors.white, fontSize: 25),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        movieList.isEmpty
            ? Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Center(
                  child: Text(
                    'No Movies Saved yet !',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              )
            : Expanded(
                child: ListView.separated(
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MovieDetailsPage(
                                      fromBookMark: true,
                                      movieDetails: movieList[index],
                                      movieId: movieList[index]
                                          .id
                                          .toString()))).then((_) {
                            movieList.clear();
                            HiveManager().getAllMovie().forEach((movie) {
                              movieList.add(movie.toApi());
                            });
                            setState(() {});
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: BookMarkCardWidget(movie: movieList[index]),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        height: 10,
                      );
                    },
                    itemCount: movieList.length))
      ],
    );
  }
}
