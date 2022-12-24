part of 'order_bloc.dart';

abstract class OrderEvent extends Equatable {
  //const OrderEvent();

  @override
  List<Object> get props => [];
}

class AddOrderEvent extends OrderEvent{
  final String fullName;
  final String phoneNo;
  final String address;
  final String city;
  final String zipCode;
  final double sum;
  final String productNames;

  AddOrderEvent(this.fullName, this.phoneNo,
      this.address, this.city, this.zipCode,
      this.sum, this.productNames);
}

class GetDataEvent extends OrderEvent{
  GetDataEvent();
}
