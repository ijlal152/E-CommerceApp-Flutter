part of 'product_bloc.dart';

abstract class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object> get props => [];
}

class ProductAddEvent extends ProductEvent{
  final String name;
  final String price;

  ProductAddEvent(this.name, this.price);
}
