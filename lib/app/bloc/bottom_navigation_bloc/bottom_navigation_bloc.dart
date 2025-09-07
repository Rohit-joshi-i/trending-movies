import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trending_movies/app/bloc/bottom_navigation_bloc/bottom_navigation_event.dart';
import 'package:trending_movies/app/bloc/bottom_navigation_bloc/bottom_navigation_state.dart';

class BottomNavigationBloc
    extends Bloc<BottomNavigationUpdateEvent, BottomNavigationState> {
  BottomNavigationBloc() : super(BottomNavigationCompleteState(0)) {
    on<BottomNavigationUpdateEvent>(_handleBottomNavigationEvent);
  }

  _handleBottomNavigationEvent(BottomNavigationUpdateEvent event,
      Emitter<BottomNavigationState> emit) async {
    emit(BottomNavigationCompleteState(event.index));
  }
}
