import 'package:ecommerceappbloc/NewCode/NavigationBar/Bottom_Navigation_bar.dart';
import 'package:ecommerceappbloc/bloc/auth_bloc/auth_bloc.dart';
import 'package:ecommerceappbloc/bloc/calculateSum/calculate_sum_cubit.dart';
import 'package:ecommerceappbloc/bloc/cart_bloc/cart_bloc.dart';
import 'package:ecommerceappbloc/bloc/checkOut_bloc/order_bloc.dart';
import 'package:ecommerceappbloc/bloc/exports.dart';
import 'package:ecommerceappbloc/bloc/load_data_bloc/product_bloc.dart';
import 'package:ecommerceappbloc/data/repositories/auth_repository.dart';
import 'package:ecommerceappbloc/data/repositories/checkout_repository.dart';
import 'package:ecommerceappbloc/data/repositories/test_repository.dart';
import 'package:ecommerceappbloc/presentation/SignIn/sign_in.dart';
import 'package:ecommerceappbloc/theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // final storage = await HydratedStorage.build(
  //     storageDirectory: await getApplicationDocumentsDirectory()
  // ) ;
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<AuthRepository>(create: (context) => AuthRepository()),
        RepositoryProvider<CheckOutRepository>(create: (context) => CheckOutRepository()),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) =>
              AuthBloc(authRepository: RepositoryProvider.of<AuthRepository>(context))),
          BlocProvider(create: (context) =>
              OrderBloc(checkOutRepository: RepositoryProvider.of<CheckOutRepository>(context))),
          BlocProvider(create: (context) => CartBloc()),
          BlocProvider(create: (context) => CalculateSumCubit()),
          BlocProvider(create: (context) => ProductBloc(testProductRepository: TestProductRepository()))
        ],
        child: RepositoryProvider(
          create: (context) => AuthRepository(),
          child: BlocProvider(
            create: (context) => AuthBloc(
                authRepository: RepositoryProvider.of<AuthRepository>(context),
            ),
            child: ScreenUtilInit(
              designSize: const Size(412, 892),
              builder: (context, child){
                return MaterialApp(
                  theme: appTheme(),
                  debugShowCheckedModeBanner: false,
                  home: StreamBuilder<User?>(
                      stream: FirebaseAuth.instance.authStateChanges(),
                      builder: (context, snapshot){
                        if (snapshot.hasData) {
                          //TabbarScreen();
                          return const TabbarScreen();
                        }
                        return const SignIn();
                      }
                  ),
                );
              },
            )
          ),
        ),
      ),
    );
  }
}
