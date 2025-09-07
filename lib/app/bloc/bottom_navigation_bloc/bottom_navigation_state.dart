
abstract class BottomNavigationState {}

class BottomNavigationCompleteState extends BottomNavigationState {
  int? index;
  BottomNavigationCompleteState(this.index);
}
