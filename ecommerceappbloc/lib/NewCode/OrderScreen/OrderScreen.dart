import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerceappbloc/NewCode/Models/checkout_model.dart';
import 'package:ecommerceappbloc/bloc/checkOut_bloc/order_bloc.dart';
import 'package:ecommerceappbloc/bloc/load_data_bloc/product_bloc.dart';
import 'package:ecommerceappbloc/data/repositories/checkout_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}


class _OrderScreenState extends State<OrderScreen> {

  final _firebaseAuth = FirebaseAuth.instance;
  late final firestore;

  User? user;
  CollectionReference? reference;

  late OrderBloc orderBloc;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  final firebaseAuth = FirebaseAuth.instance;


  @override
  void initState() {
    super.initState();
    //orderBloc = OrderBloc(checkOutRepository: CheckOutRepository());
    //orderBloc.add(GetDataEvent());
    User? user = firebaseAuth.currentUser;
    // firebaseFirestore.collection('UserTable').doc(user!.uid).collection('checkOut').get().then((value) => {
    //   value.docs.forEach((result) {
    //     print(result.data());
    //   })
    // });
    BlocProvider.of<OrderBloc>(context).add(GetDataEvent());
  }

  final GlobalKey<ScaffoldState> _Scaffoldkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    //BlocProvider.of<OrderBloc>(context).add(GetDataEvent());
    return Scaffold(
      key: _Scaffoldkey,
      appBar: AppBar(
        title: const Text('Your orders', style: TextStyle(
          color: Colors.black,
        ),
        ),
      ),
      body: BlocBuilder<OrderBloc, OrderState>(
        builder: (context, state) {
          //BlocProvider.of<OrderBloc>(context).add(GetDataEvent());
          if (state is ProductLoadedState) {
            List<CheckOutModel> data = state.mydata;
            //print('Fetched Data is: $data');
            return ListView.builder(
                itemCount: data.length,
                itemBuilder: (_, index) {
                  return Card(
                    child: ListTile(
                      title: Text(data[index].productName.toString(),
                        style: const TextStyle(color: Colors.black),),
                      trailing: Text(data[index].totalAmount.toString(),
                        style: const TextStyle(color: Colors.black),),
                    ),
                  );
                }
            );
          } else if (state is ProductLoadingState) {
            return const Center(
              child: CircularProgressIndicator(color: Colors.green,),);
          } else {
            return const Center(child: Text('No Order'),);
          }
        },
      ),
    );
  }
}
