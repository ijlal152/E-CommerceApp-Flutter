import 'package:bloc/bloc.dart';
import 'package:ecommerceappbloc/bloc/exports.dart';
part 'calculate_sum_state.dart';

class CalculateSumCubit extends Cubit<CalculateSumState> {
  CalculateSumCubit() : super(CalculateSumState());

  void showData(double sum){
    state.sum = sum;
    emit(CalculateSumState(sum: state.sum));
  }

  // void calculateSum(List<double> allSum){
  //   //List<double> doubleSum = allSum.cast<double>();
  //   double total = state.sum;
  //   total = allSum.fold(0, (p, c) => p + c);  // sum of prices
  //   print('Sum is: $total');
  //   final updateState = CalculateSumState(sum: total);
  //   emit(updateState);
  // }

  @override
  CalculateSumState? fromJson(Map<String, dynamic> json) {
    // TODO: implement fromJson
    return CalculateSumState.fromJson(json);
  }

  @override
  Map<String, dynamic>? toJson(CalculateSumState state) {
    return state.toMap();
  }

}
