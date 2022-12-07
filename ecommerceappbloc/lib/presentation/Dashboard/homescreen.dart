import 'package:ecommerceappbloc/model/popular.dart';
import 'package:ecommerceappbloc/model/productcard.dart';
import 'package:ecommerceappbloc/presentation/Dashboard/home_header.dart';
import 'package:ecommerceappbloc/presentation/Dashboard/special_offer.dart';
import 'package:ecommerceappbloc/presentation/detail/detail_screen.dart';
import 'package:ecommerceappbloc/presentation/mostpopular/most_popular.dart';
import 'package:ecommerceappbloc/presentation/mostpopular/most_popular_screen.dart';
import 'package:ecommerceappbloc/presentation/special_offer/special_offers_screen.dart';
import 'package:ecommerceappbloc/presentation/widgets/searchfield.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key,}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  late final datas = homePopularProducts;
  //late final productdata = homePopularProducts;


  @override
  Widget build(BuildContext context) {
    const padding = EdgeInsets.fromLTRB(24, 24, 24, 0);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverPadding(
            padding: EdgeInsets.only(top: 24),
            sliver: SliverAppBar(
              pinned: true,
              flexibleSpace: HomeAppBar(),
            ),
          ),
          SliverPadding(
            padding: padding,
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                ((context, index) => _buildBody(context)),
                childCount: 1,
              ),
            ),
          ),
          SliverPadding(
            padding: padding,
            sliver: _buildPopulars(),
          ),
          const SliverAppBar(flexibleSpace: SizedBox(height: 24))
        ],
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Column(
      children: [
        const SearchField(),
        const SizedBox(height: 15),
        SpecialOffers(onTapSeeAll: () => _onTapSpecialOffersSeeAll(context)),
        const SizedBox(height: 15),
        MostPopularTitle(onTapseeAll: () => _onTapMostPopularSeeAll(context)),
        const SizedBox(height: 15),
        const MostPupularCategory(),
      ],
    );
  }
  Widget _buildPopulars() {
    return SliverGrid(
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 185,
        mainAxisSpacing: 24,
        crossAxisSpacing: 16,
        mainAxisExtent: 285,
      ),
      delegate: SliverChildBuilderDelegate(_buildPopularItem, childCount: datas.length),
    );
  }

  Widget _buildPopularItem(BuildContext context, int index) {
    final data = datas[index % datas.length];
    //Product product;
    return ProductCard(
      data: data,
      ontap: (data) => Navigator.push(context,
          MaterialPageRoute(builder: (context)=> ShopDetailScreen())
      ),
    );
  }

  void _onTapMostPopularSeeAll(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => MostPopularScreen()));
  }

  void _onTapSpecialOffersSeeAll(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => SpecialOfferScreen()));
  }

}
