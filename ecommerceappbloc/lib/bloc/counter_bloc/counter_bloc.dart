import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterInitial()) {
    on<CounterIncrementEvent>((event, emit) {
      emit(CounterIncrementState(state.quantityCounterValue +1));
    });

    on<CounterDecrementEvent>((event, emit) {
      emit(CounterDecrementState(state.quantityCounterValue -1));
    });
  }

  @override
  CounterState? fromJson(Map<String, dynamic> json) {
    // TODO: implement fromJson
    return CounterState.fromJson(json);
  }

  @override
  Map<String, dynamic>? toJson(CounterState state) {
    return state.toMap();
  }
}
