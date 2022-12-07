import 'package:ecommerceappbloc/model/popular.dart';
import 'package:flutter/material.dart';

class ProductDetails extends StatelessWidget {
  ProductDetails({Key? key,}) : super(key: key);

  final Product product = Product as Product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            CustomScrollView(
              slivers: [
                SliverAppBar(
                  pinned: true,
                  expandedHeight: 428,
                  leading: IconButton(
                    icon: Image.asset('assets/icons/back@2x.png', scale: 2),
                    onPressed: () => Navigator.pop(context),
                  ),
                  flexibleSpace: FlexibleSpaceBar(
                    background: Container(
                      color: const Color(0xFFeeeeee),
                      child: Image.asset(
                        product.icon,
                        fit: BoxFit.none,
                      ),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ..._buildTitle(),
                        const SizedBox(height: 16),
                        //_buildLine(),
                        const SizedBox(height: 16),
                        //..._buildDescription(),
                        const SizedBox(height: 24),
                        //_buildQuantity(),
                        const SizedBox(height: 115),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            //_buldFloatBar()
          ],
        ),
      ),
    );
  }

  List<Widget> _buildTitle() {
    return <Widget>[
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FittedBox(
            child: Text(
              product.title,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
            ),
          ),
          // IconButton(
          //   onPressed: () => setState(() => _iscollected = !_iscollected),
          //   icon: Image.asset('assets/icons/${_iscollected ? 'bold' : 'light'}/heart@2x.png'),
          //   iconSize: 28,
          // ),
        ],
      ),
      const SizedBox(height: 12),
      Row(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(6)),
              color: Color(0xFFeeeeee),
            ),
            child: const Text(
              '9,742 sold',
              style: TextStyle(fontSize: 10, fontWeight: FontWeight.w500),
            ),
          ),
          const SizedBox(width: 16),
          Image.asset('assets/icons/start@2x.png', height: 20, width: 20),
          const SizedBox(width: 8),
          const Text(
            '4.8 (6,573 reviews)',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    ];
  }

}
