part of 'calculate_sum_bloc.dart';

abstract class CalculateSumEvent {
  const CalculateSumEvent();
}

class TotalSumEvent extends CalculateSumEvent{
  @override
  final double sum;
  TotalSumEvent({required this.sum});
}

