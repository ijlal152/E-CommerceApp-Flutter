import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerceappbloc/NewCode/Models/checkout_model.dart';
import 'package:flutter/foundation.dart';

class CheckOutRepository{
  final firebaseFirestore = FirebaseFirestore.instance.collection('UserTable');

  Future<void> PlaceOrder() async{

  }

  Future<List<CheckOutModel>> getData() async{
    List<CheckOutModel> orderList = [];

    try{
      //final firebaseAuth = FirebaseAuth.instance;
      //User? user = firebaseAuth.currentUser;
      final orderData = await FirebaseFirestore.instance.collection('UserTable').get();
      orderData.docs.forEach((element) { 
        firebaseFirestore.doc(element.id).collection('checkOut').get().then((value) {
          value.docs.forEach((element) {
            print(element.data());
            //return fetchedData.add(element.data());
            return orderList.add(CheckOutModel.fromJson(element.data()));
            //fetchedData.add(element.data());
          });
        });
      });

      // orderdata.docs.forEach((element) {
      //   return orderList.add(CheckOutModel.fromJson(element.data()));
      // });
      //print('Data from firestore $orderList');
      return orderList;
    } on FirebaseException catch (e){
      if(kDebugMode){
        print("Failed with error '${e.code}': ${e.message}");
      }
      return orderList;
    } catch (e){
      throw Exception(e.toString());
    }
  }



}