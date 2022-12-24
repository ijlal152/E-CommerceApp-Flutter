import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerceappbloc/NewCode/Models/checkout_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CheckOutRepository{
  final firebaseAuth = FirebaseAuth.instance;

  final firebaseFirestore = FirebaseFirestore.instance.collection('UserTable');

  Future<void> PlaceOrder({required String fullName, required String phoneNo,
    required String address, required String city, required String zipCode,
    required double totalAmount, required String productName
  }) async{
    User? user = firebaseAuth.currentUser;
    CheckOutModel checkOutModel = CheckOutModel(
        fullName: fullName,
        phoneNo: phoneNo,
        address: address,
        city: city,
        zipCode: zipCode,
        totalAmount: totalAmount,
        productName: productName
    );
    final firestore = FirebaseFirestore.instance.collection('UserTable')
        .doc(user!.uid)
        .collection('checkOut');
    await firestore.add(checkOutModel.toMap());
    Fluttertoast.showToast(msg: 'Order has been placed');
  }

  Future<List<CheckOutModel>> getData() async{
    List<CheckOutModel> orderList = [];
    try{
      final orderData = await FirebaseFirestore.instance.collection('UserTable').get();
      for (var element in orderData.docs) {
        await firebaseFirestore.doc(element.id).collection('checkOut').get().then((value) {
          for (var element in value.docs) {
            //print(element.data());
            //return fetchedData.add(element.data());
            orderList.add(CheckOutModel.fromJson(element.data()));
            //fetchedData.add(element.data());
          }
        });
      }

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