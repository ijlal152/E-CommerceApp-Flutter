part of 'product_bloc.dart';

abstract class ProductState extends Equatable {

}

class ProductInitialState extends ProductState {
  @override
  List<Object> get props => [];
}

class ProductAddingState extends ProductState{
  @override
  List<Object> get props => [];
}
class ProductAddedState extends ProductState{
  @override
  List<Object> get props => [];
}
class ProductNotAddedState extends ProductState{
  final String error;
  ProductNotAddedState(this.error);
  @override
  List<Object> get props => [error];
}
