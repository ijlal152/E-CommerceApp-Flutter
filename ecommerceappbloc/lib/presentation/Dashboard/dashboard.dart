import 'package:ecommerceappbloc/bloc/auth_bloc/auth_bloc.dart';
import 'package:ecommerceappbloc/presentation/Dashboard/homescreen.dart';
import 'package:ecommerceappbloc/presentation/Dashboard/profile_screen.dart';
import 'package:ecommerceappbloc/presentation/SignIn/sign_in.dart';
import 'package:ecommerceappbloc/presentation/bottomnavscreens/TestScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {


  @override
  Widget build(BuildContext context) {
    // Getting the user from the FirebaseAuth Instance
    const padding = EdgeInsets.fromLTRB(24, 24, 24, 0);
    final user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      //drawer: Drawer(),
      appBar: AppBar(
        title: const Text('Dashboard', style: TextStyle(color: Colors.black),),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is UnAuthenticatedState) {
            // Navigate to the sign in screen when the user Signs Out
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => const SignIn()),
                  (route) => false,
            );
          }
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Email: \n ${user.email}',
                style: const TextStyle(fontSize: 24),
                textAlign: TextAlign.center,
              ),
              user.photoURL != null
                  ? Image.network("${user.photoURL}")
                  : Container(),
              user.displayName != null
                  ? Text("${user.displayName}")
                  : Container(),
              const SizedBox(height: 16),
              ElevatedButton(
                child: const Text('Sign Out'),
                onPressed: () {
                  // Signing out the user
                  context.read<AuthBloc>().add(SignOutRequested());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
