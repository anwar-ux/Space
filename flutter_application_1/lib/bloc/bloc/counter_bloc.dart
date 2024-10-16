import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterInitial()) {
    on<ButtonClicked>(_onButtonClicked);
  }

  void _onButtonClicked(ButtonClicked event, Emitter<CounterState> emit) {
    try {
      emit(CounterLoading());
    
    
    } catch (e) {}
  }
}
