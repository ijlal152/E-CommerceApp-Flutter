import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecommerceappbloc/data/repositories/test_repository.dart';
import 'package:equatable/equatable.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final TestProductRepository testProductRepository;
  ProductBloc({required this.testProductRepository}) : super(ProductInitialState()) {
    on<ProductAddEvent>((event, emit) async{
      emit(ProductAddingState());
      await Future.delayed(const Duration(seconds: 1));
      try{
        await testProductRepository.AddData(name: event.name, price: event.price);
        emit(ProductAddedState());
      }catch (e){
        emit(ProductNotAddedState(e.toString()));
      }
    });
  }
}
