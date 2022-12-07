import 'package:flutter/material.dart';

class SelectedProducts {
  String productImage;
  String productName;
  String reviews;
  int noOfSold;
  int price;

  SelectedProducts(
    this.productImage,
    this.productName,
    this.reviews,
    this.noOfSold,
    this.price,);

  static List<SelectedProducts> generateProducts(){
    return [
      SelectedProducts(
          'assets/icons/category_chair@2x.png',
          'Chair',
          'Better',
          33,
          400
      ),
      SelectedProducts(
          'assets/icons/category_vase@2x.png',
          'Vase',
          'Good',
          50,
          200
      ),
      SelectedProducts(
          'assets/icons/category_lamp@2x.png',
          'Lamp',
          'Good',
          33,
          700
      ),
    ];
  }

}
