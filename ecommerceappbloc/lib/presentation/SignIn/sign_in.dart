import 'package:ecommerceappbloc/bloc/auth_bloc/auth_bloc.dart';
import 'package:ecommerceappbloc/presentation/Dashboard/dashboard.dart';
import 'package:ecommerceappbloc/presentation/SingUp/sign_up.dart';
import 'package:ecommerceappbloc/presentation/tabbar.dart';
import 'package:ecommerceappbloc/presentation/widgets/bezierContainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:email_validator/email_validator.dart';


class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthenticatedState) {
            // Navigating to the dashboard screen if the user is authenticated
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const FBTabbarScreen()));
          }
          if (state is AuthErrorState) {
            // Showing the error message if the user has entered invalid credentials
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.error)));
          }
        },
        child: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            if (state is LoadingState) {
              // Showing the loading indicator while the user is signing in
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is UnAuthenticatedState) {
              // Showing the sign in form if the user is not authenticated
              return SizedBox(
                height: height,
                child: Stack(
                  children: [
                    Positioned(
                        top: -MediaQuery.of(context).size.height * .15,
                        right: -MediaQuery.of(context).size.width * .4,
                        child: const BezierContainer()
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                      child: SingleChildScrollView(
                        reverse: true,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(height: 140,),
                            _title(),
                            const SizedBox(
                              height: 30,
                            ),
                            Center(
                              child: Form(
                                key: _formKey,
                                child: Column(
                                  children: [
                                    TextFormField(
                                      keyboardType: TextInputType.emailAddress,
                                      controller: _emailController,
                                      decoration: InputDecoration(
                                        hintText: "Email",
                                          fillColor: Color(0xfff3f3f4),
                                          filled: true,
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(20),
                                          borderSide: const BorderSide(
                                              width: 0,
                                              style: BorderStyle.none
                                          ),
                                        ),
                                        contentPadding: const EdgeInsets.symmetric(
                                          vertical: 0,
                                          horizontal: 20,
                                        ),
                                          prefixIcon: const Icon(Icons.email_outlined)
                                      ),
                                      autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                      validator: (value) {
                                        return value != null &&
                                            !EmailValidator.validate(value)
                                            ? 'Enter a valid email'
                                            : null;
                                      },
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    TextFormField(
                                      keyboardType: TextInputType.text,
                                      controller: _passwordController,
                                      decoration: InputDecoration(
                                        hintText: "********",
                                        fillColor: Color(0xfff3f3f4),
                                        filled: true,
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(20),
                                          borderSide: BorderSide(
                                              width: 0,
                                              style: BorderStyle.none
                                          ),
                                        ),
                                        contentPadding: EdgeInsets.symmetric(
                                          vertical: 0,
                                          horizontal: 20,
                                        ),
                                        prefixIcon: Icon(Icons.key_outlined),
                                      ),
                                      autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                      validator: (value) {
                                        return value != null && value.length < 6
                                            ? "Enter min. 6 characters"
                                            : null;
                                      },
                                    ),
                                    const SizedBox(
                                      height: 16,
                                    ),
                                    GestureDetector(
                                      onTap: () =>
                                          _authenticateWithEmailAndPassword(
                                              context),
                                      child: Container(
                                          width: MediaQuery.of(context)
                                              .size
                                              .width *
                                              0.7,
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 10),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                              const BorderRadius.all(
                                                  Radius.circular(5)),
                                              boxShadow: <BoxShadow>[
                                                BoxShadow(
                                                    color: Colors.grey.shade200,
                                                    offset: const Offset(2, 4),
                                                    blurRadius: 5,
                                                    spreadRadius: 2)
                                              ],
                                              gradient: const LinearGradient(
                                                  begin: Alignment.centerLeft,
                                                  end: Alignment.centerRight,
                                                  colors: [
                                                    Color(0xfffbb448),
                                                    Color(0xfff7892b)
                                                  ])),
                                          child: const Center(
                                            child: Text(
                                              'Sign In',
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.white),
                                            ),
                                          )),
                                    ),
                                    SizedBox(height: 15,),
                                    const Text("Or"),
                                    const Divider(thickness: 1,),
                                    SizedBox(height: 15,),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context)
                                  .size
                                  .width *
                                  0.7,
                              padding: const EdgeInsets.all(10),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Text("Already have an account?", style: TextStyle(
                                      fontWeight: FontWeight.bold
                                  ),
                                  ),
                                  TextButton(
                                      onPressed: (){
                                        Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => const SignUp()),
                                        );},
                                      child: const Text('Sign Up', style: TextStyle(
                                          fontWeight: FontWeight.bold
                                      ),)
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                        top: MediaQuery.of(context).size.height * .85,
                        right: MediaQuery.of(context).size.width * .4,
                        child: const BezierContainer()
                    ),
                  ],
                ),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }

  Widget _title() {
    return RichText(
      textAlign: TextAlign.center,
      text: const TextSpan(
          text: 'd',
          style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w700,
              color: Color(0xffe46b10)),
          children: [
            TextSpan(
              text: 'ev',
              style: TextStyle(color: Colors.black, fontSize: 30),
            ),
            TextSpan(
              text: 'rnz',
              style: TextStyle(color: Color(0xffe46b10), fontSize: 30),
            ),
          ]),
    );
  }

  void _authenticateWithEmailAndPassword(context) {
    if (_formKey.currentState!.validate()) {
      BlocProvider.of<AuthBloc>(context).add(
        SignInRequested(email: _emailController.text, password: _passwordController.text)
      );
    }
  }

  // void _authenticateWithGoogle(context) {
  //   BlocProvider.of<AuthBloc>(context).add(
  //     GoogleSignInRequested(),
  //   );
  // }
}
