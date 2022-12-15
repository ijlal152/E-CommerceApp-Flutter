
import 'dart:convert';

class CheckOutModel {
  String fullName;
  String phoneNo;
  String address;
  String city;
  String zipCode;
  double totalAmount;
  List productName;
  //List<SofaModel> sofaModelCart;

  CheckOutModel({required this.fullName, required this.phoneNo,
    required this.address, required this.city,
    required this.zipCode, required this.totalAmount,
    required this.productName
  });

  Map<String, dynamic> toMap() {
    return {
      "fullName": fullName,
      "phoneNo": phoneNo,
      "address": address,
      "city": city,
      "zipCode": zipCode,
      "totalAmount": totalAmount,
      "productName": jsonEncode(productName),
    };
  }

  factory CheckOutModel.fromJson(Map<String, dynamic> map) {
    return CheckOutModel(
      fullName: map["fullName"],
      phoneNo: map["phoneNo"],
      address: map["address"],
      city: map["city"],
      zipCode: map["zipCode"],
      totalAmount: double.parse(map["totalAmount"]),
      productName: List.of(map["productName"])
          .map((i) => i /* can't generate it properly yet */)
          .toList(),
    );
  }
//

//

// Map<String, dynamic> toMap() {
  //   return {
  //     "fullName": fullName,
  //     "phoneNo": phoneNo,
  //     "address": address,
  //     "city": city,
  //     "zipCode": zipCode,
  //     "totalAmount": totalAmount,
  //     "sofaModelCart": jsonEncode(sofaModelCart),
  //   };
  // }

  // factory CheckOutModel.fromJson(Map<String, dynamic> map) {
  //   return CheckOutModel(
  //     fullName: map["fullName"],
  //     phoneNo: map["phoneNo"],
  //     address: map["address"],
  //     city: map["city"],
  //     zipCode: map["zipCode"],
  //     totalAmount: double.parse(map["totalAmount"]),
  //     sofaModelCart: List.of(map["sofaModelCart"])
  //         .map((i) => i /* can't generate it properly yet */)
  //         .toList(),
  //   );
  }
//

// Map<String, dynamic> toMap() {
//     return {
//       "fullName": fullName,
//       "phoneNo": phoneNo,
//       "address": address,
//       "city": city,
//       "zipCode": zipCode,
//       "totalAmount" : totalAmount
//     };
//   }

  // factory CheckOutModel.fromJson(Map<String, dynamic> map) {
  //   return CheckOutModel(
  //     fullName: map["fullName"],
  //     phoneNo: map["phoneNo"],
  //     address: map["address"],
  //     city: map["city"],
  //     zipCode: map["zipCode"],
  //     totalAmount: double.parse(map["totalAmount"]),
  //   );
  //
  // }
//

//
