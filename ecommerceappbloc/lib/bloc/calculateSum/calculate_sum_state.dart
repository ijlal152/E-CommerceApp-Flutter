part of 'calculate_sum_cubit.dart';


class CalculateSumState extends Equatable{
  double sum;

  CalculateSumState({
    this.sum = 0,
  });

  @override
  // TODO: implement props
  List<Object> get props => [sum];

  Map<String, dynamic> toMap() {
    return {
      "sum": sum,
    };
  }

  factory CalculateSumState.fromJson(Map<String, dynamic> map) {
    return CalculateSumState(
      sum: map["sum"]?.toDouble() ?? 0,
    );
  }


}
