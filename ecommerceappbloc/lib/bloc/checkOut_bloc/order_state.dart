part of 'order_bloc.dart';

abstract class OrderState extends Equatable {
  //const OrderState();
}

class OrderInitial extends OrderState {
  @override
  List<Object> get props => [];
}

class OrderAddingState extends OrderState{

  @override
  List<Object> get props => [];
}

class OrderAddedState extends OrderState{

  @override
  List<Object> get props => [];
}

class OrderNotAddedState extends OrderState{
  final String errorMessage;
  OrderNotAddedState(this.errorMessage);
  @override
  List<Object> get props => [errorMessage];
}

class ProductLoadingState extends OrderState{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ProductLoadedState extends OrderState{
  List<CheckOutModel> mydata;
  ProductLoadedState(this.mydata);

  @override
  List<Object?> get props => [mydata];
}

class ProductErrorState extends OrderState{
  final String errorMessage;
  ProductErrorState(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}