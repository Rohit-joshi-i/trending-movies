import 'package:trending_movies/app/repository/model/movie_details_model.dart'
    as api_model;
import 'package:trending_movies/app/repository/model/movies_model.dart';
import 'package:trending_movies/services/hivedb/movie_details_hive_model.dart'
    as hive_model;
import 'package:trending_movies/services/hivedb//movie_list_hive_model.dart';

extension MovieDetailsToHive on api_model.MovieDetailsModel {
  hive_model.MovieDetailsHiveModel toHive() => hive_model.MovieDetailsHiveModel(
        adult: adult,
        backdropPath: backdropPath,
        budget: budget,
        genres: genres
            ?.map((g) => hive_model.Genre(id: g.id, name: g.name))
            .toList(),
        homepage: homepage,
        id: id,
        imdbId: imdbId,
        originCountry: originCountry,
        originalLanguage: originalLanguage,
        originalTitle: originalTitle,
        overview: overview,
        popularity: popularity,
        posterPath: posterPath,
        productionCompanies: productionCompanies
            ?.map((p) => hive_model.ProductionCompanies(
                  id: p.id,
                  logoPath: p.logoPath,
                  name: p.name,
                  originCountry: p.originCountry,
                ))
            .toList(),
        releaseDate: releaseDate,
        revenue: revenue,
        runtime: runtime,
        spokenLanguages: spokenLanguages
            ?.map((s) => hive_model.SpokenLanguages(
                  englishName: s.englishName,
                  iso6391: s.iso6391,
                  name: s.name,
                ))
            .toList(),
        status: status,
        tagline: tagline,
        title: title,
        video: video,
        voteAverage: voteAverage,
        voteCount: voteCount,
      );
}

extension MovieDetailsFromHive on hive_model.MovieDetailsHiveModel {
  api_model.MovieDetailsModel toApi() => api_model.MovieDetailsModel(
        adult: adult,
        backdropPath: backdropPath,
        budget: budget,
        genres: genres
            ?.map((g) => api_model.Genre(id: g.id, name: g.name))
            .toList(),
        homepage: homepage,
        id: id,
        imdbId: imdbId,
        originCountry: originCountry,
        originalLanguage: originalLanguage,
        originalTitle: originalTitle,
        overview: overview,
        popularity: popularity,
        posterPath: posterPath,
        productionCompanies: productionCompanies
            ?.map((p) => api_model.ProductionCompanies(
                  id: p.id,
                  logoPath: p.logoPath,
                  name: p.name,
                  originCountry: p.originCountry,
                ))
            .toList(),
        releaseDate: releaseDate,
        revenue: revenue,
        runtime: runtime,
        spokenLanguages: spokenLanguages
            ?.map((s) => api_model.SpokenLanguages(
                  englishName: s.englishName,
                  iso6391: s.iso6391,
                  name: s.name,
                ))
            .toList(),
        status: status,
        tagline: tagline,
        title: title,
        video: video,
        voteAverage: voteAverage,
        voteCount: voteCount,
      );
}

/// Convert MovieModel → MovieListHiveModel
extension MovieModelToHive on MovieModel {
  MovieListHiveModel toHiveModel() {
    return MovieListHiveModel(
      id: id,
      title: title,
      overview: overview,
      posterPath: posterPath,
      backdropPath: backdropPath,
      releaseDate: releaseDate,
      voteAverage: voteAverage,
      voteCount: voteCount,
      adult: adult,
      video: video,
      popularity: popularity,
      genreIds: genreIds,
      originalLanguage: originalLanguage,
      originalTitle: originalTitle,
    );
  }
}

/// Convert MovieListHiveModel → MovieModel
extension HiveToMovieModel on MovieListHiveModel {
  MovieModel toMovieModel() {
    return MovieModel(
      id: id,
      title: title,
      overview: overview,
      posterPath: posterPath,
      backdropPath: backdropPath,
      releaseDate: releaseDate,
      voteAverage: voteAverage,
      voteCount: voteCount,
      adult: adult,
      video: video,
      popularity: popularity,
      genreIds: genreIds,
      originalLanguage: originalLanguage,
      originalTitle: originalTitle,
    );
  }
}
