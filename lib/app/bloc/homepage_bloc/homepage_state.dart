import 'package:trending_movies/app/repository/model/movies_model.dart';

abstract class HomepageState {}

class HomePageLoadingState extends HomepageState {}

class HomePageErrorState extends HomepageState {
  String error;
  HomePageErrorState({required this.error});
}

class HomePageLoadDataCompleteState extends HomepageState {
  List<MovieModel>? nowPlayingMoviesList;
  List<MovieModel>? trendingMoviesList;

  HomePageLoadDataCompleteState(
      {required this.nowPlayingMoviesList, required this.trendingMoviesList});
}

class NoInternetState extends HomepageState {}
