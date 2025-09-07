import 'package:trending_movies/app/repository/model/movie_details_model.dart';
import 'package:trending_movies/app/repository/response_models/movie_details_response_model.dart';

MovieDetailsModel mapMovieDetails(MovieDetailsResponseModel response) {
  return MovieDetailsModel()
    ..adult = response.adult
    ..backdropPath = response.backdropPath
    ..budget = response.budget
    ..homepage = response.homepage
    ..id = response.id
    ..imdbId = response.imdbId
    ..originCountry = response.originCountry
    ..originalLanguage = response.originalLanguage
    ..originalTitle = response.originalTitle
    ..overview = response.overview
    ..popularity = response.popularity
    ..posterPath = response.posterPath
    ..releaseDate = response.releaseDate
    ..revenue = response.revenue
    ..runtime = response.runtime
    ..status = response.status
    ..tagline = response.tagline
    ..title = response.title
    ..video = response.video
    ..voteAverage = response.voteAverage
    ..voteCount = response.voteCount
    ..genres = _mapGenre(response.genres);
}

List<Genre> _mapGenre(List<Genres>? genre) {
  List<Genre> genreList = [];

  if (genre != null) {
    for (int i = 0; i < genre.length; i++) {
      var gen = Genre()
        ..name = genre[i].name
        ..id = genre[i].id;
      genreList.add(gen);
    }
  }

  return genreList;
}
