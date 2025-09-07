import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trending_movies/app/bloc/movie_detail_page_bloc/movie_detail_page_event.dart';
import 'package:trending_movies/app/bloc/movie_detail_page_bloc/movie_detail_page_state.dart';
import 'package:trending_movies/app/repository/repo.dart';

class MovieDetailPageBloc
    extends Bloc<MovieDetailPageEvent, MovieDetailPageState> {
  Repository repository = Repository();

  MovieDetailPageBloc() : super(MovieDetailPageLoadingState()) {
    on<FetchMovieDetails>(_handleMovieDetails);
    on<BookmarkMovie>(_handleBookMarkToggle);
  }

  _handleMovieDetails(
      FetchMovieDetails event, Emitter<MovieDetailPageState> emit) async {
    emit(MovieDetailPageLoadingState());

    var movieDetails = await repository.movieDetails(event.movieId);
    if (movieDetails.hasData) {
      emit(MovieDetailPageLoadCompleteState(movieDetails.data!));
    } else if (movieDetails.hasError) {
      emit(MovieDetailPageErrorState());
    }

    try {} catch (e) {
      emit(MovieDetailPageErrorState());
    }
  }

  _handleBookMarkToggle(
      BookmarkMovie event, Emitter<MovieDetailPageState> emit) async {
    emit(BookmarkToggleState(saveStatus: event.save));
  }
}
