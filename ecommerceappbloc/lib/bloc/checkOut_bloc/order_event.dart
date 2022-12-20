part of 'order_bloc.dart';

abstract class OrderEvent extends Equatable {
  //const OrderEvent();

  @override
  List<Object> get props => [];
}

class GetDataEvent extends OrderEvent{
  GetDataEvent();
}
