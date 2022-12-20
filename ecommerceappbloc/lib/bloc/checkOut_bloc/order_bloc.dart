
import 'package:bloc/bloc.dart';
import 'package:ecommerceappbloc/NewCode/Models/checkout_model.dart';
import 'package:ecommerceappbloc/data/repositories/checkout_repository.dart';
import 'package:equatable/equatable.dart';

part 'order_event.dart';
part 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  final CheckOutRepository checkOutRepository;
  OrderBloc({required this.checkOutRepository}) : super(OrderInitial()) {
    on<OrderEvent>((event, emit) {

    });

    on<GetDataEvent>((event, emit) async{
      emit(ProductLoadingState());
      await Future.delayed(const Duration(seconds: 1));
      try{
        final data = await checkOutRepository.getData();
        emit(ProductLoadedState(data));
      }catch (e){
        emit(ProductErrorState(e.toString()));
      }
    });
  }
}
