part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class AddProductEvent extends CartEvent {
  final SofaModel cartItem;

  const AddProductEvent(this.cartItem);

  @override
  List<Object> get props => [cartItem];

  // @override
  // String toString() => 'AddProduct { index: $productIndex }';
}

class RemoveProductEvent extends CartEvent {
  final SofaModel cartItem;

  const RemoveProductEvent(this.cartItem);

  @override
  List<Object> get props => [cartItem];

  // @override
  // String toString() => 'RemoveProduct { index: $productIndex }';
}