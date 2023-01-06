import 'package:add_and_retrieve_data/Models/product_model.dart';
import 'package:add_and_retrieve_data/bloc/bloc/product_bloc.dart';
import 'package:add_and_retrieve_data/cartScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    super.initState();
    BlocProvider.of<ProductBloc>(context).add(GetData());
  }
  
  @override
  Widget build(BuildContext context) {
    //BlocProvider.of<ProductBloc>(context).add(GetData());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Firebase Firestore'),
        //centerTitle: true,
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => CartScreen())).then((_) { setState(() {
            }); });
          }, icon: const Icon(Icons.add_shopping_cart_outlined, color: Colors.white,))
        ],
      ),

      body: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state){
          if(state is ProductLoadedState){
            List<ProductModel> data = state.mydata;
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (_, index){
                int totalprice = data[index].qty * data[index].price;

                void _postData(context) {
                  String id = DateTime.now().millisecondsSinceEpoch.toString();
                  BlocProvider.of<ProductBloc>(context)
                      .add(AddProductEvent(
                    id,
                      data[index].name,
                      data[index].price,
                      data[index].img,
                      data[index].qty,
                      totalprice
                  ));
                }

                return Card(
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: 80,
                          child: Image(image: NetworkImage(data[index].img)),
                        ),
                        SizedBox(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(data[index].name, style: const TextStyle(fontWeight: FontWeight.bold),),
                              //const SizedBox(height: 10,),
                              Text('Price: ${data[index].price.toString()} Rs'),
                              
                              Row(
                                children:  [
                                  InkWell(
                                    onTap : (){
                                      //data[index].qty ++;
                                      setState(() {
                                        data[index].qty --;
                                      });
                                    },
                                      child: data[index].qty >= 1 ? const Icon(Icons.remove_circle) : Container(child: Text('No'),)
                                  ),
                                  const SizedBox(width: 6,),
                                  //Text(qty.toString()),
                                  Text(data[index].qty.toString()),
                                  const SizedBox(width: 6,),

                                  InkWell(
                                    onTap: (){
                                      setState(() {
                                        data[index].qty ++;
                                      });
                                    },
                                      child: const Icon(Icons.add_circle)),
                                ],
                              ),

                              const SizedBox(height: 10,),

                              //Text('Total price: $totalprice'),
                              
                            ],
                          ),
                        ),

                        ElevatedButton(onPressed: (){
                          _postData(context);
                        }, child: const Text('Add to cart')),
                        // SizedBox(height: 10,),
                      ],
                    ),
                  ),
                );
              }
              );
          } else if(state is ProductLoadingState){
            return const Center(child: CircularProgressIndicator(),);
          }else{
            return Container();
          }
        }
        ),

    );
  }
}