import 'package:trending_movies/app/repository/model/movies_model.dart';
import 'package:trending_movies/app/repository/response_models/now_playing_movies_response_model.dart';

List<MovieModel> mapNowPlayingMovies(NowPlayingMovies response) {
  return _mapResults(response.results);
}

List<MovieModel> _mapResults(List<Results>? results) {
  var list = <MovieModel>[];

  results?.forEach((element) {
    list.add(
      MovieModel()
        ..id = element.id
        ..title = element.title
        ..overview = element.overview
        ..posterPath = element.posterPath
        ..backdropPath = element.backdropPath
        ..releaseDate = element.releaseDate
        ..voteAverage = element.voteAverage
        ..voteCount = element.voteCount
        ..adult = element.adult
        ..video = element.video
        ..popularity = element.popularity
        ..genreIds = element.genreIds
        ..originalLanguage = element.originalLanguage
        ..originalTitle = element.originalTitle,
    );
  });

  return list;
}
