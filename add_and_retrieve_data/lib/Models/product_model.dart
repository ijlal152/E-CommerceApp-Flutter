
class ProductModel{
  final String id;
  final String name;
  final int price;
  final String img;
  late int qty;
  //final List<String> lst;

  ProductModel({required this.id,required this.name, required this.price, required this.img, required this.qty});

  factory ProductModel.fromJson(Map<String, dynamic> json){
    return ProductModel(
      id: json['productID'],
      name: json['name'], 
      price: json['price'],
      img: json['img'],
      qty: json['qty'],
      //lst: json['lst']
      );
  }
}