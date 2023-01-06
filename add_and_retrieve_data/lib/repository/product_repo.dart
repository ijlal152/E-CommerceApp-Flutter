import 'package:add_and_retrieve_data/Models/product_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class ProductRepository{
  final fireCloud = FirebaseFirestore.instance.collection('cart');

  Future<void> deleteData(String id) async{
    fireCloud.doc(id).delete().then((value) {
      print('Data deleted');
    });
  }

  
  Future<void> AddData(
      {required String id ,required String name,
    required int price,
        required int qty,
    required int totalPrice, 
    required String img}
      ) async{
    try{
      //await fireCloud.add({"id": id ,"name": name, "price": price, "totalPrice" : totalPrice, "qty":qty, "img" : img});
      String id = DateTime.now().millisecondsSinceEpoch.toString();
      await FirebaseFirestore.instance.collection('cart').doc(id).set({
        'productID' : id,
        "name": name,
        "price": price,
        "totalPrice" : totalPrice,
        "qty":qty,
        "img" : img
      });
    }on FirebaseException catch (e){
      if(kDebugMode){
        print("Failed with error '${e.code}' : ${e.message}");
      }
    }catch (e){
      throw Exception(e.toString());
    }
  }

  // fetch cart products from firebase
  Future<List<ProductModel>> getCardData() async{
    List<ProductModel> cartListData = [];
    try{
      final pro = await FirebaseFirestore.instance.collection('cart').get();
      pro.docs.forEach((element) {
        cartListData.add(ProductModel.fromJson(element.data()));
        //print(cartListData);
      });
      return cartListData;
    } on FirebaseException catch(e){
      if(kDebugMode){
        print("Failed with error: '${e.code}': ${e.message}");
      }
      return cartListData;
    }catch(e){
      throw Exception(e.toString());
    }
  }


  // fetch products from firebase
  Future<List<ProductModel>> get() async {
    List<ProductModel> proList = [];
    try{
      final pro = await FirebaseFirestore.instance.collection('TestDatabase').get();
      for (var element in pro.docs) {
        proList.add(ProductModel.fromJson(element.data()));
        //print(proList);
      }
      return proList;
    } on FirebaseException catch(e){
      if(kDebugMode){
        //print("Failed with error: '${e.code}': ${e.message}");
      }
      return proList;
    } catch(e){
      throw Exception(e.toString());
    }
  }
  
}