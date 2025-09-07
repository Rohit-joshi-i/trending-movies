import 'package:trending_movies/app/repository/model/movies_model.dart';

abstract class SearchPageState {}

class SearchPageInitialState extends SearchPageState {}

class SearchResultFound extends SearchPageState {
  List<MovieModel> searchResult;
  int pageNo;
  String query;
  SearchResultFound(
      {required this.pageNo, required this.query, required this.searchResult});
}

class SearchResultWithItemsFound extends SearchPageState {
  List<MovieModel> searchResult;
  int pageNo;
  String query;
  SearchResultWithItemsFound(
      {required this.pageNo, required this.query, required this.searchResult});
}

class SearchResultLoading extends SearchPageState {}

class SearchResultWithItemsLoading extends SearchPageState {}

class SearchResultErrorState extends SearchPageState {
  String error;
  SearchResultErrorState({required this.error});
}

class NewSearchResultErrorState extends SearchPageState {
  String error;
  NewSearchResultErrorState({required this.error});
}
