import 'package:equatable/equatable.dart';

abstract class SearchPageEvent extends Equatable {}

class SearchMovieEvent extends SearchPageEvent {
  final String keyWord;
  final int? pageNo;
  SearchMovieEvent({required this.keyWord, this.pageNo});
  @override
  List<Object?> get props => [keyWord, pageNo];
}

class SearchMoreMovieEvent extends SearchPageEvent {
  final String keyWord;
  final int? pageNo;
  SearchMoreMovieEvent({required this.keyWord, this.pageNo});
  @override
  List<Object?> get props => [keyWord, pageNo];
}
