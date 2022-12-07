import 'package:ecommerceappbloc/presentation/widgets/app_bar.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FRAppBar.defaultAppBar(
        context,
        title: 'Cart Screen',
        actions: [

        ],
      ),
    );
  }
}
