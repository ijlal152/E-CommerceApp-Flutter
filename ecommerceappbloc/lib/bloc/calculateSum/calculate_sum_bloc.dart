import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'calculate_sum_event.dart';
part 'calculate_sum_state.dart';

class CalculateSumBloc extends Bloc<CalculateSumEvent, CalculateSumState> {
  CalculateSumBloc() : super(CalculateSumInitial(sum: 0)) {
    on<CalculateSumEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
