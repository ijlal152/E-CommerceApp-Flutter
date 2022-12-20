import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class TestProductRepository{
  final fireCloud = FirebaseFirestore.instance.collection('TestCollection');
  
  Future<void> AddData({required String name, required String price}) async{
    try{
      await fireCloud.add({"name": name, "price": price});
    }on FirebaseException catch (e){
      if(kDebugMode){
        print("Failed with error '${e.code}' : ${e.message}");
      }
    }catch (e){
      throw Exception(e.toString());
    }
  }
}