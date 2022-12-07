
import 'package:bloc/bloc.dart';
import 'package:ecommerceappbloc/NewCode/Models/allModel.dart';
import 'package:ecommerceappbloc/bloc/cart_bloc/cart_state.dart';
import 'package:ecommerceappbloc/bloc/exports.dart';
import 'package:equatable/equatable.dart';

part 'cart_event.dart';

class CartBloc extends Bloc<CartEvent, CartState> {

  CartBloc() : super(CartState()) {
    on<AddProductEvent>(_OnAddProductToCard);
  }

  void _OnAddProductToCard(AddProductEvent event, Emitter<CartState> emit){
    final state = this.state;
    emit(CartState(
      cartItem: List.from(state.cartItem)..add(event.cartItem)
    ));
  }


  @override
  CartState? fromJson(Map<String, dynamic> json) {
    // TODO: implement fromJson
    return CartState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(CartState state) {
    return state.toMap();
  }

}
