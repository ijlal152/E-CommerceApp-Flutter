part of 'product_bloc.dart';

abstract class ProductEvent extends Equatable {
  //const ProductEvent();

  @override
  List<Object> get props => [];
}

class AddProductEvent extends ProductEvent{
  final String id;
  final String name;
  final int price;
  final String img;
  final int qty;
  final int totolPrice;

  AddProductEvent(this.id ,this.name, this.price, this.img, this.qty, this.totolPrice);
}

class GetData extends ProductEvent{
  GetData();
}

class DeleteDataEvent extends ProductEvent{
  final String id;
  DeleteDataEvent({required this.id});

  @override
  List<Object> get props => [id];
}

class FetchProductDataEvent extends ProductEvent{
  FetchProductDataEvent();
}
