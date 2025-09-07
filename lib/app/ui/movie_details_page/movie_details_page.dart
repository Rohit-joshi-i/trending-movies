import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:trending_movies/app/bloc/movie_detail_page_bloc/movie_detail_page_bloc.dart';
import 'package:trending_movies/app/bloc/movie_detail_page_bloc/movie_detail_page_event.dart';
import 'package:trending_movies/app/bloc/movie_detail_page_bloc/movie_detail_page_state.dart';
import 'package:trending_movies/app/repository/model/movie_details_model.dart';
import 'package:trending_movies/app/ui/movie_details_page/widgets/movie_details_widget.dart';
import 'package:trending_movies/app/ui/movie_details_page/widgets/movie_title_widget.dart';
import 'package:trending_movies/app/utils/error_page.dart';
import 'package:trending_movies/services/hivedb/hive_db.dart';
import 'package:trending_movies/services/hivedb/hive_mappers.dart';

class MovieDetailsPage extends StatefulWidget {
  final String movieId;
  final MovieDetailsModel? movieDetails;
  final bool fromBookMark;
  const MovieDetailsPage(
      {this.fromBookMark = false,
      this.movieDetails,
      required this.movieId,
      super.key});

  @override
  State<MovieDetailsPage> createState() => _MovieDetailsPageState();
}

class _MovieDetailsPageState extends State<MovieDetailsPage> {
  MovieDetailPageBloc movieDetailPageBloc = MovieDetailPageBloc();
  MovieDetailsModel? movieDetails;
  bool isAlreadySaved = false;

  @override
  void initState() {
    if (widget.fromBookMark) {
      isAlreadySaved = true;
    } else {
      HiveManager().getAllMovie().forEach((movie) {
        if (movie.id.toString() == widget.movieId) {
          isAlreadySaved = true;
        }
      });
    }
    if (!widget.fromBookMark) {
      movieDetailPageBloc.add(FetchMovieDetails(
        movieId: widget.movieId,
      ));
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: MultiBlocProvider(
        providers: [
          BlocProvider<MovieDetailPageBloc>(
            create: (context) => movieDetailPageBloc,
          ),
        ],
        child: BlocConsumer(
            bloc: movieDetailPageBloc,
            buildWhen: (prev, curr) {
              if (curr is BookmarkToggleState) {
                return false;
              }
              return true;
            },
            builder: (context, state) {
              if (widget.fromBookMark) {
                return SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      MovieDetailsWidget(
                        movieDetailsModel: widget.movieDetails!,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      MovieTitleWidget(
                        movieDetailsModel: widget.movieDetails!,
                        isAlreadySaved: isAlreadySaved,
                      ),
                    ],
                  ),
                );
              }
              if (state is MovieDetailPageLoadingState) {
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 150),
                      child: Center(
                          child: LoadingAnimationWidget.threeArchedCircle(
                              color: Colors.white, size: 80)),
                    ),
                  ],
                );
              }
              if (state is MovieDetailPageErrorState) {
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 150),
                      child: Center(child: ErrorPage(
                        onTap: () {
                          movieDetailPageBloc.add(FetchMovieDetails(
                            movieId: widget.movieId,
                          ));
                        },
                      )),
                    ),
                  ],
                );
              }
              if (state is MovieDetailPageLoadCompleteState) {
                return SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      MovieDetailsWidget(
                        movieDetailsModel: state.movieDetails,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      MovieTitleWidget(
                        movieDetailsModel: state.movieDetails,
                        isAlreadySaved: isAlreadySaved,
                      ),
                    ],
                  ),
                );
              }
              return Container();
            },
            listener: (context, state) {
              if (state is MovieDetailPageLoadCompleteState) {
                movieDetails = state.movieDetails;
              } else if (state is BookmarkToggleState) {
                if (state.saveStatus) {
                  HiveManager().put(widget.movieId, movieDetails!.toHive());
                } else {
                  HiveManager().delete(
                    widget.movieId,
                  );
                }
              }
            }),
      ),
    );
  }
}
