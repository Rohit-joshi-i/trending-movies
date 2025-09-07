// The HomeBloc class extends Bloc and manages the state of the application
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trending_movies/app/bloc/homepage_bloc/homepage_event.dart';
import 'package:trending_movies/app/bloc/homepage_bloc/homepage_state.dart';
import 'package:trending_movies/app/repository/repo.dart';

class HomeBloc extends Bloc<HomePageEvents, HomepageState> {
  Repository repository = Repository();
  HomeBloc() : super(HomePageLoadingState()) {
    on<HomePageFetchMoviesEvent>(_handleMovieFetchEvent);
    on<HomePageNoInternetEvent>(_handleNoInternetEvent);
  }

  _handleMovieFetchEvent(
      HomePageFetchMoviesEvent event, Emitter<HomepageState> emit) async {
    emit(HomePageLoadingState());

    try {
      var nowPlayingMovies = await repository.getNowPlayingMovies();
      var trendingMovies = await repository.getTrendingMovies();

      if (nowPlayingMovies.hasData && trendingMovies.hasData) {
        emit(HomePageLoadDataCompleteState(
            nowPlayingMoviesList: nowPlayingMovies.data,
            trendingMoviesList: trendingMovies.data));
      } else {
        emit(HomePageErrorState(
            error: nowPlayingMovies.error ?? "Something went wrong"));
      }
    } catch (e) {
      emit(HomePageErrorState(error: e.toString()));
    }
  }

  _handleNoInternetEvent(
      HomePageNoInternetEvent event, Emitter<HomepageState> emit) async {
    try {
      emit(NoInternetState());
    } catch (e) {
      emit(HomePageErrorState(error: e.toString()));
    }
  }
}
