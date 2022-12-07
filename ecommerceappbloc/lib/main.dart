import 'package:ecommerceappbloc/NewCode/NavigationBar/Bottom_Navigation_bar.dart';
import 'package:ecommerceappbloc/bloc/auth_bloc/auth_bloc.dart';
import 'package:ecommerceappbloc/bloc/cart_bloc/cart_bloc.dart';
import 'package:ecommerceappbloc/bloc/counter_bloc/counter_bloc.dart';
import 'package:ecommerceappbloc/bloc/exports.dart';
import 'package:ecommerceappbloc/data/repositories/auth_repository.dart';
import 'package:ecommerceappbloc/presentation/Dashboard/dashboard.dart';
import 'package:ecommerceappbloc/presentation/SignIn/sign_in.dart';
import 'package:ecommerceappbloc/presentation/tabbar.dart';
import 'package:ecommerceappbloc/theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:path_provider/path_provider.dart';


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
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthBloc(authRepository: RepositoryProvider.of<AuthRepository>(context))),
        BlocProvider(create: (context) => CartBloc()),
        BlocProvider(create: (context) => CounterBloc()),
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
                        return const TabbarScreen();
                      }
                      return SignIn();
                    }
                ),
              );
            },
          )
        ),
      ),
    );
  }
}
