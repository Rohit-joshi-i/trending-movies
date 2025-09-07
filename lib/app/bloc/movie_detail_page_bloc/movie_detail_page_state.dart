import 'package:trending_movies/app/repository/model/movie_details_model.dart';

abstract class MovieDetailPageState {}

class MovieDetailPageLoadingState extends MovieDetailPageState {}

class MovieDetailPageErrorState extends MovieDetailPageState {}

class MovieDetailPageLoadCompleteState extends MovieDetailPageState {
  MovieDetailsModel movieDetails;
  MovieDetailPageLoadCompleteState(this.movieDetails);
}

class BookmarkToggleState extends MovieDetailPageState {
  bool saveStatus;
  BookmarkToggleState({required this.saveStatus});
}
