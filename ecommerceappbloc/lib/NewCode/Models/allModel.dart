import 'dart:convert';

import 'package:equatable/equatable.dart';

class SofaModel extends Equatable{
  final String title;
  final double ratingscrore;
  final int sold;
  final double price;
  final int discount;
  final String icon;
  final String description;
  late int qty;
  double totalPrice;
  final String reviews;
  List<String> imgs;
  double totalSum;
  final String id;

  SofaModel(
      this.title,
      this.ratingscrore,
      this.sold,
      this.price,
      this.discount,
      this.icon,
      this.description,
      this.qty,
      this.totalPrice,
      this.reviews,
      this.imgs,
      this.totalSum,
      this.id
      );

  factory SofaModel.fromMap(Map<String, dynamic> map) {
    return SofaModel(
      map["title"] ?? '',
      double.parse(map["ratingscrore"]) ?? 0.0,
      int.parse(map["sold"]) ?? 0,
      double.parse(map["price"]) ?? 0.0,
      int.parse(map["discount"]) ?? 0,
      map["icon"] ?? '',
      map["description"] ?? '',
      map["qty"] ?? '',
      map["totalPrice"] ?? '',
      map["reviews"] ?? '',
      map["imgs"].map((i) => map["imgs"]).toList() ?? '',
      map["totalSum"] ?? '',
      map["id"] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "title": title,
      "ratingscrore": ratingscrore,
      "sold": sold,
      "price": price,
      "discount": discount,
      "icon": icon,
      "description": description,
      "qty" : qty,
      "totalPrice" : totalPrice,
      "reviews": reviews,
      "imgs": jsonEncode(imgs),
      "totalSum" : totalSum,
      "id": id,
    };
  }


  SofaModel copyWith({
  String? title,
    double? ratingscrore,
    int? sold,
    double? price,
    int? discount,
    String? icon,
    String? description,
    int? qty,
    double? totalPrice,
    String? reviews,
    List<String>? imgs,
    double? totalSum,
    String? id,
}){
    return SofaModel(
        title ?? this.title,
        ratingscrore ?? this.ratingscrore,
        sold ?? this.sold,
        price ?? this.price,
        discount ?? this.discount,
        icon ?? this.icon,
        description ?? this.description,
        qty ?? this.qty,
        totalPrice ?? this.totalPrice,
        reviews ?? this.reviews,
        imgs ?? this.imgs,
        totalSum ?? this.totalSum,
        id ?? this.id
    );
  }

  static List<SofaModel> SofaList(){
    return [
      SofaModel(
          'First Sofa',
          4.5,
          300,
          5089,
          25,
          'assets/images/sofa_images/sofa.png',
          'This sofa is so comfortable. Find the best Sofa & Chairs for sale in Pakistan. OLX Pakistan offers online local classified ads for Sofa & Chairs. Post your classified ad for ',
          1,
          1,
          '345',
          const [
            'assets/images/sofa_images/s1.jpg',
            'assets/images/sofa_images/s2.jpg',
            'assets/images/sofa_images/s3.jpg',
          ],
          0,
          '1'
      ),
      SofaModel(
          'Second Sofa',
          4.7,
          244,
          7899,
          30,
          'assets/images/sofa_images/chair-table-living-room.png',
          'This sofa is so comfortable. Find the best Sofa & Chairs for sale in Pakistan. OLX Pakistan offers online local classified ads for Sofa & Chairs. Post your classified ad for ',
          1,
          1,
          '200',
          const [
            'assets/images/sofa_images/s1.jpg',
            'assets/images/sofa_images/s2.jpg',
            'assets/images/sofa_images/s3.jpg',
          ],
          0,
          '2'
      ),
      SofaModel(
          'Third Sofa',
          4.7,
          244,
          7899,
          30,
          'assets/images/sofa_images/a.png',
          'This sofa is so comfortable. Find the best Sofa & Chairs for sale in Pakistan. OLX Pakistan offers online local classified ads for Sofa & Chairs. Post your classified ad for ',
          1,
          1,
          '150',
          const [
            'assets/images/sofa_images/s1.jpg',
            'assets/images/sofa_images/s2.jpg',
            'assets/images/sofa_images/s3.jpg',
          ],
          0,
          '3'
      ),
      SofaModel(
          'Fourth Sofa',
          4.7,
          244,
          7899,
          30,
          'assets/images/sofa_images/b.png',
          'This sofa is so comfortable. Find the best Sofa & Chairs for sale in Pakistan. OLX Pakistan offers online local classified ads for Sofa & Chairs. Post your classified ad for ',
          1,
          1,
          '322',
          [
            'assets/images/sofa_images/s1.jpg',
            'assets/images/sofa_images/s2.jpg',
            'assets/images/sofa_images/s3.jpg',
          ],
          0,
          '4'
      ),
      SofaModel(
          'Fifth Sofa',
          4.7,
          244,
          7899,
          30,
          'assets/images/sofa_images/c.png',
          'This sofa is so comfortable. Find the best Sofa & Chairs for sale in Pakistan. OLX Pakistan offers online local classified ads for Sofa & Chairs. Post your classified ad for ',
          1,
          1,
          '44',
          [
          'assets/images/sofa_images/s1.jpg',
          'assets/images/sofa_images/s2.jpg',
          'assets/images/sofa_images/s3.jpg',
          ],
          0,
          '5'
      ),
    ];
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
    title, description, ratingscrore, sold, price, discount, icon, imgs, description, qty, totalPrice ,reviews, id
  ];

}



class ChairModel{
  final String title;
  final double star;
  final int sold;
  final double price;
  final int discount;
  final String icon;
  final String id;

  ChairModel(
      this.title,
      this.star,
      this.sold,
      this.price,
      this.discount,
      this.icon,
      this.id
      );

  static List<ChairModel> ChairList(){
    return [
      ChairModel(
          'First chair',
          4.5,
          300,
          5089,
          25,
          'assets/images/chair_images/c1.png',
          '1'
      ),
      ChairModel(
          'Second chair',
          4.7,
          244,
          7899,
          30,
          'assets/images/chair_images/c2.png',
          '2'
      ),
      ChairModel(
          'Third chair',
          4.7,
          244,
          7899,
          30,
          'assets/images/chair_images/chair3.png',
          '3'
      ),
      ChairModel(
          'Fourth chair',
          4.7,
          244,
          7899,
          30,
          'assets/images/chair_images/chair4.png',
          '4'
      ),
      ChairModel(
          'Fifth chair',
          4.7,
          244,
          7899,
          30,
          'assets/images/chair_images/chair5.png',
          '5'
      ),
    ];
  }

}


class TableModel{
  final String title;
  final double star;
  final int sold;
  final double price;
  final int discount;
  final String icon;
  final String id;

  TableModel(
      this.title,
      this.star,
      this.sold,
      this.price,
      this.discount,
      this.icon,
      this.id
      );

  static List<TableModel> TableList(){
    return [
      TableModel(
          'First table',
          4.5,
          300,
          5089,
          25,
          'assets/images/table_images/t1.png',
          '1'
      ),
      TableModel(
          'Second table',
          4.7,
          244,
          7899,
          30,
          'assets/images/table_images/t2.png',
          '2'
      ),
      TableModel(
          'Third table',
          4.7,
          244,
          7899,
          30,
          'assets/images/table_images/t3.png',
          '3'
      ),

    ];
  }

}


class KitchenModel{
  final String title;
  final double star;
  final int sold;
  final double price;
  final int discount;
  final String icon;
  final String id;

  KitchenModel(
      this.title,
      this.star,
      this.sold,
      this.price,
      this.discount,
      this.icon,
      this.id
      );

  static List<KitchenModel> KitchenList(){
    return [
      KitchenModel(
          'First Kitchen',
          4.5,
          300,
          5089,
          25,
          'assets/images/kitchen_images/k1.png',
          '1'
      ),
      KitchenModel(
          'Second kitchen',
          4.7,
          244,
          7899,
          30,
          'assets/images/kitchen_images/k2.png',
          '2'
      ),
      KitchenModel(
          'Third kitchen',
          4.7,
          244,
          7899,
          30,
          'assets/images/kitchen_images/k3.png',
          '3'
      ),

    ];
  }

}

