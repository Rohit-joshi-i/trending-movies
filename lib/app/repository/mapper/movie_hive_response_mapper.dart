import 'package:trending_movies/app/repository/model/movies_model.dart';
import 'package:trending_movies/services/hivedb/movie_list_hive_model.dart';


/// Convert a single Hive model to normal model
MovieModel mapHiveToMovie(MovieListHiveModel hiveModel) {
  return MovieModel(
    id: hiveModel.id,
    title: hiveModel.title,
    overview: hiveModel.overview,
    posterPath: hiveModel.posterPath,
    backdropPath: hiveModel.backdropPath,
    releaseDate: hiveModel.releaseDate,
    voteAverage: hiveModel.voteAverage,
    voteCount: hiveModel.voteCount,
    adult: hiveModel.adult,
    video: hiveModel.video,
    popularity: hiveModel.popularity,
    genreIds: hiveModel.genreIds?.cast<int>(),
    originalLanguage: hiveModel.originalLanguage,
    originalTitle: hiveModel.originalTitle,
  );
}

/// Convert list of Hive models to list of normal models
List<MovieModel> mapHiveListToMovies(List<MovieListHiveModel> hiveModels) {
  return hiveModels.map((hiveModel) => mapHiveToMovie(hiveModel)).toList();
}

/// Convert normal model to Hive model
MovieListHiveModel mapMovieToHive(MovieModel movie) {
  return MovieListHiveModel(
    id: movie.id,
    title: movie.title,
    overview: movie.overview,
    posterPath: movie.posterPath,
    backdropPath: movie.backdropPath,
    releaseDate: movie.releaseDate,
    voteAverage: movie.voteAverage,
    voteCount: movie.voteCount,
    adult: movie.adult,
    video: movie.video,
    popularity: movie.popularity,
    genreIds: movie.genreIds,
    originalLanguage: movie.originalLanguage,
    originalTitle: movie.originalTitle,
  );
}

/// Convert list of normal models to list of Hive models
List<MovieListHiveModel> mapMoviesToHiveList(List<MovieModel> movies) {
  return movies.map((movie) => mapMovieToHive(movie)).toList();
}
