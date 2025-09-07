import 'package:equatable/equatable.dart';

abstract class HomePageEvents extends Equatable {}

class HomePageFetchMoviesEvent extends HomePageEvents {
  @override
  List<Object?> get props => [];
}
class HomePageNoInternetEvent extends HomePageEvents {
  @override
  List<Object?> get props => [];
}