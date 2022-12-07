import 'package:ecommerceappbloc/bloc/exports.dart';

class CartState extends Equatable{
  final List<SofaModel> cartItem;
  CartState({
    this.cartItem = const <SofaModel>[]
  });

  @override
  List<Object> get props => [cartItem];

  Map<String, dynamic> toMap(){
    return {
      'cartItem': cartItem.map((e) => e.toMap()).toList(),
    };
  }

  factory CartState.fromMap(Map<String, dynamic> map) {
    return CartState(
      cartItem: List<SofaModel>.from(map['cartItem'].map((x) => SofaModel.fromMap(x))),
    );
  }
//
}




class ProductAddedState extends CartState {
  final List<SofaModel> cartItem;

  ProductAddedState({required this.cartItem}) : super(cartItem: cartItem);

  @override
  List<Object> get props => [cartItem];

  @override
  String toString() => 'ProductAdded { todos: $cartItem }';
}

class ProductRemovedState extends CartState {
  final List<SofaModel> cartItem;

  ProductRemovedState({required this.cartItem}) : super(cartItem: cartItem);

  @override
  List<Object> get props => [cartItem];

  @override
  String toString() => 'ProductRemoved { todos: $cartItem }';
}