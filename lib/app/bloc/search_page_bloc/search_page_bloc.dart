// The HomeBloc class extends Bloc and manages the state of the application
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trending_movies/app/bloc/search_page_bloc/search_page_event.dart';
import 'package:trending_movies/app/bloc/search_page_bloc/search_page_state.dart';
import 'package:trending_movies/app/repository/repo.dart';

class SearchPageBloc extends Bloc<SearchPageEvent, SearchPageState> {
  Repository repository = Repository();
  SearchPageBloc() : super(SearchPageInitialState()) {
    on<SearchMovieEvent>(_handleSearchEvent);
    on<SearchMoreMovieEvent>(_handleMoreSearchEvent);
  }

  _handleSearchEvent(
      SearchMovieEvent event, Emitter<SearchPageState> emit) async {
    try {
      emit(SearchResultLoading());

      if (event.keyWord.isEmpty) {
        emit(SearchResultFound(
            pageNo: 1, query: event.keyWord, searchResult: []));
        return;
      }

      var nowPlayingMovies =
          await repository.searchMovies(event.keyWord, event.pageNo ?? 1);
      if (nowPlayingMovies.hasData) {
        emit(SearchResultFound(
            pageNo: 1,
            query: event.keyWord,
            searchResult: nowPlayingMovies.data!));
      } else if (nowPlayingMovies.hasError) {
        emit(SearchResultErrorState(error: nowPlayingMovies.error.toString()));
      }
    } catch (e) {
      emit(SearchResultErrorState(error: e.toString()));
    }
  }

  _handleMoreSearchEvent(
      SearchMoreMovieEvent event, Emitter<SearchPageState> emit) async {
    try {
      emit(SearchResultWithItemsLoading());

      var nowPlayingMovies =
          await repository.searchMovies(event.keyWord, event.pageNo ?? 1);
      if (nowPlayingMovies.hasData) {
        emit(SearchResultWithItemsFound(
            pageNo: (event.pageNo ?? 1) + 1,
            query: event.keyWord,
            searchResult: nowPlayingMovies.data!));
      } else if (nowPlayingMovies.hasError) {
        emit(NewSearchResultErrorState(
            error: nowPlayingMovies.error.toString()));
      }
    } catch (e) {
      emit(NewSearchResultErrorState(error: e.toString()));
    }
  }
}
