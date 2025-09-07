import 'dart:collection';

import 'package:trending_movies/app/repository/mapper/movie_details_mapper.dart';
import 'package:trending_movies/app/repository/mapper/movie_hive_response_mapper.dart';
import 'package:trending_movies/app/repository/mapper/now_playing_movies_mapper.dart';
import 'package:trending_movies/app/repository/mapper/search_movies_mapper.dart';
import 'package:trending_movies/app/repository/mapper/trending_movies_mapper.dart';
import 'package:trending_movies/app/repository/model/movie_details_model.dart';
import 'package:trending_movies/app/repository/model/movies_model.dart';
import 'package:trending_movies/app/repository/result_wrapper.dart';
import 'package:trending_movies/app/repository/retro_client/retro_client.dart';
import 'package:trending_movies/services/api/api_service_manager.dart';
import 'package:trending_movies/services/hivedb/hive_db.dart';
import 'package:trending_movies/services/hivedb/movie_list_hive_model.dart';

class Repository {
  ApiClient? _apiClient;

  Repository() {
    ///
    /// Get dio client from service manager
    ///

    HashMap<String, String> moreHeaders = HashMap();
    moreHeaders['Authorization'] =
        'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJhNzI0MDRkOWIyNDlhNmE1NmZmNGU5MzM5ODI3NzczOSIsIm5iZiI6MTc1NjM3MjY5MS4wMTIsInN1YiI6IjY4YjAxZWQzMmY5YTZhNTUzNjYyNTBmMSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.5S7l-bdd8wPDkiDmywMHUNgIGIHRQv15hWI9FnmmPl0';
    moreHeaders['accept'] = 'application/json';
    var dioClient = ServiceManager.get().getDioClient(
        baseUrl: 'https://api.themoviedb.org/3/', moreHeaders: moreHeaders);


    _apiClient = ApiClient(dioClient);
  }

  Future<Result<List<MovieModel>>> getNowPlayingMovies() async {
    try {
      var nowPlayingMovies = HiveManager().nowPlayingBox;
      if (nowPlayingMovies.isNotEmpty) {
        List<MovieListHiveModel> currentMovieList =
            nowPlayingMovies.values.toList();
        return Future.value(
            Result(data: mapHiveListToMovies(currentMovieList)));
      }

      final response = await _apiClient!.getNowPlayingMovies();
      var movieList = mapNowPlayingMovies(response);
      for (var movie in movieList) {
        HiveManager().putNowPlayingMovies('${movie.id}', mapMovieToHive(movie));
      }
      return Result(data: mapNowPlayingMovies(response));
    } catch (e) {
      return Result(error: e.toString());
    }
  }

  Future<Result<List<MovieModel>>> getTrendingMovies() async {
    try {
      var trendingMovie = HiveManager().trendingMovieBox;
      if (trendingMovie.isNotEmpty) {
        var currentMovieList = trendingMovie.values.toList();
        return Future.value(
            Result(data: mapHiveListToMovies(currentMovieList)));
      }

      final response = await _apiClient!.getPopularMovies();
      var movieList = mapTrendingMovies(response);
      for (var movie in movieList) {
        HiveManager().putTrendingMovies('${movie.id}', mapMovieToHive(movie));
      }
      return Result(data: mapTrendingMovies(response));
    } catch (e) {
      return Result(error: e.toString());
    }
  }

  Future<Result<List<MovieModel>>> searchMovies(
      String query, int pageNo) async {
    try {
      final response = await _apiClient!.searchMovies(query, page: pageNo);

      return Result(data: mapSearchResults(response));
    } catch (e) {
      return Result(error: e.toString());
    }
  }

  Future<Result<MovieDetailsModel>> movieDetails(
    String movieId,
  ) async {
    try {
      final response = await _apiClient!.getMovieDetails(movieId);

      return Result(data: mapMovieDetails(response));
    } catch (e) {
      return Result(error: e.toString());
    }
  }
}
