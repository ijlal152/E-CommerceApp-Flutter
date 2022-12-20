import 'package:ecommerceappbloc/bloc/load_data_bloc/product_bloc.dart';
import 'package:ecommerceappbloc/data/repositories/test_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TestHomePage extends StatefulWidget {
  const TestHomePage({Key? key}) : super(key: key);

  @override
  State<TestHomePage> createState() => _TestHomePageState();
}

class _TestHomePageState extends State<TestHomePage> {

  final nameController = TextEditingController();
  final priceController = TextEditingController();

  Future<void> _create() async{
    await showModalBottomSheet(
      isScrollControlled: true,
        context: context,
        builder: (BuildContext ctx){
          return Padding(
              padding: EdgeInsets.only(
                top: 20.h,
                left: 20.w,
                right: 20.w,
                bottom: MediaQuery.of(ctx).viewInsets.bottom + 20
              ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(labelText: 'Name'),
                ),
                TextField(
                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                  controller: priceController,
                  decoration: const InputDecoration(labelText: 'Price'),
                ),
                SizedBox(height: 20.h,),

                ElevatedButton(
                    onPressed: () async{
                      final String name = nameController.text;
                      final double? price = double.parse(priceController.text);
                      if(price != null){
                        _postData(context);

                        nameController.text = '';
                        priceController.text = '';

                        Navigator.of(context).pop();
                      }
                    },
                    child: Text('Add Data')),
              ],
            ),
          );
        }
    );
  }

  void _postData(context){
    BlocProvider.of<ProductBloc>(context).add(ProductAddEvent(nameController.text, priceController.text));
  }


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) => ProductBloc(testProductRepository: RepositoryProvider.of<TestProductRepository>(context)),
  child: Scaffold(
      appBar: AppBar(
        title: const Text('Firebase Firestore', style: TextStyle(
          color: Colors.black
        ),),
        centerTitle: true,
      ),
      body: BlocListener<ProductBloc, ProductState>(
  listener: (context, state) {
    if(state is ProductAddedState){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Data Added Successfully')));
    }
  },
  child: BlocBuilder<ProductBloc, ProductState>(
  builder: (context, state) {
    if(state is ProductAddingState){
      return const Center(child: CircularProgressIndicator(),);
    }else if(state is ProductNotAddedState){
      return const Center(child: Text('Error'),);
    }
    return Container();
  },
),
),


      floatingActionButton: FloatingActionButton(
          onPressed: () => _create(),
              child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    ),
);
  }
}
