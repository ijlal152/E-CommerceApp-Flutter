import 'package:add_and_retrieve_data/Models/product_model.dart';
import 'package:add_and_retrieve_data/bloc/bloc/product_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<ProductBloc>(context).add(FetchProductDataEvent());
  }


  @override
  Widget build(BuildContext context) {
    BlocProvider.of<ProductBloc>(context).add(FetchProductDataEvent());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart Screen'),
      ),
      body: SafeArea(
          child: BlocBuilder<ProductBloc, ProductState>(
              builder: (context, state){
                if(state is FetchProductState){
                  List<ProductModel> cartList = state.fetchedData;
                  return ListView.builder(
                      itemCount: cartList.length,
                      itemBuilder: (_, index){
                        int totalprice = cartList[index].qty * cartList[index].price;

                        //print(cartList[index].id);
                        return Card(
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  height: 80,
                                  child: Image(image: NetworkImage(cartList[index].img)),
                                ),
                                SizedBox(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(cartList[index].name, style: const TextStyle(fontWeight: FontWeight.bold),),
                                      const SizedBox(height: 10,),
                                      Text('Price: ${cartList[index].price.toString()} Rs'),
                                      Text('Quantity: ${cartList[index].qty}'),

                                      Text('Total price: $totalprice'),
                                      //Text(cartList[index].id),

                                    ],
                                  ),
                                ),

                                SizedBox(
                                  child: InkWell(
                                    onTap: (){
                                      FirebaseFirestore.instance.collection('cart').doc(cartList[index].id).delete();
                                      setState(() {

                                      });
                                      // String id = DateTime.now().millisecondsSinceEpoch.toString();
                                      // BlocProvider.of<ProductBloc>(context).add(DeleteDataEvent(id: id));

                                    },
                                      child: Icon(Icons.delete_forever, color: Colors.red,)
                                  ),
                                ),

                              ],
                            ),
                          ),
                          // child: ListTile(
                          //   leading: CircleAvatar(
                          //     backgroundImage: Image(
                          //         image: NetworkImage(data[index].img)
                          //     ).image,
                          //   ),
                          //   title: Text('Product: ${data[index].name}'),
                          //   trailing: Text('Price: ${data[index].price}'),
                          //   //subtitle: Text(data[index].lst.toString()),
                          // ),
                        );
                      }
                  );
                }else if(state is ProductLoadingState){
                  return const Center(child: CircularProgressIndicator(),);
                }
                return const Center(child: Text('No item'),);
              }
          )
      ),
    );

  }
}
