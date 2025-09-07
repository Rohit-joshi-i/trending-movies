import 'package:equatable/equatable.dart';

abstract class MovieDetailPageEvent extends Equatable {}

class FetchMovieDetails extends MovieDetailPageEvent {
  final String movieId;
  FetchMovieDetails({required this.movieId});
  @override
  List<Object?> get props => [movieId];
}

class BookmarkMovie extends MovieDetailPageEvent {
  final bool save;
  BookmarkMovie({required this.save});
  @override
  List<Object?> get props => [save];
}
