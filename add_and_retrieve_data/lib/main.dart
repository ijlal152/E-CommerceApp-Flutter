import 'package:add_and_retrieve_data/bloc/bloc/product_bloc.dart';
import 'package:add_and_retrieve_data/homepage.dart';
import 'package:add_and_retrieve_data/repository/product_repo.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final storage = await HydratedStorage.build(
      storageDirectory: await getApplicationDocumentsDirectory()
  ) ;
  HydratedBlocOverrides.runZoned(() {
    runApp(const MyApp());
  }, storage: storage);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductBloc(productRepository: ProductRepository()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: RepositoryProvider(
          create: (context) => ProductRepository(),
          child: Home(),
        ),
      ),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: BlocListener<ProductBloc, ProductState>(
            listener: (context, state) {
              if (state is ProductAddedState) {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Product Added')));
              }
            },
            child: BlocBuilder<ProductBloc, ProductState>(
                builder: (context, state) {
                  if (state is ProductAddingState) {
                    return const Center(child: CircularProgressIndicator(),);
                  } else if (state is ProductNotAddedState) {
                    return const Center(child: Text('Error'),);
                  }
                  return const HomePage();
                }
            ),
          )
      ),
    );
  }
}
