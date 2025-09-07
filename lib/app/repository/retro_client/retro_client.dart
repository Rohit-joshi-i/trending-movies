import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import 'package:trending_movies/app/repository/response_models/movie_details_response_model.dart';
import 'package:trending_movies/app/repository/response_models/now_playing_movies_response_model.dart';
import 'package:trending_movies/app/repository/response_models/search_result_response_model.dart';
import 'package:trending_movies/app/repository/response_models/trending_movies_response_model.dart';

part 'retro_client.g.dart';

@RestApi()
abstract class ApiClient {
  factory ApiClient(
    Dio dio,
  ) {
    return _ApiClient(dio);
  }

  ///
  /// TODO ADd the api call
  ///
  @GET("movie/now_playing")
  Future<NowPlayingMovies> getNowPlayingMovies();

  @GET("movie/popular")
  Future<TrendingMoviesResponseModel> getPopularMovies();

  @GET("movie/{movie_id}")
  Future<MovieDetailsResponseModel> getMovieDetails(@Path('movie_id') String movieId);

  @GET("search/movie")
  Future<SearchResultModel> searchMovies(
      @Query("query") String query, {
        @Query("page") int page = 1,
      });
}
