import 'package:equatable/equatable.dart';

abstract class BottomNavigationEvent extends Equatable {}

class BottomNavigationUpdateEvent extends BottomNavigationEvent {
  final int index;
  BottomNavigationUpdateEvent({required this.index});
  @override
  List<Object?> get props => [index];
}
