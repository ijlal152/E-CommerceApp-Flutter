part of 'counter_bloc.dart';

class CounterState extends Equatable {
  final int quantityCounterValue;
  const CounterState({required this.quantityCounterValue});

  @override
  List<Object> get props => [quantityCounterValue];

  Map<String, dynamic> toMap() {
    return {
      "quantityCounterValue": quantityCounterValue,
    };
  }

  factory CounterState.fromJson(Map<String, dynamic> map) {
    return CounterState(
      quantityCounterValue: map["quantityCounterValue"]?.toInt() ?? 0,
    );
  }
//
}

class CounterInitial extends CounterState {
  CounterInitial(): super(quantityCounterValue: 1);
}

class CounterIncrementState extends CounterState{
  CounterIncrementState(int incrementValue) : super(quantityCounterValue: incrementValue);
}

class CounterDecrementState extends CounterState{
  CounterDecrementState(int decrementValue) : super(quantityCounterValue: decrementValue);
}
